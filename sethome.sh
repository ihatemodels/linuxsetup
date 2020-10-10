#!/bin/bash

sudo apt-get update
sudo apt-get install vim
sudo apt-get install git

# Set dirs
mkdir -p ~/Projects/go
mkdir -p ~/Scripts
mkdir -p ~/tools
mkdir -p ~/configs
mkdir -p ~/.backups

## Back rc's
cp -f ~/.bashrc ~/.backups/bashrc.backup
cp -f ~/.vimrc ~/.backups/vimrc.backup


## Set rc's
cp -f .bashrc ~/.bashrc
cp -r .bash/ ~/
cp -f .gitconfig ~/.gitconfig

if [ -x "$(command -v vim)" ]; then
  cp -f .vimrc ~/.vimrc
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
fi