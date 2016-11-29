
# source me from ~/.bashrc

# Show only current directory
export PS1="\W $ "

alias ll='ls -l --color=tty'
alias lh='ls -lh --color=tty'
alias grep='grep --color=auto -iInP '
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

export ANDROID_DEV_TOOLS=$HOME/android-devtools
export ANDROID_SDK_ROOT="$ANDROID_DEV_TOOLS/adt-bundle-linux-x86-20140702"
export ANDROID_NDK_ROOT="$ANDROID_DEV_TOOLS/android-ndk-r10e"
export PATH="$PATH:$HOME/bin"
export PATH="$ANDROID_SDK_ROOT/sdk/platform-tools:$ANDROID_NDK_ROOT:$PATH"
export PATH="$PATH:$ANDROID_NDK_ROOT/toolchains/arm-linux-androideabi-4.8/prebuilt/linux-x86/bin"
alias adt='nohup $ANDROID_SDK_ROOT/eclipse/eclipse &>/dev/null &'
alias android-studio='nohup $ANDROID_DEV_TOOLS/android-studio/bin/studio.sh &>/dev/null &'

chr() {
  [ "$1" -lt 256 ] || return 1
  printf "\\$(printf '%03o' "$1")"
}

ord() {
  LC_CTYPE=C printf '%d' "'$1"
}

# make sure you've cloned this to $HOME/linux-env (or change this line)
export PATH=$PATH:$HOME/linux-env

