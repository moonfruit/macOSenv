import re
from datetime import datetime
from typing import Optional

ANSI_RE = re.compile(r"\x1b\[[0-9;]*m")

LINE_RE = re.compile(
    r"^(?P<tz>[+-]\d{4})\s+"
    r"(?P<date>\d{4}-\d{2}-\d{2})\s+"
    r"(?P<time>\d{2}:\d{2}:\d{2}(?:\.\d+)?)\s+"
    r"(?P<level>TRACE|DEBUG|INFO|WARN|ERROR|FATAL|PANIC)\s+"
    r"(?:\[(?P<conn>\S+)\s+(?P<dur>[^\]]+)\]\s+)?"
    r"(?P<rest>.*)$"
)

MODULE_RE = re.compile(
    r"^(?P<module>[a-zA-Z0-9_\-]+)"
    r"(?:/(?P<type>[a-zA-Z0-9_\-]+))?"
    r"(?:\[(?P<tag>[^\]]*)\])?"
    r":\s+(?P<detail>.*)$"
)

LEVEL_MAP = {
    "TRACE": "Verbose",
    "DEBUG": "Debug",
    "INFO": "Information",
    "WARN": "Warning",
    "ERROR": "Error",
    "FATAL": "Fatal",
    "PANIC": "Fatal",
}


def strip_ansi(s: str) -> str:
    return ANSI_RE.sub("", s)


def parse_line(raw: str) -> Optional[dict]:
    line = strip_ansi(raw).rstrip("\r\n")
    if not line:
        return None
    m = LINE_RE.match(line)
    if not m:
        return {
            "@t": datetime.now().astimezone().isoformat(),
            "@l": "Information",
            "@mt": "{Raw}",
            "Raw": line,
            "Source": "sing-box",
            "Parsed": False,
        }

    ts = f"{m['date']}T{m['time']}{m['tz'][:3]}:{m['tz'][3:]}"
    level = LEVEL_MAP.get(m["level"], "Information")

    event: dict = {
        "@t": ts,
        "@l": level,
        "Source": "sing-box",
    }
    conn = m["conn"]
    if conn is not None:
        try:
            event["ConnectionId"] = int(conn)
        except ValueError:
            event["ConnectionId"] = conn
        event["Duration"] = m["dur"]

    rest = m["rest"]
    mm = MODULE_RE.match(rest)
    if mm:
        event["Module"] = mm["module"]
        if mm["type"]:
            event["Type"] = mm["type"]
        if mm["tag"] is not None:
            event["Tag"] = mm["tag"]
        event["Detail"] = mm["detail"]
        tmpl = ""
        if conn is not None:
            tmpl += "[{ConnectionId} {Duration}] "
        tmpl += "{Module}"
        if mm["type"]:
            tmpl += "/{Type}"
        if mm["tag"] is not None:
            tmpl += "[{Tag}]"
        tmpl += ": {Detail}"
        event["@mt"] = tmpl
    else:
        event["Detail"] = rest
        if conn is not None:
            event["@mt"] = "[{ConnectionId} {Duration}] {Detail}"
        else:
            event["@mt"] = "{Detail}"

    return event
