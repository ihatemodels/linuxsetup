#!/bin/bash

RED=`tput bold && tput setaf 1`
RESET=`tput bold && tput sgr 0`
BLUE=`tput bold && tput setaf 4`


banner() {
  echo "${BLUE}+--------------------------------+"
  echo "|                                |"
  printf "|${RED} %-30s `tput sgr0`${RED}|\n" "$@"
  echo "+--------------------------------+${RESET}"
}

banner "btw i use Arch LOL"

sudo pacman -S --noconfirm --needed firefox
sudo pacman -S --noconfirm --needed qbittorrent
sudo pacman -S --noconfirm --needed git
sudo pacman -S --noconfirm --needed vim
sudo pacman -S --noconfirm --needed curl wget
sudo pacman -S --noconfirm --needed htop
sudo pacman -S --noconfirm --needed net-tools

## Zippers
sudo pacman -S --noconfirm --needed unace unrar zip unzip sharutils  uudeview  arj cabextract file-roller
