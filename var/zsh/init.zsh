# init prezto settings
ZDOTDIR=$(pwd)
source "${ZDOTDIR}/preztorc.zsh"

if [[ -s "${ZDOTDIR}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR}/.zprezto/init.zsh"
fi

# envs
source "${ZDOTDIR}/env.zsh"

# options
source "${ZDOTDIR}/options.zsh"


# zsh completion
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

# zsh site-functions
fpath=(/usr/local/share/zsh/site-functions $fpath)