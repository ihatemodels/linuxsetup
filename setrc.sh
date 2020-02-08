#!/bib/bash

set -e

RED=`tput bold && tput setaf 1`
RESET=`tput bold && tput sgr 0`
BLUE=`tput bold && tput setaf 4`


banner() {
  echo "${BLUE}+--------------------------------+"
  echo "|                                |"
  printf "|${RED} %-30s `tput sgr0`${RED}|\n" "$@"
  echo "+--------------------------------+${RESET}"
}

banner "making rc backups..."
## Set rc's
mv ~/.bashrc ~/.bashrc.backup
mv ~/.vimrc ~/.vimrc.backup

banner "copying files..."
cp .bashrc ~/.bashrc
cp -r .bash/ ~/

if  [ -x "$(command -v vim)" ]; then
  banner "installing vundle"
  cp -f .vimrc ~/.vimrc
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi