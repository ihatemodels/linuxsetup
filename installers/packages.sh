#!/bin/bash

apt update 

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
	  echo "Installing: ${1}..."
	  apt install -y $1
  else
	  echo "Already installed: ${1}"
  fi
}

function remove {
	which $1 &> /dev/null

	if [ $? -ne 0 ]; then
		echo "Item not found: ${1}"
  	else
		apt purge -y $1
  	fi
}

 
while IFS= read -r line; do
  remove "$line"
done < "junk.lst"

rm -rf /opt/extrax.ubuntu.com/
apt autoremove -y

while IFS= read -r line; do
  install "$line"
done < "packages.lst"
