#!/usr/bin/env python3

import json


def analyze(input):
    data = json.load(input)
    print(
        """@startuml homebrew
skinparam usecase {
    BorderColor DarkSlateGray
    BackgroundColor DarkSeaGreen
    BackgroundColor<< req >> ForestGreen
    BackgroundColor<< dep >> DarkGoldenRod
}"""
    )
    lines = []
    for obj in data:
        name = obj["full_name"]
        installed = obj.get("installed")
        if installed:
            installed = installed[0]
        if installed.get("installed_as_dependency"):
            if installed.get("installed_on_request"):
                lines.append("(%s) << req >>" % name)
            else:
                lines.append("(%s) << dep >>" % name)
        else:
            lines.append("(%s)" % name)
        deps = installed.get("runtime_dependencies")
        if deps:
            for dep in deps:
                lines.append("(%s)-->(%s)" % (name, dep["full_name"]))
    lines.sort()
    for line in lines:
        print(line)
    print("@enduml")


if __name__ == "__main__":
    import sys

    if len(sys.argv) > 1:
        filename = sys.argv[1]
        if filename == "-":
            analyze(sys.stdin)
        else:
            with open(filename) as f:
                analyze(f)
    else:
        from subprocess import Popen, PIPE

        with Popen(["brew", "info", "--json=v1", "--installed"], stdout=PIPE) as proc:
            analyze(proc.stdout)
