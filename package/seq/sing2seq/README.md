# sing2seq

将 sing-box 日志解析为 CLEF 并 POST 到 Seq。两个入口：

- `file2seq.py <path>` — 从日志文件读取，持久化 inode+offset，失败时不推进 offset
- `stdin2seq.py` — 从 stdin 实时流读取

## 用法

```bash
# 实时
sing-box run 2>&1 | ./stdin2seq.py --url https://app.seq.orb.local --insecure

# 定时（launchd / crontab 拉起）
./file2seq.py /var/log/sing-box.log --url https://app.seq.orb.local --insecure

# 从头重读文件
./file2seq.py /var/log/sing-box.log --reset --insecure
```

环境变量替代 CLI：`SEQ_URL`、`SEQ_API_KEY`、`SING2SEQ_STATE_DIR`。

## 批次策略

- `file2seq`：只按 size（200 条）分批；文件读到 EOF 时 flush 尾巴。
- `stdin2seq`：size（200 条）或 interval（2s，新行触发时检测）分批；EOF 时 flush 尾巴。

## 失败处理

- `file2seq` POST 失败 → offset **不保存**，下次运行从原位置重试；退出码 1。
- `stdin2seq` POST 失败 → 当前 buffer 保留（尽力重试），退出码 1；不保证不丢。

## 解析字段

`@t`/`@l`/`@mt` 标准 CLEF；`Module`/`Type`/`Tag`/`ConnectionId`（int）/`Duration`/`Detail`/`Source=sing-box`。解析失败的行保留原始 `Raw` 并 `Parsed:false`。

## 文件模式的 offset 与轮转

按 `inode + offset` 判定；inode 变化（logrotate `create` 模式）或文件被截断（size < offset）时从头读。`copytruncate` + 两次运行间写入量超过旧 offset 是唯一丢数据边界。
