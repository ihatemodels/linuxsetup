###########
# Aliases #
###########

alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'


##GIT
    alias gs='git status'
    alias gb='git branch -a'
    alias gp='git pull'

#NAVIGATION
    alias projects='cd ~/Projects'
    alias scripts=='cd ~/Scripts'
    alias downloads='cd ~/Downloads'
    alias godir='cd ~/go/src/github.com/ihatemodels'
    
#GREPERS
    alias wifikey="sudo grep -r '^psk=' /etc/NetworkManager/system-connections/"

#SYSTEM
    alias open='xdg-open'
    alias aliases='cat ~/.bash/aliases'
    alias cats='highlight -O ansi --force --style=bright'
    
#COLOR
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        alias dir='dir --color=auto'
        alias vdir='vdir --color=auto'

        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi
