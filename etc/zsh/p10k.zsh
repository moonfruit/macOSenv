#!/usr/bin/env zsh
# 自定义 p10k prompt 组件
#
# 此文件位于 $ZSH_CUSTOM(= $ENV/etc/zsh)，由 oh-my-zsh 自动 source，
# 加载顺序在 ~/.zsh/.p10k.zsh 之后、p10k 主题初始化之前。
# 与 `p10k configure` 生成的 .p10k.zsh 完全隔离 —— 重新生成配置也不会丢。

# 仅在启用 powerlevel10k 主题时生效（非 iTerm/ghostty 终端走 robbyrussell，无 p10k）
[[ $ZSH_THEME == powerlevel10k/powerlevel10k ]] || return

# Docker context 段：
#   · orbstack，或 endpoint(直接/软链)指向 orbstack 的 socket —— 默认环境，不显示
#   · default 指向其它本机 daemon                            —— 🐳 default  背景 70
#   · DOCKER_HOST 指向非 orbstack 的主机                      —— 🐳 unknown  背景 124（醒目）
#   · 其余具名 context                                        —— 🐳 <name>   背景 130
function prompt_docker_context() {
  local ctx color=130
  if [[ -n $DOCKER_CONTEXT ]]; then
    ctx=$DOCKER_CONTEXT
  elif [[ -n $DOCKER_HOST ]]; then
    ctx=unknown
  else
    # 不起子进程：直接读 ~/.docker/config.json 的 currentContext 字段
    local cfg=
    [[ -r ~/.docker/config.json ]] && cfg=$(<~/.docker/config.json)
    if [[ $cfg == *'"currentContext"'* ]]; then
      ctx=${${cfg#*\"currentContext\"}#*\"}      # 跳到值起始引号之后
      ctx=${ctx%%\"*}                            # 截到结束引号之前
    fi
    : ${ctx:=default}
  fi

  [[ $ctx == orbstack ]] && return

  if [[ $ctx == default || $ctx == unknown ]]; then
    # endpoint 取 $DOCKER_HOST，否则用内建默认 socket
    local endpoint=${DOCKER_HOST:-unix:///var/run/docker.sock}
    # endpoint 是本地 unix socket，且该 socket 路径本身、或其符号链接解析后指向 orbstack —— 不显示
    if [[ $endpoint == unix://* ]]; then
      local sock=${endpoint#unix://}
      [[ $sock == */.orbstack/* || ${sock:A} == */.orbstack/* ]] && return
    fi
    # DOCKER_HOST 指向的非 orbstack 主机：context 不明，醒目标红
    if [[ $ctx == unknown ]]; then
      color=124
    else
      color=70
    fi
  fi

  p10k segment -b $color -i '🐳' -t "$ctx"
}

# 把 docker_context 段注入右侧 prompt（.p10k.zsh 重新生成后这里也会自动补回）
if (( ! ${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS[(I)docker_context]} )); then
  () {
    local i=${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS[(I)direnv]}
    if (( i )); then
      POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS[i+1,i]=(docker_context)   # 插到 direnv 之后
    else
      POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS+=(docker_context)
    fi
  }
fi
