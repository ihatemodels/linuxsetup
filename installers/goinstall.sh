#!/bin/bash

################
# GO INSTALLER #
################

VERSION="1.15.2"
BLUE=`tput setaf 4`
BOLD=`tput bold`

DIR="/home/$(whoami)/go"

if [ ! -d "$DIR" ]; then
  mkdir $DIR
fi

source .bashrc

printf "${BLUE}${BOLD}Installing golang version: ${VERSION}...\n"

wget https://storage.googleapis.com/golang/go$VERSION.linux-amd64.tar.gz > /dev/null 2>&1

tar xvfz go$VERSION.linux-amd64.tar.gz &>/dev/null


sudo rm -rf /usr/local/go
sudo mv go/ /usr/local/

rm go$VERSION.linux-amd64.tar.gz

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

go env

if [ $? -ne 0 ]; then
	echo "go env returned non zero code."
        
else
	printf "Golang version ${VERSION} installed.\n"
fi
