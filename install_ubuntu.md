# Install Ubuntu

## Update BIOS

## Configure BIOS

-   SATA Controller Mode = AHCI
-   Boot Mode = UEFI
-   Secure Boot = Disabled
-   Legacy Mode = Enabled

## Install Ubuntu 16.04.3 LTS

## Trim launcher

## Get softwares

```sh
sudo apt update && sudo apt upgrade

sudo apt install gparted exfat-fuse exfat-utils screen vim tree

sudo apt clean && sudo apt autoremove

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
