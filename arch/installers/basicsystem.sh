#!/bin/bash

set -e

sudo pacman -S --noconfirm --needed firefox
sudo pacman -S --noconfirm --needed qbittorrent
sudo pacman -S --noconfirm --needed git
sudo pacman -S --noconfirm --needed curl wget
sudo pacman -S --noconfirm --needed htop
sudo pacman -S --noconfirm --needed net-tools

## Zippers
sudo pacman -S --noconfirm --needed unace unrar zip unzip sharutils  uudeview  arj cabextract file-roller
