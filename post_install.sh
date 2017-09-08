#!/usr/bin/env bash

# Include the other script files.
#
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/find_os_and_version.sh"
. "$DIR/install_packages.sh"
. "$DIR/configure_ssh.sh"

echo 'Please enter the password for the encrypted files.'
read GPG_PASSWORD
echo 'Checking if sudo is enabled.'
sudo touch "test"
sudo rm "test"

setOsAndVersion
displayArchitectureHint
installPackages
extractSshArchive