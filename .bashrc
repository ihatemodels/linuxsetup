[ -z "$PS1" ] && return

source ~/.bash/aliases.sh
source ~/.bash/functions.sh
source ~/.bash/mxlinux.sh

# Go PATH 
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

YELLOW=$(tput setaf 190)
NORMAL=$(tput sgr0)
printf "${YELLOW} 				Welcome Back $(whoami)!\n\n$(uptime)${NORMAL}\n"
