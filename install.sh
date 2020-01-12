#!/bin/bash

echo "Starting Installer Script..." 

mkdir ~/Projects ~/go ~/Scripts

chmod +x installers/packages.sh && bash installers/packages.sh
chmod +x installers/cascadia.sh && bash installers/cascadia.sh
chmod +x installers/goinstall.sh && bash installers/goinstall.sh


mv -f .bashrc ~/.bashrc
cp -r .bash/ ~/
mv -f .vimrc ~/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall


