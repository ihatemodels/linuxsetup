#!/bin/bash

RED=`tput bold && tput setaf 1`
RESET=`tput bold && tput sgr 0`
YELLOW=`tput bold && tput setaf 3`
BLUE=`tput bold && tput setaf 4`
GREEN=`tput bold && tput setaf 2`

banner() {
  echo "${BLUE}+--------------------------------+"
  echo "|                                |"
  printf "|${RED} %-30s `tput sgr0`${RED}|\n" "$@"
  echo "+--------------------------------+"
}

function vscode {
    printf "\n[*] INSTALLING VSCODE..."
	curl -L -o vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868 > /dev/null 2>&1
	sudo dpkg -i vscode.deb &> /dev/null
 
	which code &> /dev/null

	if [ $? -ne 0 ]; then
		banner "VSCODE FAILED"
  	else
		banner "VSCODE INSTALLED"
  	fi
}

banner "STARTING"
echo "${YELLOW}	     UPDATING" 
sudo apt update &>/dev/null 
banner "OK"

echo "${YELLOW}Do you wish to remove the packages listed in junk.lst ?${RED}"

while true; do
	read -p "${BLUE}" yn
	case $yn in
		[Yy]* ) sudo bash installers/packages.sh remove; break;;
		[Nn]* ) break;;
		* ) echo "yY or Nn.";;
	esac
done

banner "OK"

echo "${YELLOW}Do you wish to install the packages listed in packages.lst ?${RED}"

while true; do
	read -p "${BLUE}" yn
	case $yn in
		[Yy]* ) sudo bash installers/packages.sh install; break;;
		[Nn]* ) break;;
		* ) echo "yY or Nn.";;
	esac
done

banner "OK"

mkdir ~/Projects ~/Scripts
rm -rf ~/Videos ~/Public ~/Music ~/Templates

echo "${BLUE}[*] Do you wish to install Golang ?${RED}"

while true; do
	read -p "" yn
	case $yn in
		[Yy]* ) bash installers/goinstall.sh; break;;
		[Nn]* ) break;;
		* ) echo "yY or Nn.";;
	esac
done

banner "OK"

while true; do
	read -p "${YELLOW}[*] Do you wish to install Latest Stable Docker? y/n" yn
	case $yn in
		[Yy]* ) sudo bash installers/docker.sh; break;;
		[Nn]* ) break;;
		* ) echo "yY or Nn.";;
	esac
done

banner "OK"

while true; do
	read -p "${RED}[*] Do you wish to install Visual Studio Code? y/n" yn
	echo ""
	case $yn in
		[Yy]* ) vscode; break;;
		[Nn]* ) exit;;
		* ) echo "yY or Nn.";;
	esac
done

banner "OK"

while true; do
	read -p "${GREEN}[*] Do you wish to install the Fonts Stack? y/n" yn
	echo ""
	case $yn in
		[Yy]* ) bash installers/fonts.sh; break;;
		[Nn]* ) exit;;
		* ) echo "yY or Nn.";;
	esac
done

banner "OK"

banner "SETTING .RC FILES"


## Set rc's
mv -f .bashrc ~/.bashrc
cp -r .bash/ ~/
mv -f .vimrc ~/.vimrc

## Set xfce
mv -f xfce/terminalrc ~/.config/xfce4/terminal/terminalrc
mv -f xfce/keyboard-layout.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/keyboard-layout.xml
mv -f xfce/xfce4-keyboard-shortcuts.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
mv -f xfce/xfce4-panel.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml


# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


# Source vim before plugin installation
sudo apt install vim
vim +PluginInstall +qall
