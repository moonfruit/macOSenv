#!/usr/bin/env python3

import json


def analyze(input):
    data = json.load(input)
    for obj in data:
        name = obj["name"]
        print("(%s)" % name)
        installed = obj.get("installed")
        if installed:
            installed = installed[0]
        deps = installed.get("runtime_dependencies")
        if deps:
            for dep in deps:
                print("(%s)->(%s)" % (name, dep["full_name"]))


if __name__ == "__main__":
    import sys
    if len(sys.argv) > 1:
        filename = sys.argv[1]
        if filename == '-':
            analyze(sys.stdin)
        else:
            with open(filename) as f:
                analyze(f)
    else:
        from subprocess import Popen, PIPE
        with Popen(["brew", "info", "--json=v1", "--installed"], stdout=PIPE) as proc:
            analyze(proc.stdout)
