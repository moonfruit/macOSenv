# Claude 行为指南

## 语言

除非另有说明，否则使用简体中文回答问题

## 工具

Claude 可以使用以下工具：

- 如果需要编写`shell`脚本
  - 脚本开头应为 `#!/usr/bin/env bash`
- 如果需要编写`python`脚本
  - 如果存在`venv`：
    - **可执行**脚本开头应为 `#!/usr/bin/env python`
    - 运行脚本应使用`venv/bin/python`
  - 如果不存在`venv`：
    - **可执行**脚本开头应为 `#!/usr/bin/env python3`
    - 运行脚本应使用`/opt/homebrew/bin/python3`
- 如果需要编写`ruby`脚本
  - **可执行**脚本开头应为 `#!/usr/bin/env ruby`
  - 运行脚本应使用`/opt/homebrew/opt/ruby/bin/ruby`

- 优先使用`fd`进行文件查找而不是`find`
- 优先使用`ripgrep`即`rg`进行文本搜索而不是`grep`
- 优先使用`jq`处理`JSON`数据而不是`sed`或`awk`
- 优先考虑使用`yq`处理`YAML`,`XML`,`TOML`数据而不是`sed`或`awk`

- 必要时可以使用`homebrew`安装工具

## Java 开发

- 系统中存在多个`java`环境：PATH 中包含多个与其相关的命令：
  - `java` 与 `mvn`：系统中最新版本的，目前为 Java 25
  - `java8` 与 `mvn8`：Java 8
  - `java11` 与 `mvn11`：Java 11
  - `java17` 与 `mvn17`：Java 17
  - `java21` 与 `mvn21`：Java 21
- 需要根据项目需求选择合适的`java`版本进行开发和构建
