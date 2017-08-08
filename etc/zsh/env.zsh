# for PATH
# export PATH="$ENV/bin:$ENV/tools:/opt/subversion/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# other
export EDITOR='vim'
unset GREP_OPTIONS
unset GREP_COLOR

# for zsh
OS=`uname -s`
DEFAULT_USER="moon"
ldpath() {
    case "$OS" in
        AIX)
            export LIBPATH="${LIBPATH:-.}:$1"
            ;;
        Darwin)
            export DYLD_FALLBACK_LIBRARY_PATH="${DYLD_FALLBACK_LIBRARY_PATH:-.}:$1"
            ;;
        Linux)
            export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:-.}:$1"
            ;;
    esac
}

# for env
ldpath "$ENV/lib"
