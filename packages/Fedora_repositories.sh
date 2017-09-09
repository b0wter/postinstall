function installAdditionallySourceRepositories{
	# Installs the rpm fusion free and non-free repositories.
	sudo dnf -y install dnf-plugins-core
	su -c 'dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'
	sudo dnf -y config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
}
