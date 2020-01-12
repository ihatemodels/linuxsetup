#!/bin/bash

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
	  echo "Installing: ${1}..."
	  apt install -y $1
  else
	  echo "Already installed: ${1}"
  fi
}

apt update
apt remove vim 

while IFS= read -r line
do
  install "$line"
done < "packages.lst"


while IFS= read -r line
do
  apt purge -y  "$line"
done < "junk.lst"

apt autoremove