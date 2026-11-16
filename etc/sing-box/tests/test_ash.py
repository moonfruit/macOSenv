"""Ash 插件离线解析与配置合并测试。"""
import importlib.util
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest

MODULE = Path(__file__).resolve().parents[1] / 'ash.py'


class AshTest(unittest.TestCase):
    def run_update(self, plugin, config=None):
        spec = importlib.util.spec_from_file_location('ash', MODULE)
        ash = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(ash)
        with tempfile.TemporaryDirectory() as tmp:
            target = Path(tmp) / 'ash.json'
            original = json.dumps(config or {
                'dns': {'servers': [{'tag': 'dns-ash', 'type': 'https',
                                    'server': 'old.example', 'domain_resolver': 'dns-resolver'}],
                        'rules': [{'server': 'dns-ash', 'domain_suffix': ['.z.example']},
                                  {'server': 'other', 'domain': ['keep.example']}]}})
            target.write_text(original)
            try:
                changed, warnings = ash.update(plugin, target)
            except ValueError:
                self.assertEqual(target.read_text(), original)
                raise
            result = json.loads(target.read_text())
            second, _ = ash.update(plugin, target)
            self.assertFalse(second)
            return changed, warnings, result

    def test_merge_and_preserve(self):
        changed, warnings, result = self.run_update(
            '#!name=Ash\r\n[General]\r\ndns-server=223.5.5.5, 119.29.29.29\r\n'
            '[Host]\r\n*.b.example = server:https://dns.example/dns-query\r\n'
            '*.a.example = server:https://dns.example/dns-query\r\n')
        self.assertTrue(changed)
        self.assertEqual(warnings, [])
        self.assertEqual(result['dns']['servers'][0]['server'], 'dns.example')
        self.assertEqual(result['dns']['servers'][0]['domain_resolver'], 'dns-resolver')
        self.assertEqual(result['dns']['rules'][0]['domain_suffix'],
                         ['.a.example', '.b.example', '.z.example'])
        self.assertEqual(result['dns']['rules'][1], {'server': 'other', 'domain': ['keep.example']})

    def test_unexpected_rules_warn(self):
        _, warnings, _ = self.run_update(
            '[Host]\n*.a.example = server:https://dns.example/dns-query\n'
            'foo.example = 1.2.3.4\n[Rule]\nDOMAIN,foo.example,DIRECT\n')
        self.assertTrue(any('foo.example = 1.2.3.4' in w for w in warnings))
        self.assertTrue(any('DOMAIN,foo.example,DIRECT' in w for w in warnings))

    def test_doh_bootstrap_rule_is_already_covered(self):
        for bootstrap_first in (True, False):
            with self.subTest(bootstrap_first=bootstrap_first):
                lines = ['DNS.example = server:223.5.5.5',
                         '*.a.example = server:https://dns.example/dns-query']
                if not bootstrap_first:
                    lines.reverse()
                _, warnings, result = self.run_update('[Host]\n' + '\n'.join(lines))
                self.assertEqual(warnings, [])
                self.assertEqual(result['dns']['rules'][0]['domain_suffix'],
                                 ['.a.example', '.z.example'])
                self.assertEqual(result['dns']['servers'][0]['domain_resolver'], 'dns-resolver')

    def test_unknown_bootstrap_rules_still_warn(self):
        for rule in ('other.example = server:223.5.5.5',
                     'dns.example = server:1.1.1.1',
                     'dns.example = server:223.5.5.5, 1.1.1.1'):
            with self.subTest(rule=rule):
                _, warnings, _ = self.run_update(
                    '[Host]\n' + rule + '\n'
                    '*.a.example = server:https://dns.example/dns-query\n')
                self.assertEqual(len(warnings), 1)
                self.assertIn(rule, warnings[0])

    def test_invalid_or_conflicting_plugin_preserves_file(self):
        for plugin in ('<html>error</html>', '[Host]\n',
                       '[Host]\n*.a.example = server:https://one.example/dns-query\n'
                       '*.b.example = server:https://two.example/dns-query\n'):
            with self.subTest(plugin=plugin), self.assertRaises(ValueError):
                self.run_update(plugin)

    def test_download_failure_preserves_file(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            shutil.copyfile(MODULE.with_suffix('.sh'), root / 'ash.sh')
            (root / 'config').mkdir()
            target = root / 'config/ash.json'
            target.write_text('original')
            curl = root / 'curl'
            curl.write_text('#!/usr/bin/env bash\nexit 22\n')
            curl.chmod(0o755)
            temporary = root / 'temp'
            temporary.mkdir()
            result = subprocess.run(['bash', str(root / 'ash.sh')],
                                    env={**os.environ, 'ENV': str(MODULE.parents[2]),
                                         'TMPDIR': str(temporary),
                                         'PATH': f'{root}:{os.environ["PATH"]}'},
                                    capture_output=True, text=True)
            self.assertEqual(result.returncode, 1)
            self.assertIn('Failed to download', result.stdout + result.stderr)
            self.assertEqual(target.read_text(), 'original')
            self.assertEqual(list(temporary.iterdir()), [])

    def test_cli_unchanged_exit_code(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            plugin = root / 'plugin.lpx'
            plugin.write_text('[Host]\n*.silverleafglow.com = server:https://dns.ashsub.com/dns-query\n')
            target = root / 'ash.json'
            target.write_text(json.dumps({'dns': {
                'servers': [{'tag': 'dns-ash', 'type': 'https', 'server': 'dns.ashsub.com'}],
                'rules': [{'server': 'dns-ash', 'domain_suffix': ['.silverleafglow.com']}]}}))
            original = target.read_bytes()
            result = subprocess.run(['/opt/homebrew/bin/python3', str(MODULE), str(plugin), str(target)],
                                    capture_output=True, text=True)
            self.assertEqual(result.returncode, 2, result.stderr)
            self.assertEqual(target.read_bytes(), original)

    def test_conditional_download_and_visible_config_diff(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            for name in ('ash.sh', 'ash.py'):
                shutil.copyfile(MODULE.parent / name, root / name)
            (root / 'config').mkdir()
            target = root / 'config/ash.json'
            target.write_text(json.dumps({'dns': {
                'servers': [{'tag': 'dns-ash', 'type': 'https', 'server': 'old.example'}],
                'rules': [{'server': 'dns-ash', 'domain_suffix': ['.z.example']}]}}))
            curl = root / 'curl'
            curl.write_text('''#!/usr/bin/env bash
printf '%s\\n' "$@" >"$TEST_ROOT/args"
while (($#)); do
    case "$1" in
        -o) output=$2; shift 2 ;;
        --etag-save) etag=$2; shift 2 ;;
        *) shift ;;
    esac
done
if [[ -e "$TEST_ROOT/respond304" ]]; then
    printf 304
else
    printf '[Host]\\n*.aaa.example = server:https://new.example/dns-query\\n' >"$output"
    printf '"test-etag"\\n' >"$etag"
    printf 200
fi
''')
            curl.chmod(0o755)
            env = {**os.environ, 'ENV': str(MODULE.parents[2]), 'TEST_ROOT': str(root),
                   'PATH': f'{root}:{os.environ["PATH"]}'}
            def run():
                return subprocess.run(['bash', str(root / 'ash.sh')], env=env,
                                      capture_output=True, text=True)
            first = run()
            self.assertEqual(first.returncode, 0, first.stdout + first.stderr)
            self.assertIn('.aaa.example', first.stdout)
            self.assertEqual(json.loads(target.read_text())['dns']['servers'][0]['server'], 'new.example')
            self.assertTrue((root / 'cache/ashnet-loon.lpx.etag').exists())
            (root / 'respond304').touch()
            before = target.read_bytes()
            second = run()
            self.assertEqual(second.returncode, 2, second.stdout + second.stderr)
            self.assertIn('--etag-compare', (root / 'args').read_text())
            self.assertEqual(target.read_bytes(), before)
            config = json.loads(target.read_text())
            config['dns']['rules'][0]['domain_suffix'].remove('.aaa.example')
            target.write_text(json.dumps(config))
            third = run()
            self.assertEqual(third.returncode, 0, third.stdout + third.stderr)
            self.assertIn('.aaa.example', target.read_text())


if __name__ == '__main__':
    unittest.main()
