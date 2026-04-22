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
LINE_RE = re.compile(r"^\[([^\]]+)\]\s+(?:(\S+)\s+)?\|\s*(.*)$")
# 行内 [plugin] task | 标记：用于把被拼接在同一行的多段 lazy 输出切开
TAG_RE = re.compile(r"\[[^\]\s|]+\]\s+\S+\s+\|")


def strip_ansi(s: str) -> str:
    return ANSI_RE.sub("", s)


def split_segments(line: str) -> list[str]:
    """按行内出现的 [plugin] task | 标记切分为独立段落，保留 ANSI 色码。

    紧邻段首字符的 ANSI 序列跟随新段，以保留 [plugin] 的颜色前缀。
    """
    plain = strip_ansi(line)
    starts = [m.start() for m in TAG_RE.finditer(plain)]
    if not starts:
        return [line]
    boundaries = ([0] if starts[0] > 0 else []) + starts
    if len(boundaries) <= 1:
        return [line]
    boundary_set = set(boundaries)
    segments: list[str] = []
    current: list[str] = []
    pending_ansi: list[str] = []  # 自上一个普通字符以来遇到的 ANSI 序列
    plain_idx = 0
    i = 0
    while i < len(line):
        m = ANSI_RE.match(line, i)
        if m:
            pending_ansi.append(m.group())
            i = m.end()
            continue
        if plain_idx != 0 and plain_idx in boundary_set:
            segments.append("".join(current))
            current = list(pending_ansi)  # 让紧邻的 ANSI 前缀归属新段
        else:
            current.extend(pending_ansi)
        pending_ansi = []
        current.append(line[i])
        plain_idx += 1
        i += 1
    current.extend(pending_ansi)
    segments.append("".join(current))
    return segments


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

    for raw in sys.stdin:
        raw = raw.rstrip("\r\n")
        for line in split_segments(raw):
            if not line.strip():
                continue

            match = LINE_RE.match(strip_ansi(line))
            if not match:
                out.write(line + "\n")
                out.flush()
                continue

            plugin, _, msg = match.group(1), match.group(2), match.group(3)
            if not msg.strip():
                continue

            # 若已有中间输出，丢弃 Finished 行
            if msg.startswith("Finished task") and plugin in tasks and "Running task" not in strip_ansi(tasks[plugin]):
                continue

            is_new = plugin not in tasks
            display = truncate_to_width(line, cols)
            tasks[plugin] = display

            if is_new:
                order.append(plugin)
                # 新行：直接追加在末尾（光标已在末尾）
                out.write(f"\033[K{display}\n")
                total_lines += 1
            else:
                # 已有行：计算它在进度区域中的位置，定位过去覆盖
                line_idx = order.index(plugin)
                lines_up = total_lines - line_idx
                # 上移到目标行，覆盖，再回到末尾
                out.write(f"\033[{lines_up}F\033[K{display}\033[{lines_up}E")

            out.flush()

    out.flush()


if __name__ == "__main__":
    main()
