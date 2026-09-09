# Claude 行为指南

## 语言

总是使用简体中文回答问题，除非用户明确要求使用其他语言。

## 工具

Claude 可以使用以下工具：

- 如果需要编写`shell`脚本
  - 脚本开头应为 `#!/usr/bin/env bash`
  - **`$VAR` 后面紧跟非 ASCII 字符时，必须写成 `${VAR}`**：在 UTF-8 locale 下 bash 会把多字节字符的第一个字节并入变量名，于是取到一个未定义的变量（展开为空），还会在输出里留下半个字符的乱码字节。
    - 错误：`echo "有$COUNT个端口"` → 实际展开 `${COUNT个的首字节}`，输出 `有<乱码>端口`
    - 正确：`echo "有${COUNT}个端口"`
    - 中文标点同样中招：`"共$N，失败$M"`、`"端口：$PORT（默认）"` 都必须写 `${N}`、`${PORT}`
    - zsh 更激进，会把后面一整串中文都吞进变量名
    - 规则简化为：**中文/Emoji 文案里的变量一律加花括号**，不要只在"看起来有歧义"时才加；这条同样适用于直接在命令行执行的一次性 bash 命令，不只是 `.sh` 文件
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
  - 如果是在`homebrew`相关项目中，应使用`brew ruby`、`brew typecheck`和`brew rubocop`

- 优先使用内置工具完成任务（比如 Glob、Grep），如果需要构建 Bash 命令的话，参考以下说明：
  - 优先使用`fd`进行文件查找而不是`find`
  - 优先使用`ripgrep`即`rg`进行文件内容搜索而不是`grep`
    - **`rg` 的短参数与 `grep` 含义不同，不要凭 `grep` 的习惯套用**，尤其是 `-r`：
      - `grep -r` 是递归搜索；`rg -r/--replace` 是**替换匹配内容后输出**（只改标准输出，不改文件）
      - `rg` 默认就递归搜索当前目录，等价于 `grep -r` 的写法是直接 `rg PATTERN [DIR]`，不加 `-r`
      - 只搜当前一层用 `rg --max-depth 1 PATTERN`
      - 其它易混淆项：`rg -t/-T` 是按文件类型过滤（`rg -t py`），`grep` 无此参数；`rg -u/-uu/-uuu` 逐级放开 gitignore/隐藏文件/二进制过滤
      - 不确定时先 `rg --help` 确认，不要假设与 `grep` 一致
  - 优先使用`jq`处理`JSON`数据而不是`sed`或`awk`
  - 优先考虑使用`yq`处理`YAML`,`XML`,`TOML`数据而不是`sed`或`awk`

- 默认环境中的 `awk`, `sed`, `getopt`, `grep` 是 GNU 版本，使用时请注意兼容性问题

- 必要时可以使用`homebrew`安装工具

## Java 开发

- 系统中存在多个`java`环境：PATH 中包含多个与其相关的命令：
  - `java` 与 `mvn`：系统中最新版本的，目前为 Java 25
  - `java8` 与 `mvn8`：Java 8
  - `java11` 与 `mvn11`：Java 11
  - `java17` 与 `mvn17`：Java 17
  - `java21` 与 `mvn21`：Java 21
- 需要根据项目需求选择合适的`java`版本进行开发和构建

## 终端/文本输出

无论是在终端还是文本中输出中文或Emoji或其它非ascii字符进行排版时，一定要注意字符宽度问题，确保输出对齐美观。
比如一个中文字符或Emoji占用两个字符宽度，而一个英文字符占用一个字符宽度。
可以使用命令行工具`wcwidth`来计算字符宽度，或者在编程语言中使用相应的库函数来处理字符宽度问题。

在 shell 里拼接中文输出时，注意变量边界问题（见上文 `${VAR}` 花括号规则）。
