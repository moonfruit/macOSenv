#!/usr/bin/env python3

import glob
import os.path
import re
import shutil
import sys

from pathlib import Path

DEFAULT_MVN_REPOSITORY = Path.home() / ".m2" / "repository"


def get_packages(repo=''):
    packages = {}
    for pom in glob.iglob(os.path.join(repo, "**/*.pom"), recursive=True):
        version = os.path.dirname(pom)
        name, version = os.path.split(version)

        versions = packages.get(name)
        if not versions:
            packages[name] = versions = []
        versions.append(version)

    return packages


def get_version(version):
    index = version.find('-')
    if index < 0:
        head = version
        tail = ''
    else:
        head = version[:index]
        tail = version[index + 1:]

    return (separate(head), separate(tail))


def separate(string):
    if not string:
        return ()
    parts = []
    for part in re.split(r'\W+', string):
        try:
            part = int(part)
        except ValueError:
            pass
        parts.append(part)
    return tuple(parts)


def get_packages_version(packages):
    for name, versions in packages.items():
        print(name, [get_version(version) for version in versions])


def filter_packages(packages):
    results = {}
    for name, versions in packages.items():
        if len(versions) <= 1:
            continue
        versions.sort(key=get_version)
        results[name] = versions[:-1]
    return results


def clean(packages, flag=False):
    for name, versions in packages.items():
        for version in versions:
            target = os.path.join(name, version)
            print(target)
            if flag:
                try:
                    shutil.rmtree(target)
                except FileNotFoundError:
                    pass


if __name__ == "__main__":
    flag = False
    if len(sys.argv) > 1 and sys.argv[1] == '-d':
        flag = True
    os.chdir(DEFAULT_MVN_REPOSITORY)
    clean(filter_packages(get_packages()), flag)
