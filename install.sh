#!/bin/bash

function vscode {
    echo "Installing vscode..."
	curl -L -o vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868 > /dev/null 2>&1
	dpkg -i vscode.deb
    echo "Done."
}

echo "Starting Installer Script..." 

mkdir ~/Projects ~/Scripts
rm -rf ~/Videos ~/Public ~/Music ~/Templates

while true; do
	read -p "Do you wish to install Golang?" yn
	case $yn in
		[Yy]* ) mkdir ~/go && bash installers/goinstall.sh; break;;
		[Nn]* ) break;;
		* ) echo "yY or Nn.";;
	esac
done


while true; do
	read -p "Do you wish to install Visual Studio Code?" yn
	case $yn in
		[Yy]* ) vscode; break;;
		[Nn]* ) exit;;
		* ) echo "yY or Nn.";;
	esac
done

sudo bash installers/packages.sh
bash installers/cascadia.sh


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
