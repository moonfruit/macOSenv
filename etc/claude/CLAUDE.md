# Claude 行为指南

## 语言

除非另有说明，否则使用简体中文回答问题

## 工具

Claude 可以使用以下工具：

- 如果需要编写`shell`脚本，应使用`/opt/homebrew/bin/bash`
- 如果需要编写`python`脚本，应使用`/opt/homebrew/bin/python3`
- 如果需要编写`ruby`脚本，应使用`/opt/homebrew/opt/ruby/bin/ruby`

- 优先考虑使用`fd`进行文件查找
- 优先考虑使用`ripgrep`进行文本搜索
- 优先考虑使用`jq`处理`JSON`数据
- 优先考虑使用`yq`处理`YAML`,`XML`,`TOML`数据

- 必要时可以使用`homebrew`安装工具
