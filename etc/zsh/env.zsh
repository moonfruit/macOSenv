# tools
export EDITOR='vim'
unset GREP_OPTIONS
unset GREP_COLOR

# catalog
export XML_CATALOG_FILES="$ENV/package/vim/XMLCatalog/catalog.xml"

# for zsh
DEFAULT_USER="moon"

# for env
# ldpath() {
#     case $(uname -s) in
#         AIX)
#             export LIBPATH="${LIBPATH:-.}:$1"
#             ;;
#         Darwin)
#             export DYLD_FALLBACK_LIBRARY_PATH="${DYLD_FALLBACK_LIBRARY_PATH:-.}:$1"
#             ;;
#         Linux)
#             export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:-.}:$1"
#             ;;
#     esac
# }
# ldpath "$ENV/lib"