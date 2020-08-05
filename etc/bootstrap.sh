#!/usr/bin/env zsh

e_newline() {
    printf "\n"
}

e_header() {
    printf "\033[37;1m%s\033[m\n" "$*"
}

e_error() {
    printf "\033[31m%s\033[m\n" "✖ $*" 1>&2
}

e_warning() {
    printf "\033[31m%s\033[m\n" "$*"
}

is_exists() {
    which "$1" >/dev/null 2>&1
    return $?
}

install_brew() {
    if is_exists "brew" || [[ $(uname) != 'Darwin' ]] ; then
      return 0
    fi
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

install_fzf() {
    case "$(uname)" in
        *'Linux'*)
            pushd $DOTPATH
            curl -LSfs https://raw.githubusercontent.com/junegunn/fzf/master/install | bash -s  -- --bin
            popd
            ;;
        *'Darwin'*)
            install_brew
            brew install fzf
            ;;
        *)
            e_error "このOSでは使えません"
            exit 1
            ;;
    esac
}
DOTPATH=${DOTPATH:-$HOME/dotfiles}
source $DOTPATH/etc/symlink.sh

e_header "Symlink z files..."
source $DOTPATH/etc/symlink.sh

e_header "Install fzf..."
install_fzf
