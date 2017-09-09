#
# Installs the packages from the package list.
#
PACKAGE_DIR="packages"
BASE_PACKAGE_FILENAME="packages.txt"

# Adds the additional  
#
function installAdditionalRepositories(){
	. "$DIR/packages/$OS_repositories.sh"
}

function installPackages() {

	printf "Installing distribution specific packages."
	cat $PACKAGE_DIR/$BASE_PACKAGE_FILENAME | xargs $INSTALL_PACKAGE_COMMAND

	printf "Installing host specific packages."
	cat $PACKAGE_DIR/$HOSTNAME.txt | xargs $INSTALL_PACKAGE_COMMAND
}