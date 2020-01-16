#!/bin/bash


function remove {
	which $1 &> /dev/null

	if [ $? -ne 0 ]; then
		echo "Item not found: ${1}"
  	else
		apt purge -y $1 &>/dev/null
  	fi
}

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
	  echo "Installing: ${1}"
	  apt install -y $1 &>/dev/null
	  if [ $? -ne 0 ]; then
	  	echo "${1} Installed"
		which $1
	  else
	  	echo "${1} installtion returned non 0 code"
	  fi
  else
	  echo "Already installed: ${1}"
  fi
}


if [[ "$1" == "remove" ]]; then
	while IFS= read -r line; do
		remove "$line"
	done < "junk.lst"
	rm -rf /opt/extrax.ubuntu.com/
	apt autoremove -y
fi

if [[ "$1" == "install" ]]; then
	while IFS= read -r line; do
  		install "$line"
	done < "packages.lst"
fi
