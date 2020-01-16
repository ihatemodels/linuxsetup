#!/bib/bash


FONTS=~/.local/share/fonts


if [ ! -d "$DIR" ]; then
  mkdir -p FONTS
fi


(git clone \
	--branch release \
	--depth 1 \
	'https://github.com/adobe-fonts/source-code-pro.git' \
	"$FONTS/adobe-fonts/source-code-pro" ) &>/dev/null


wget https://github.com/microsoft/cascadia-code/releases/download/v1911.21/Cascadia.ttf &>/dev/null
mv Cascadia.ttf $FONTS

wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip &>/dev/null
unzip Hack-v3.003-ttf.zip
mv ttf/* $FONTS

fc-cache -f -v | grep succeeded
