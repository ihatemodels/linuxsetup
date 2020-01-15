#!/bin/bash

function vscode {
    printf "\n[*] INSTALLING VSCODE..."
	curl -L -o vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868 > /dev/null 2>&1
	sudo dpkg -i vscode.deb
    echo "Done."

	which code &> /dev/null

	if [ $? -ne 0 ]; then
		echo "VSCODE FAILED"
  	else
		echo "VSCODE INSTALLED"
  	fi
}

echo "Starting Installer Script..." 

mkdir ~/Projects ~/Scripts
rm -rf ~/Videos ~/Public ~/Music ~/Templates

while true; do
	read -p "[*] Do you wish to install Golang? y/n" yn
	echo ""
	case $yn in
		[Yy]* ) mkdir ~/go && bash installers/goinstall.sh; break;;
		[Nn]* ) break;;
		* ) echo "yY or Nn.";;
	esac
done

while true; do
	read -p "[*] Do you wish to install Latest Stable Docker? y/n" yn
	echo ""
	case $yn in
		[Yy]* ) bash installers/docker.sh; break;;
		[Nn]* ) break;;
		* ) echo "yY or Nn.";;
	esac
done

while true; do
	read -p "[*] Do you wish to install Visual Studio Code? y/n" yn
	echo ""
	case $yn in
		[Yy]* ) vscode; break;;
		[Nn]* ) exit;;
		* ) echo "yY or Nn.";;
	esac
done

sudo bash installers/packages.sh
bash installers/fonts.sh


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
