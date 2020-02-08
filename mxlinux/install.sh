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
		[Yy]* ) sudo bash packages.sh remove; break;;
		[Nn]* ) break;;
		* ) echo "yY or Nn.";;
	esac
done

banner "OK"

echo "${YELLOW}Do you wish to install the packages listed in packages.lst ?${RED}"

while true; do
	read -p "${BLUE}" yn
	case $yn in
		[Yy]* ) sudo bash packages.sh install; break;;
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
		[Yy]* ) bash ../installers/goinstall.sh && banner "GO IS RDY TO GO"; break;;
		[Nn]* ) break;;
		* ) echo "yY or Nn.";;
	esac
done

banner "OK"

while true; do
	read -p "${YELLOW}[*] Do you wish to install Latest Stable Docker? y/n" yn
	case $yn in
		[Yy]* ) sudo bash ../debian/installers/docker.sh && banner "Dock the Docker"; break;;
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
		[Yy]* ) bash ../installers/fonts.sh; break;;
		[Nn]* ) exit;;
		* ) echo "yY or Nn.";;
	esac
done

banner "OK"
