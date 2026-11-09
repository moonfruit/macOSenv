"""解析 Ash Loon 插件；由 ash.sh 负责下载和退出码约定。"""
import json
import os
from pathlib import Path
import re
import stat
import sys
import tempfile

DOMAIN = r'(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z][a-z0-9-]*'
HOST = re.compile(r'\*\.(' + DOMAIN + r')\s*=\s*server:https://(' + DOMAIN + r')/dns-query', re.I)


def update(plugin, target):
    section = None
    domains, servers, warnings = set(), set(), []
    for number, raw in enumerate(plugin.splitlines(), 1):
        line = raw.strip()
        if not line or line.startswith(('#', ';', '//')):
            continue
        if line.startswith('[') and line.endswith(']'):
            section = line
            if section not in ('[General]', '[Host]'):
                warnings.append(f'line {number}: unexpected section {line}')
            continue
        if section == '[General]' and re.fullmatch(r'dns-server\s*=\s*[0-9a-fA-F:.,\s]+', line):
            continue
        match = HOST.fullmatch(line) if section == '[Host]' else None
        if match:
            domains.add('.' + match[1].lower())
            servers.add(match[2].lower())
        else:
            warnings.append(f'line {number}: unexpected rule {line}')
    for warning in warnings:
        print(f'Warning: {warning}', file=sys.stderr)
    if not domains or len(servers) != 1:
        raise ValueError('expected wildcard Host rules with exactly one HTTPS DNS server')

    # 保留 JSON 字符串中的 //（例如 https://），仅移除字符串之外的注释。
    original = target.read_text()
    plain = re.sub(r'"(?:\\.|[^"\\])*"|//[^\n]*|/\*[\s\S]*?\*/',
                   lambda m: m[0] if m[0].startswith('"') else ' ', original)
    config = json.loads(plain)
    dns = config['dns']
    selected = [s for s in dns['servers'] if s.get('tag') == 'dns-ash']
    rules = [r for r in dns['rules'] if r.get('server') == 'dns-ash']
    if len(selected) != 1 or selected[0].get('type') != 'https' or not rules:
        raise ValueError('expected one HTTPS dns-ash server and existing dns-ash suffix rules')
    if any(set(r) != {'server', 'domain_suffix'} or
           not isinstance(r['domain_suffix'], list) or
           not all(isinstance(d, str) for d in r['domain_suffix']) for r in rules):
        raise ValueError('unexpected local dns-ash rule structure; refusing to broaden rules')
    before = json.dumps(config, sort_keys=True)
    selected[0]['server'] = next(iter(servers))
    # 多条已有规则保留各自域名，新域名只添加到第一条，避免重复。
    existing = {d for r in rules for d in r['domain_suffix']}
    for rule in rules:
        rule['domain_suffix'] = sorted(set(rule['domain_suffix']))
    rules[0]['domain_suffix'] = sorted(set(rules[0]['domain_suffix']) | (domains - existing))
    if json.dumps(config, sort_keys=True) == before:
        return False, warnings
    temporary = None
    try:
        with tempfile.NamedTemporaryFile(mode='w', dir=target.parent, prefix='.ash-', delete=False) as out:
            temporary = Path(out.name)
            out.write(json.dumps(config, ensure_ascii=False, indent=2) + '\n')
        temporary.chmod(stat.S_IMODE(target.stat().st_mode))
        os.replace(temporary, target)
    finally:
        if temporary is not None:
            temporary.unlink(missing_ok=True)
    return True, warnings


if __name__ == '__main__':
    try:
        changed, _ = update(Path(sys.argv[1]).read_text(), Path(sys.argv[2]))
    except (OSError, ValueError, KeyError, TypeError) as error:
        print(f'Failed to update ash.json: {error}', file=sys.stderr)
        sys.exit(1)
    sys.exit(0 if changed else 2)
