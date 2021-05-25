#!/bin/sh

set -o nounset
set -o errexit

installnodemac() {
	brew install lua
	brew install node
	brew install yarn
}

installnodeubuntu() {
	sudo apt install nodejs
	sudo apt install npm
}

moveoldnvim() {
	echo "Not installing"
	echo "Please move your ~/.config/nvim folder before installing"
	exit
}

installnodearch() {
	sudo pacman -S nodejs
	sudo pacman -S npm
}

installnodefedora() {
    sudo dnf install -y nodejs 
    sudo dnf install -y npm
}

installnode() {
	echo "Installing node..."
	[ "$(uname)" == "Darwin" ] && installnodemac
	[ -n "$(cat /etc/os-release | grep Ubuntu)" ] && installnodeubuntu
	[ -f "/etc/arch-release" ] && installnodearch
	[ -f "/etc/artix-release" ] && installnodearch
	[ -f "/etc/fedora-release" ] && installnodefedora
	[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ] && echo "Windows not supported"
	sudo npm i -g neovim
}

installpiponmac() {
	sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python3 get-pip.py
	rm get-pip.py
}

installpiponubuntu() {
	sudo apt install python3-pip >/dev/null
}

installpiponarch() {
    sudo pacman -S python-pip
}

installpiponfedora() {
	sudo dnf install -y pip >/dev/nul
}

installpip() {
	echo "Installing pip..."
	[ "$(uname)" == "Darwin" ] && installpiponmac
	[ -n "$(cat /etc/os-release | grep Ubuntu)" ] && installpiponubuntu
	[ -f "/etc/arch-release" ] && installpiponarch
	[ -f "/etc/fedora-release" ] && installpiponfedora
	[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ] && echo "Windows not supported"
}

installpynvim() {
	echo "Installing pynvim..."
	pip3 install pynvim --user
}

installpacker() {
	git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

cloneconfig() {
	echo "Cloning configuration"
    git clone https://github.com/lucaschreiner/nvim.git ~/.config/nvim
	nvim -u $HOME/.config/nvim/init.lua +PackerInstall
}

asktoinstallnode() {
	echo "node not found"
	echo -n "Would you like to install node now (y/n)? "
	read answer
	[ "$answer" != "${answer#[Yy]}" ] && installnode
}

asktoinstallpip() {
	echo "Please install pip3 before continuing with install"
	exit
}

installonmac() {
	brew install ripgrep fzf ranger
	npm install -g tree-sitter-cli
}

pipinstallueberzug() {
	which pip3 >/dev/null && pip3 install ueberzug || echo "Not installing ueberzug pip not found"
}

installonubuntu() {
	sudo apt install ripgrep fzf ranger
	sudo apt install libjpeg8-dev zlib1g-dev python-dev python3-dev libxtst-dev
	pip3 install ueberzug
	pip3 install neovim-remote
	npm install -g tree-sitter-cli
}

installonarch() {
	sudo pacman -S ripgrep fzf ranger
	which yay >/dev/null && yay -S python-ueberzug-git || pipinstallueberzug
	pip3 install neovim-remote
	npm install -g tree-sitter-cli
}

installonfedora() {
    sudo dnf groupinstall "X Software Development"
    sudo dnf install -y fzf ripgrep ranger
    pip3 install wheel ueberzug
}

installextrapackages() {
	[ "$(uname)" == "Darwin" ] && installonmac
	[ -n "$(cat /etc/os-release | grep Ubuntu)" ] && installonubuntu
	[ -f "/etc/arch-release" ] && installonarch
	[ -f "/etc/artix-release" ] && installonarch
	[ -f "/etc/fedora-release" ] && installonfedora
	[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ] && echo "Windows not supported"
}

echo 'Installing..'

# move old nvim directory if it exists
[ -d "$HOME/.config/nvim" ] && moveoldnvim

which pip3 >/dev/null && echo "pip installed.." || asktoinstallpip

which node >/dev/null && echo "node installed.." || asktoinstallnode

pip3 list | grep pynvim >/dev/null && echo "pynvim installed.." || installpynvim

if [ -e "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
	echo 'packer already installed'
else
	installpacker
fi

if [ -e "$HOME/.config/nvim/init.lua" ]; then
	echo 'already exists'
else
	cloneconfig
fi

