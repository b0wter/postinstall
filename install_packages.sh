#
# Installs the packages from the package list.
#

PACKAGE_LIST='packages.txt'
PACKAGE_LIST_FEDORA='packages_fedora.txt'
PACKAGE_LIST_UBUNTU='packages_ubuntu.txt'

function installPackages() {

	if [[ $OS == "Fedora" ]];
	then
		echo 'Using dnf package manager.'
		PACKAGE_MANAGER_INSTALL='sudo dnf -y install'
	elif [[ $OS == 'Ubuntu' ]]; then
		echo 'Using apt package manager.'
		PACKAGE_MANAGER_INSTALL='sudo apt-get -y install'
	fi

	echo 'Installing global packages.'
	cat $PACKAGE_LIST | xargs $PACKAGE_MANAGER_INSTALL

	echo 'Installing distribution specific packages.'
	if [[ ($OS == "Fedora") && ( -f "$PACKAGE_LIST_FEDORA") ]];
	then
		echo 'Installing Fedora specific packages.'
		cat $PACKAGE_LIST_FEDORA | xargs $PACKAGE_MANAGER_INSTALL
	elif [[ ($OS == "Ubuntu") && ( -f "$PACKAGE_LIST_UBUNTU") ]];
	then
		echo 'Installing Ubuntu specific packages.'
		cat $PACKAGE_LIST_UBUNTU | xargs $PACKAGE_MANAGER_INSTALL
	fi
}