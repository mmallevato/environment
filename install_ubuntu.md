# Install Ubuntu

## Burn [Ubuntu 18.10](https://www.ubuntu.com/download/desktop) onto a USB using [Etcher](https://www.balena.io/etcher/)

## Update BIOS

## Configure BIOS

Secure Boot = Disabled

Graphics = Discreet

Boot Mode = UEFI

SATA Controller Mode = AHCI

## Boot from the USB and install Ubuntu

Check `Minimal installation`

Check `Install third-party software for graphics and Wi-Fi hardware and additional media formats`

Check `Erase disk and install Ubuntu`

## Update software

Check `Software & Updates` > `Other Software` > `Canonical Partners`

Check `Software & Updates` > `Additional Drivers` > (if any) Driver(s) >  `Apply`

Run `Software Updater`

## Get software

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

## Configure Synaptics

[80-synaptics.conf](80-synaptics.conf)

```sh
sudo mkdir /etc/X11/xorg.conf.d

sudo cp 80-synaptics.conf /etc/X11/xorg.conf.d
```

## Configure Settings

## Configure Files

## Configure dock

## Put Trash on dock

[trash.sh](trash.sh)

```sh
chmod +x trash.sh

mv trash.sh ~/.trash.sh

~/.trash.sh -e
```

Add to `Starup Applications` `/home/kwatme/.trash.sh -d`

Uncheck `dconf-editor` > `trash-icon-visible`

## [Configure environment](configure_environment.md)

## Configure SSH

```sh
sudo apt install --yes openssh-server &&

sudo service ssh status
```

## Serve from UCSD

```sh
sudo apt install --yes openconnect &&

sudo openconnect vpn-2.ucsd.edu
```
