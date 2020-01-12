#!/bin/bash

################
# GO INSTALLER #
################

VERSION="1.13.5"

source .bashrc

printf "Installing go version: ${VERSION}\n"

wget https://storage.googleapis.com/golang/go$VERSION.linux-amd64.tar.gz
tar xvfz go$VERSION.linux-amd64.tar.gz

sudo rm -rf /usr/local/go
sudo mv go/ /usr/local/

rm go$VERSION.linux-amd64.tar.gz

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
