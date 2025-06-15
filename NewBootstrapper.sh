# Novarin Bootstrapper for Linux
# By fone :3

set -x

VERSION="1.0"

echo "[INFO] Novarin Linux Bootstrapper $VERSION"

cd ~/
mkdir ~/.novarin
cd ~/.novarin

# Check if NovarinUpdateHelper.sh exists.

if ! test -f ~/.novarin/Update.sh; then
  	echo "Update Helper doesn't exist. Creating it.."
	touch Update.sh
	echo "if test -f ~/.novarin/NewBootstrapper.sh; then" >> Update.sh
	echo "	rm ~/.novarin/Bootstrapper.sh" >> Update.sh
	echo "	mv ~/.novarin/NewBootstrapper.sh ~/.novarin/Bootstrapper.sh" >> Update.sh
	echo "  rm ~/.novarin/NewBootstrapper.sh" >> Update.sh
	echo "fi" >> Update.sh
fi

# Update Wine & wget.

echo "[UPDATING] Wine & wget"

sudo apt install -y wine wget

echo "[INFO] Wine & wget updated to latest version"
echo "[INFO] Getting Bootstrapper Version"

mkdir ~/.BootstrapperTemp
cd ~/.BootstrapperTemp

wget https://raw.githubusercontent.com/SneakyAhhDiddyAhhBlud/SneakyAhhBludActivities/refs/heads/main/BootstrapperVersion.txt

GH_VERSION=$(< BootstrapperVersion.txt)

if [[ "$GH_VERSION" == "$VERSION" ]]; then
	echo "[INFO] Bootstrapper on Latest Version"
	cd ~/.novarin
	rm -rf ~/.BootstrapperTemp
else
	echo "[UPDATING] Novarin Bootstrapper"
	rm -rf ~/.BootstrapperTemp
	cd ~/.novarin
	wget https://raw.githubusercontent.com/SneakyAhhDiddyAhhBlud/SneakyAhhBludActivities/refs/heads/main/NewBootstrapper.sh
	exec ./Update.sh
fi
