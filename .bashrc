# source ~/.bash_completion.d/.git-completion.sh

# ----------------------------------------------------------------------
# BASH COMPLETION
# ----------------------------------------------------------------------

source ~/.bash_completion.d/.git-completion.bash
source ~/.bash_completion.d/.rake.bash

# ----------------------------------------------------------------------
# BASH EXTENSIONS
# ----------------------------------------------------------------------

source ~/.bash/z/z.sh

# ----------------------------------------------------------------------
# BASH PROMPT
# ----------------------------------------------------------------------

case "$TERM" in
xterm*)
        PS1='\[\033[01;34m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[01;33m\]$(__git_ps1 " (%s)")\[\033[00m\]\$ '
        ;;
*)
        PS1='\u@\h:\w$(__git_ps1 " (%s)")\$ '
        ;;
esac

source ~/.git-aliases.sh

export RUBYOPT="rubygems"
export EDITOR='vim'

# complete hostnames from this file
: ${HOSTFILE=~/.ssh/known_hosts}

# readline config
: ${INPUTRC=~/.inputrc}

# PAGER
if test -n "$(command -v less)" ; then
    PAGER="less -FirSwX"
    MANPAGER="less -FiRswX"
else
    PAGER=more
    MANPAGER="$PAGER"
fi
export PAGER MANPAGER
export NODE_PATH=/usr/local/lib/node

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

