# Install Ubuntu

## Update BIOS

## Configure BIOS (as necessary)

-   Secure Boot = Disabled
-   Graphics = Discreet
-   Boot Mode = UEFI
-   SATA Controller Mode = AHCI

## Install Ubuntu 18.04

## Get software

```sh
sudo apt update

sudo apt upgrade

sudo apt install vim screen tree adobe-flashplugin browser-plugin-freshplayer-pepperflash gparted exfat-fuse exfat-utils

sudo apt clean

sudo apt autoremove

sudo reboot
```

## Configure System Settings

## Set vi as the default text editor

```sh
sudo update-alternatives --config editor
```

## Configure File view (Edit --> Preferences)

## [set_environment.md](set_environment.md)

## Set up SSH

```sh
sudo apt-get install openssh-server

sudo service ssh status

sudo vi /etc/ssh/sshd_config

sudo service ssh restart
```
