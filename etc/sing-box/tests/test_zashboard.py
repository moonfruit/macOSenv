#!/usr/bin/env python3
"""离线运行 zashboard.sh，替换路由器采集和宿主文件操作。"""
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import time
import unittest


class ZashboardTest(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        self.script = self.root / 'zashboard.sh'
        shutil.copyfile(Path(__file__).resolve().parents[1] / 'zashboard.sh', self.script)
        lib = self.root / 'lib/bash'
        lib.mkdir(parents=True)
        (lib / 'color.sh').write_text('h1() { :; }; h2() { :; }; warn() { :; }\n')
        (lib / 'native.sh').write_text('main-script-directory() { dirname "$0"; }\n')
        (lib / 'fs.sh').write_text('''create-temp-directory() { mkdir -p "$ENV/temp"; printf -v "$1" '%s' "$ENV/temp"; }
copy-if-diff() { cp "$1" "$2"; }
''')
        cmd = self.root / 'zashboard-iplabels.py'
        cmd.write_text('#!/usr/bin/env bash\n[[ ! -e "$ENV/fail" ]] || exit 1\ncat "$ENV/current.json"\n')
        cmd.chmod(0o755)
        (self.root / 'cache').mkdir()
        (self.root / 'ui').mkdir()
        self.cache = self.root / 'cache/zashboard-iplabels.json'
        self.now = int(time.time())

    def run_script(self, previous, current, force=True):
        self.cache.write_text(json.dumps(previous))
        (self.root / 'current.json').write_text(json.dumps(current))
        subprocess.run(['bash', str(self.script), *(['-f'] if force else [])],
                       env={**os.environ, 'ENV': str(self.root), 'PATH': f'{self.root}:{os.environ["PATH"]}'},
                       check=True, capture_output=True)
        return json.loads(self.cache.read_text())

    def entry(self, key='2001:4860::1', **extra):
        return dict(key=key, label='设备', id=key, **extra)

    def test_missing_entries_start_grace_period(self):
        old = [self.entry(), self.entry('192.168.50.10')]
        result = self.run_script(old, [])
        self.assertEqual(len(result), 2)
        for entry in result:
            self.assertAlmostEqual(entry['invalid_since'], self.now, delta=3)

    def test_deadline_and_no_timer_reset(self):
        keep = self.entry(invalid_since=self.now - 7 * 86400 + 60)
        expired = self.entry('192.168.50.10', invalid_since=self.now - 7 * 86400)
        self.assertEqual(self.run_script([keep, expired], []), [keep])

    def test_registration_replaces_old_mapping(self):
        old = self.entry(invalid_since=self.now - 100)
        current = dict(self.entry(), label='新设备')
        self.assertEqual(self.run_script([old], [current]), [current])

    def test_ui_copy_has_no_metadata_and_can_be_recreated(self):
        old = self.entry(invalid_since=self.now - 100)
        self.run_script([old], [])
        output = self.root / 'ui/zashboard-settings.json'
        self.assertEqual(json.loads(json.loads(output.read_text())['config/source-ip-label-list']), [self.entry()])
        output.unlink()
        self.run_script([old], [], force=False)
        self.assertTrue(output.exists())

    def test_fetch_failure_preserves_state(self):
        (self.root / 'fail').touch()
        old = self.entry(invalid_since=self.now - 100)
        self.assertEqual(self.run_script([old], []), [old])

    def test_expiry_without_successful_fetch(self):
        old = self.entry(invalid_since=self.now - 7 * 86400)
        self.assertEqual(self.run_script([old], [], force=False), [])
        (self.root / 'fail').touch()
        self.assertEqual(self.run_script([old], []), [])

    def test_new_address_does_not_remove_old_address_early(self):
        result = self.run_script([self.entry()], [self.entry('2001:4860::2')])
        self.assertEqual(len(result), 2)
        by_key = {entry['key']: entry for entry in result}
        self.assertIn('invalid_since', by_key['2001:4860::1'])
        self.assertNotIn('invalid_since', by_key['2001:4860::2'])

    def test_missing_ui_still_updates_master(self):
        (self.root / 'ui').rmdir()
        result = self.run_script([self.entry()], [])
        self.assertIn('invalid_since', result[0])
        self.assertFalse((self.root / 'ui').exists())


if __name__ == '__main__':
    unittest.main()
