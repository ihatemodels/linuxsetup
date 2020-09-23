###########
# Aliases #
###########


## MOVE
    alias cd.='cd ..'
    alias cd..='cd ../..'
    alias cd...='cd ../../..'

###OPERATIONS
    alias cp='cp -iv'
    alias mv='mv -iv' 
    alias rm='rm -v' 
    alias mkdir='mkdir -pv' 
    alias la='ls -A'
    alias tf='tail -F'

##GIT
    alias gs='git status'
    alias gb='git branch -a'
    alias gp='git pull'
    alias gc='git clone'
    alias gcm='git diff @~..@'

#NAVIGATION
    alias projects='cd ~/Projects'
    alias scripts=='cd ~/Scripts'
    alias downloads='cd ~/Downloads'
    alias godir='cd ~/go/src/github.com/ihatemodels'

#SYSTEM
    alias open='xdg-open'
    alias aliases='cat ~/.bash/aliases.sh'
    alias cats='highlight -O ansi --force --style=bright'
    alias update-fonts='sudo fc-cache -fv'
    alias users="cut -d: -f1 /etc/passwd"

#COLOR
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias dir='dir --color=auto'
        alias vdir='vdir --color=auto'
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi
