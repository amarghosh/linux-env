
# source me from ~/.bashrc

# Show only current directory
export PS1="\W $ "

alias ll='ls -l --color=tty'
alias lh='ls -lh --color=tty'
alias grep='grep -iIn --color'
alias egrep='egrep -iIn --color'
alias please=sudo
alias cd..='cd ..'
alias week='date +"%g%W.%u"'
alias today='date +"%G_%m_%d"'
alias now='date +%Y.%m.%d.%H.%M.%S'

# delete all queues: use at your own risk
# useful while debugging multithreaded apps that leak message queues upon crashing
alias delete_queues="ipcs -q | cut -d' ' -f2 | \grep ^[0-9] | sed -e 's/^/ -q /' | xargs ipcrm"
alias svndiff="svn diff --diff-cmd diff -x -bB "
alias findfile="find . -iname "

export EDITOR=vi
export GREP_COLOR='2;32'
set -o vi

export PATH="$PATH:$HOME/bin"

chr() {
  [ "$1" -lt 256 ] || return 1
  printf "\\$(printf '%03o' "$1")"
}

ord() {
  LC_CTYPE=C printf '%d' "'$1"
}

# make sure you've cloned this to $HOME/linux-env (or change this line)
export PATH=$PATH:$HOME/linux-env

