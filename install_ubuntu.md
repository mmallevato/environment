# Install Ubuntu

## Update BIOS

## Configure BIOS (as necessary)

-   Secure Boot = Disabled
-   Graphics = Discreet
-   Boot Mode = UEFI
-   SATA Controller Mode = AHCI

## Minimal install Ubuntu 18.04

## Get software

Check Software Updater > Settings > Other Software > Canonical Partners

```sh
sudo apt update

sudo apt full-upgrade

sudo apt install vim screen tree adobe-flashplugin browser-plugin-freshplayer-pepperflash gparted exfat-fuse exfat-utils default-jre default-jdk netmap

sudo apt full-upgrade

sudo reboot
```

## Set vi as the default text editor

```sh
sudo update-alternatives --config editor
```

## Configure Settings

## Configure Files preferences

## Delete default directories

## Configure Firefox preferences

## [set_environment.md](set_environment.md)

## Set up SSH

```sh
sudo apt-get install openssh-server

sudo service ssh status

sudo vi /etc/ssh/sshd_config

sudo service ssh restart
```
