#
# Configures the ssh options.
#

SSH_FOLDER="$HOME/ssh"

function extractSshArchive(){
	mkdir -p $SSH_FOLDER
	gpg --passphrase $GPG_PASSWORD -d "ssh/ssh.tar.gz.gpg" | tar -C $SSH_FOLDER -xz
}