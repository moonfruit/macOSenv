#!/usr/bin/env python3
import json
import os
import platform
import sys
import time

SYSTEM_FLAGS = {
    # 'Darwin': {
    #     'cc': [
    #         '-nostdinc',
    #         '-isystem', '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include',
    #         '-isystem', '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include',
    #         '-isystem', '/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk/usr/include',
    #         '-F', '/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk/System/Library/Frameworks',
    #         '-F', '/System/Library/Frameworks',
    #         '-F', '/Library/Frameworks'
    #     ],
    #     'c++': [
    #         '-nostdinc',
    #         '-isystem', '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1',
    #         '-isystem', '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include',
    #         '-isystem', '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include',
    #         '-isystem', '/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk/usr/include',
    #         '-F', '/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk/System/Library/Frameworks',
    #         '-F', '/System/Library/Frameworks',
    #         '-F', '/Library/Frameworks'
    #     ]
    # }
}


def compile_commands(commands_file):
    result = _compile_commands(commands_file)
    if result is None:
        return commands_file
    else:
        return result


def _compile_commands(commands_file):
    if os.path.isfile(commands_file):
        return commands_file
    else:
        dirname = os.path.dirname(commands_file)
        dirname = os.path.dirname(dirname)
        if dirname != "/":
            basename = os.path.basename(commands_file)
            return _compile_commands(os.path.join(dirname, basename))


def cleanup(commands):
    items = {}

    for item in commands:
        key = fullpath(item)
        if os.path.isfile(key):
            items[key] = item
        else:
            print("Remove file - " + key)

    return sorted(items.values(), key=fullpath)


def fullpath(item):
    return os.path.join(item["directory"], item["file"])


def is_cleanup(commands_file):
    if not os.path.isfile(commands_file):
        return False

    filetime = os.path.getmtime(commands_file)
    current_time = time.time()

    return filetime + 24 * 60 * 60 < current_time


def rewrite(name, arguments):
    result = []
    flag_c = False
    flag_d = False

    for item in _rewrite(arguments):
        if item.startswith('__REVISION__='):
            return None

        elif flag_d:
            flag_d = False
            if (item.startswith('SYSTEM_NAME=')
                    or item.startswith('MODULE_NAME=')):
                continue
            result.append('-D')

        elif item == '-c':
            flag_c = True
            continue

        elif item == '-D':
            flag_d = True
            continue

        result.append(item)

    if not flag_c:
        return None

    result.insert(1, '-c')

    flags = SYSTEM_FLAGS.get(platform.system())
    if flags:
        flags = flags[name]
    if flags:
        result[1:1] = flags

    return result


def _rewrite(arguments):
    for item in arguments:
        if len(item) > 2:
            start = item[:2]
            end = item[2:]
            if start in ('-D', '-U', '-I', '-F'):
                yield start
                yield end
                continue
        yield item


def main(name, argv):
    name = os.path.splitext(os.path.basename(name))[0]
    arguments = [name] + argv
    path = os.path.abspath(arguments[-1])
    save_arguments = rewrite(name, arguments)
    if not (os.path.isfile(path) and save_arguments):
        os.execvp(name, arguments)
        return  # Never run

    directory, filename = os.path.split(path)

    commands_file = compile_commands(
        os.path.join(directory, 'compile_commands.json'))

    commands = []
    if os.path.isfile(commands_file):
        try:
            commands = json.load(open(commands_file))
        except ValueError:
            pass

    found = False
    for item in commands:
        if item["directory"] == directory and item["file"] == filename:
            item["arguments"] = save_arguments
            found = True

    if not found:
        commands.append({
            "directory": directory,
            "file": filename,
            "arguments": save_arguments
        })

    if is_cleanup(commands_file):
        print("Cleanup compile_commands.json")
        commands = cleanup(commands)

    json.dump(commands, open(commands_file, 'w'), ensure_ascii=False)

    os.execvp(name, arguments)


if __name__ == '__main__':
    main(sys.argv[0], sys.argv[1:])
