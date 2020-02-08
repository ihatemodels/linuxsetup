###########
# Aliases #
###########



###OPERATIONS
alias \
	cp='cp -iv' \
	mv='mv -iv' \
	rm='rm -v' \
	mkdir='mkdir -pv' \
  ls='ls -lh' \
  la='ls -A' \


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
