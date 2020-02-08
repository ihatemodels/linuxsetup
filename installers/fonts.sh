#!/bib/bash

RED=`tput bold && tput setaf 1`
RESET=`tput bold && tput sgr 0`
BLUE=`tput bold && tput setaf 4`


banner() {
  echo "${BLUE}+--------------------------------+"
  echo "|                                |"
  printf "|${RED} %-30s `tput sgr0`${RED}|\n" "$@"
  echo "+--------------------------------+${RESET}"
}

FONTS=~/.local/share/fonts


if [ ! -d "$DIR" ]; then
  mkdir -p FONTS
fi

banner "Installing Source-Code-Pro"

(git clone \
	--branch release \
	--depth 1 \
	'https://github.com/adobe-fonts/source-code-pro.git' \
	"$FONTS/adobe-fonts/source-code-pro" ) &>/dev/null

banner "Installing Cascadia.ttf"
wget https://github.com/microsoft/cascadia-code/releases/download/v1911.21/Cascadia.ttf &>/dev/null
mv Cascadia.ttf $FONTS

banner "Installing Hack-v3.ttf"
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip &>/dev/null
unzip Hack-v3.003-ttf.zip
mv ttf/* $FONTS


rm -rf Hack-v3.003-ttf.zip

fc-cache -f -v | grep succeeded
