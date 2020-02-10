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

bannr "arch linux sound utils"

sudo pacman -S pulseaudio --noconfirm --needed
sudo pacman -S pulseaudio-alsa --noconfirm --needed
sudo pacman -S pavucontrol  --noconfirm --needed
sudo pacman -S alsa-utils alsa-plugins alsa-lib alsa-firmware --noconfirm --needed
sudo pacman -S volumeicon --noconfirm --needed
