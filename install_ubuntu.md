# Install Ubuntu

## Update BIOS

## Configure BIOS

-   SATA Controller Mode = AHCI
-   Boot Mode = UEFI
-   Secure Boot = Disabled
-   Legacy Mode = Enabled

## Install Ubuntu 16.04 LTS

## Trim launcher

## Remove softwares

## Get softwares

```sh
sudo apt update; sudo apt upgrade
sudo apt install gparted exfat-fuse fat-utils screen vim git tree
sudo apt clean; sudo apt autoremove
```

## Configure System Settings

-   Auto-hide launcher
-   Add show desktop icon to the launcher
-   Decrease typing delay (t)
-   Increase typing speed (maximum)
-   Enable natural scrolling
-   Show weekday
-   Show date and month
-   Show year
-   Use 24-hour time
-   Show seconds

# Set vi as the default text editor

```sh
sudo update-alternatives --config editor
```

## Configure File view (Edit --> Preferences)

## [set_environment.md](set_environment.md)

## Set up SSH

```sh
sudo apt-get install openssh-server
sudo service ssh status
#sudo vi /etc/ssh/sshd_config
#sudo service ssh restart
```
