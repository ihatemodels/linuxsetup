#!/bin/bash


echo "Installing Cascadia font"

wget https://github.com/microsoft/cascadia-code/releases/download/v1911.21/Cascadia.ttf
cp Cascadia.ttf ~/.local/share/fonts/
fc-cache -f -v 
rm Cascadia.ttf
