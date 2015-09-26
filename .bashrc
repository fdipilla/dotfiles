#
alias ..='cd ..'
alias ls='ls --color=auto'
alias grep='grep --colour=auto'

#
alias emacs='emacs -nw'
alias firefoxdev='~/bin/firefoxDE/firefox'
alias firefox='/opt/firefox-new/firefox'

alias node='~/bin/node/bin/node'
alias go='~/bin/go/bin/go'
alias arduino='~/bin/arduino-1.6.5/arduino'
alias nautilus='nautilus --no-desktop'

#
export TERM=xterm-256color
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export GOROOT=$HOME/bin/go
export PATH=$PATH:$GOROOT/bin

#
git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]\[\e[1;37m\]\$(git_branch)\[\033[00m\] \[\e[1;32m\]\$\[\e[m\] "
