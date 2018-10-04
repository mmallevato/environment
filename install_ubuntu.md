# Install Ubuntu

## Configure BIOS

Update BIOS

Configure BIOS

-   Secure Boot = Disabled
-   Graphics = Discreet
-   Boot Mode = UEFI
-   SATA Controller Mode = AHCI

## Minimal install Ubuntu 18.04.1

Check `Install third-party software for graphics and Wi-Fi hardware and additional media formats`

Check `Erase disk and install Ubuntu`

## Configure browser

## Get software

Check `Software Updater` > `Settings` > `Other Software` > `Canonical Partners`

Check `Software Updater` > `Settings` > `Additional Drivers` >

```sh
sudo apt update &&

sudo apt full-upgrade --yes &&

sudo apt install --yes vim screen tree rename gparted exfat-fuse exfat-utils dconf-editor xserver-xorg-input-synaptics default-jdk adobe-flashplugin browser-plugin-freshplayer-pepperflash &&

sudo apt full-upgrade --yes &&

sudo reboot
```

## Configure text editor

```sh
sudo update-alternatives --config editor
```

## [Configure Synaptics](80-synaptics.conf)

## Configure Settings

## Configure Files

## Configure dock

[Put Trash on dock](trash.sh)

## [Configure environment](configure_environment.md)

## Configure SSH

```sh
sudo apt install --yes openssh-server &&

sudo service ssh status
```

## Serve from UCSD

```sh
sudo apt install --yes openconnect &&
sudo openconnect vpn-2.ucsd.edu  # Choose 'allthruucsd'
```
