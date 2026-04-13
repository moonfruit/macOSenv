from parser import parse_line

SAMPLES = [
    "+0800 2026-04-12 17:23:39 \x1b[37mTRACE\x1b[0m initialize certificate",
    "+0800 2026-04-12 17:23:39 \x1b[36mINFO\x1b[0m network: updated default interface en13, index 13",
    "+0800 2026-04-12 17:23:39 \x1b[37mTRACE\x1b[0m outbound: initialize outbound/http[\u26f0\ufe0f Gingkoo]",
    "+0800 2026-04-12 17:23:39 \x1b[37mDEBUG\x1b[0m [\x1b[38;5;175m2789903007\x1b[0m 0ms] router: updating rule-set GeoIP@CN from URL: https://example.com",
    "+0800 2026-04-12 17:23:40 \x1b[31mERROR\x1b[0m [\x1b[38;5;84m3860578963\x1b[0m 3ms] connection: open connection to 169.254.169.254:80 using outbound/direct[DIRECT]: dial tcp 169.254.169.254:80: connect: no route to host",
    "+0800 2026-04-12 17:23:39 \x1b[36mINFO\x1b[0m inbound/tun[tun-in]: started at utun10",
    "",
    "garbage line without format",
]


def test_all():
    for s in SAMPLES:
        r = parse_line(s)
        print(r)


if __name__ == "__main__":
    test_all()
