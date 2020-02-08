# BTW I USE ARCH (STARTER PACK)

![arch](./img/arch.png)

## Arch Linux Installation Process

#### Set ntp

```bash
timedatectl set-ntp true
## Confirm
timedatectl status
```

#### Partitions and File-system

- sda is the first located disk in you system. If you have more than one disk execute the commands below carefully. Your best friend is the lsblk utility.

> [lsblk man page](http://man7.org/linux/man-pages/man8/lsblk.8.html)

```bash
lsblk
cfdisk
# Make 2 primary partitions. Mark the first one sda1 as bootable.
# Change the second partition to linux swap(option 82 in the list).
# Write the changes.
mkfs.ext4 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mount /dev/sda1 /mnt
```

#### Install base system and chroot

```bash
## Edit the mirror list
## Chose locations near to you
vi /etc/pacman.d/mirrolist
## Install base system
pacstrap /mnt base linux linux-firmware base-devel vi grub dhcpcd net-tools iproute2
genfstab -U /mnt >> /mnt/etc/fstab
## Chroot
arch-chroot /mnt
```

#### Set the time-zone and local

```bash
ln -sf /usr/share/zoneinfo/Europe/Sofia /etc/localtime
hwclock --systohc
locale-gen

vi /etc/locale.conf
LANG=en_US.UTF-8

## Set hostname
vi /etc/hostname

## Set /etc/hosts
vi /etc/hosts

127.0.0.1	localhost
::1		localhost
127.0.1.1	<hostname>.localdomain <hostname>
```

#### Set root password and create user

```bash
pacman -S sudo

## Set root password
passwd

## Create user and set password

useradd -m user
passwd user

usermod -aG wheel,audio,video,optical,storage user

## Confirm

groups user

## Enable sudo

visudo

## Uncomment the #.wheel(...) line
```

#### Install grub boot-loader

```bash
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
```

#### Install xorg

```bash
pacman -S xorg
```

#### Reboot and install network-manager

```bash
reboot

sudo systemctl enable dhcpcd.service
sudo pacman -S networkmanager
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service

## Confirm
sudo systemctl status NetworkManager.service
```

## Install Desktop environment and software

#### Install xfce4 on fresh arch installation

```bash
bash /arch/installers/xfce.sh
```

#### Install firefox, qbittorrent, git, curl, wget, htop, net-tools, and archieve utils

```bash
bash arch/installers/basicsystem.sh
```
