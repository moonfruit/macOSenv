#!/usr/bin/env python3
"""
lazy.nvim 输出的实时进度显示过滤器。

将交错的异步输出整理为每个 [plugin] task 独占一行、原地更新的进度视图。
从 stdin 读取 lazy.nvim 的原始输出，用 ANSI 光标控制实现行内覆盖。
"""

import os
import re
import sys
import unicodedata

# 匹配 lazy.nvim 输出行（含 ANSI 色码）：[plugin] task | message
# 去掉 ANSI 后格式：[plugin_name] task_name | message
ANSI_RE = re.compile(r"\033\[[0-9;]*m")
LINE_RE = re.compile(r"^\[([^\]]+)\]\s+(\S+)\s*\|\s*(.*)$")


def strip_ansi(s: str) -> str:
    return ANSI_RE.sub("", s)


def display_width(s: str) -> int:
    """计算字符串的终端显示宽度（CJK 字符占 2 列）。"""
    w = 0
    for ch in s:
        cat = unicodedata.east_asian_width(ch)
        w += 2 if cat in ("W", "F") else 1
    return w


def truncate_to_width(line: str, max_width: int) -> str:
    """将含 ANSI 色码的字符串截断到 max_width 显示列，保留色码完整性。"""
    result: list[str] = []
    w = 0
    i = 0
    while i < len(line):
        # 跳过 ANSI 转义序列（不占显示宽度）
        m = ANSI_RE.match(line, i)
        if m:
            result.append(m.group())
            i = m.end()
            continue
        ch = line[i]
        cat = unicodedata.east_asian_width(ch)
        cw = 2 if cat in ("W", "F") else 1
        if w + cw > max_width:
            break
        result.append(ch)
        w += cw
        i += 1
    # 确保末尾重置色码
    result.append("\033[0m")
    return "".join(result)


def main() -> None:
    # plugin -> 原始行（保留 ANSI 色码）
    tasks: dict[str, str] = {}
    # 保持插入顺序的 key 列表
    order: list[str] = []
    # 当前已渲染的总行数
    total_lines = 0

    out = sys.stderr
    cols = os.get_terminal_size(out.fileno()).columns

    for raw_line in sys.stdin:
        raw_line = raw_line.rstrip("\n")
        if not raw_line.strip():
            continue

        plain = strip_ansi(raw_line)
        m = LINE_RE.match(plain)
        if not m:
            # 无法解析的行：光标移到进度区域末尾后输出
            out.write(raw_line + "\n")
            out.flush()
            continue

        plugin, task, msg = m.group(1), m.group(2), m.group(3)
        key = plugin

        # checkout 任务：若已有中间输出（如 HEAD 位置），丢弃 Finished 行
        if (task == "checkout" and msg.startswith("Finished task") and
            key in tasks and "Running task" not in strip_ansi(tasks[key])):
            continue

        is_new = key not in tasks
        display = truncate_to_width(raw_line, cols)
        tasks[key] = display

        if is_new:
            order.append(key)
            # 新行：直接追加在末尾（光标已在末尾）
            out.write(f"\033[K{display}\n")
            total_lines += 1
        else:
            # 已有行：计算它在进度区域中的位置，定位过去覆盖
            line_idx = order.index(key)
            lines_up = total_lines - line_idx
            # 上移到目标行，覆盖，再回到末尾
            out.write(f"\033[{lines_up}F\033[K{display}\033[{lines_up}E")

        out.flush()

    out.flush()


if __name__ == "__main__":
    main()
