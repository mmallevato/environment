# Install Ubuntu

## Update BIOS

## Configure BIOS

-   Secure Boot = Disabled
-   Graphics = Discreet
-   Boot Mode = UEFI
-   SATA Controller Mode = AHCI

## Minimal install Ubuntu 18.04.01

## Configure browser

## Get software

Check Software Updater > Settings > Other Software > Canonical Partners

Check Software Updater > Settings > Additional Drivers >

```sh
sudo apt update

sudo apt full-upgrade

sudo apt install vim screen tree gparted exfat-fuse exfat-utils default-jdk adobe-flashplugin browser-plugin-freshplayer-pepperflash

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

## [set_environment.md](set_environment.md)

## Configure dock

## Set up SSH

```sh
sudo apt install openssh-server

sudo service ssh status
```

## Serve from UCSD

```sh
sudo apt install openconnect
sudo openconnect vpn-2.ucsd.edu  # Choose 'allthruucsd'
ssh user@<public IP>
```
