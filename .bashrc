# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.bash/aliases.sh ]] && source ~/.bash/aliases.sh
[[ -f ~/.bash/functions.sh ]] && source ~/.bash/functions.sh


# Go lang paths
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin



if  [ -x "$(command -v neofetch)" ]; then
  neofetch
fi
