# zashboard 源 IP 标签导出脚本 设计

日期：2026-06-25

## 目标

从 ASUS 路由器（`192.168.50.1` / `router.dkmooncat.heiyu.space`）导出设备列表，生成 zashboard 可直接 web 导入的 JSON。该 JSON **只含 `config/source-ip-label-list` 一个键**，其 value 为 stringify 后的 `[{key, label, id}, ...]` 数组（IP → 标签 → UUID）。

避免 `asus-http.py`（基于 asusrouter HTTP）的副作用：登录会踢掉路由器后台其它会话。改用 **SSH** 直接读取路由器本地数据，无踢登录副作用。

## 形态与位置

- 文件：`package/yyscripts/zashboard-iplabels.py`
- Shebang：`#!/usr/bin/env python`，运行用 `venv/bin/python`（该目录 direnv `layout python 3.14`）
- SSH 库：**Fabric**（高层同步 API，自动加载 `~/.ssh/config`，底层带 paramiko）。加入 `requirements.txt` 并装入 venv
- CLI：用 `typer`（已是依赖）。选项 `-o/--output PATH`（默认 stdout）、`--router HOST`（默认 `192.168.50.1`）
- SSH 登录身份完全由 `~/.ssh/config` 提供（User moon / Port 20022 / 密钥），脚本不写死

## 数据源（单条 SSH 连接，远端取三份数据）

1. `nvram get custom_clientlist` → `{MAC: nickName}`，约 69 个**用户自定义名**（带 emoji，如 `📺主卧的AppleTV`）。格式：条目以 `<` 分隔，字段以 `>` 分隔，首字段为名、次字段为 MAC
2. `cat /proc/net/arp` → `{MAC: IPv4}`，覆盖静态 IP 设备（br0），flag `0x2` 为有效
3. `cat /var/lib/misc/dnsmasq.leases` → `{MAC: IPv4}`，DHCP 租约，作 IPv4 fallback
4. `ip -6 neigh show` → `{MAC: [IPv6...]}`，仅取**全局单播地址 GUA**（`2xxx:`/`3xxx:`），跳过 `fe80::` 链路本地

MAC 一律大写归一化后做 key 匹配。

## 处理逻辑

1. 构建 `{MAC: IPv4}`：ARP 优先，leases 补充
2. 构建 `{MAC: [IPv6...]}`：来自 `ip -6 neigh` 的 GUA（可能多个，含隐私扩展临时地址）
3. 遍历 `custom_clientlist` 中**有自定义名**的 MAC：
   - 若能解析出 IPv4 → 生成一条 `{key: IPv4, label: nickName, id}`
   - 对其每个 GUA IPv6 → 各生成一条 `{key: IPv6, label: nickName, id}`（label 同设备名）
   - 无自定义名的杂散设备**跳过**（避免丑陋自动名）
4. 合并**静态列表**（脚本顶部可编辑 dict）：补充路由器客户端列表里没有的特殊/基础设施项
5. **冲突时路由器优先**：同一 key 同时来自路由器与静态表，用路由器的（带 emoji）名；静态表只填路由器缺失的 key
6. 按 key 去重；输出按 IP 排序（IPv4 数值序在前，IPv6 在后），保证输出稳定

### 静态列表初始内容

```
127.0.0.1            本机
11.0.0.1             TUN
fdfe:dcba:9876::1    TUNv6
192.168.50.1         主路由器
192.168.50.2         副路由器
192.168.50.3         小路由器
192.168.50.5         主交换机
192.168.50.6         副交换机
192.168.50.10        中枢网关
```

## UUID 稳定性

`id = uuid5(固定命名空间 UUID, key)` 确定性派生。同一 key（IP）每次跑出的 UUID 恒定，无需读旧文件。首次运行会替换现有随机 UUID（符合"第一次全量重新生成"），此后保持不变。

## 输出格式

```json
{
  "config/source-ip-label-list": "[{\"key\":\"127.0.0.1\",\"label\":\"本机\",\"id\":\"...\"}, ...]"
}
```

- value 是 compact JSON（`ensure_ascii=false`）的字符串
- 外层对象 pretty 打印（indent=2）
- 默认 stdout；`-o FILE` 写文件

## 错误处理

- SSH 连不上：报错退出，非 0 退出码
- 某份数据缺失（如 `ip -6 neigh` 不可用）：警告到 stderr，跳过对应部分，不中断
- 解析容错：跳过格式异常的条目而非崩溃

## 取舍记录（YAGNI）

- 不读取旧 JSON 做增量：UUID 用 uuid5 确定性派生即可满足"同机器 UUID 不变"
- 不做在线/离线过滤：能解析出 IP 即收录
- IPv6 隐私扩展临时地址会漂移，但每次全量重生成天然反映当前状态，可接受
