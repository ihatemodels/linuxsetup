#!/bib/bash

echo "Fonts installer"

FONTS=~/.local/share/fonts

mkdir -p "$FONTS/adobe-fonts/source-code-pro"

(git clone \
	--branch release \
	--depth 1 \
	'https://github.com/adobe-fonts/source-code-pro.git' \
	"$FONTS/adobe-fonts/source-code-pro" )


wget https://github.com/microsoft/cascadia-code/releases/download/v1911.21/Cascadia.ttf
mv Cascadia.ttf ~/.local/share/fonts/

wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
unzip Hack-v3.003-ttf.zip
mv ttf/* ~/.local/share/fonts/

fc-cache -f -v

