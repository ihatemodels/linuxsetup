#!/bin/bash

set -e

RED=`tput bold && tput setaf 1`
RESET=`tput bold && tput sgr 0`
BLUE=`tput bold && tput setaf 4`


banner() {
  echo "${BLUE}+--------------------------------+"
  echo "|                                |"
  printf "|${RED} %-30s `tput sgr0`${RED}|\n" "$@"
  echo "+--------------------------------+${RESET}"
}

banner "xfce4 & lightm installer"

sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm --needed lightdm
sudo pacman -S xfce4 xfce4-goodies --noconfirm --needed
sudo systemctl enable lightdm.service -f
sudo systemctl set-default graphical.target
