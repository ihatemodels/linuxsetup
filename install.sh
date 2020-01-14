#!/bin/bash

echo "Starting Installer Script..." 

mkdir ~/Projects ~/go ~/Scripts
rm -rf ~/Videos ~/Public ~/Music ~/Templates
sudo rm -rf /opt/extrax.ubuntu.com/

sudo bash installers/packages.sh
chmod +x installers/cascadia.sh && bash installers/cascadia.sh
chmod +x installers/goinstall.sh && bash installers/goinstall.sh

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
