#!/usr/bin/env bash

#
# Bootstrap file für die initiale Konfiguration des Post-Install-Skript.
#

bold=$(tput bold)
normal=$(tput sgr0)

printf "\n"
printf "${bold}This script downloads a payload and runs a series of scripts to setup a linux system. Press enter to continue.${normal}"
printf "\n\n"
read ignoreInput

cd $HOME
rm -rf postinstall
mkdir -p postinstall
cd postinstall
curl -LOk https://github.com/b0wter/postinstall/archive/master.zip

# Instead of probing the distro just try to install unzip using all package managers :)
#
sudo apt install unzip
sudo dnf install unzip

unzip master.zip
mv postinstall-master/* ./
rm -rf postinstall-master

printf "\n"
printf "${bold}Bootstrap file finished installing and downloading the necessary components. Press enter to start the post-install-script.${normal}"
printf "\n\n"
read ignoreInput

./post_install.sh