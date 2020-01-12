#!/bin/bash


function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
	echo "Installing: ${1}..."
	sudo apt install -y $1
  else
	  echo "Already installed: ${1}"
  fi
}

install vim-gui-common
install vim-runtime
install vim
install keepass2
install keepass2-plugin-keepasshttp
install nmap
install highlight-common
install highlight 

