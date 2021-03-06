#!/bin/bash
if hash dnf 2>/dev/null ; then
	sudo dnf install -y curl
	sudo dnf install -y neovim
	sudo dnf install -y python2-neovim python3-neovim
elif hash yum 2>/dev/null ; then
	sudo yum install curl
	sudo yum -y install epel-release
	sudo curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo 
	sudo yum -y install neovim
elif hash brew 2>/dev/null ; then
	brew install neovim
elif hash pacman 2>/dev/null ; then
	sudo pacman --noconfirm -S curl
	sudo pacman --noconfirm -S xclip
	sudo pacman --noconfirm -S neovim
elif hash apt 2>/dev/null ; then
	sudo apt install -y curl
	sudo apt install -y xclip 
	sudo apt install -y neovim
elif hash apt-get 2>/dev/null ; then
	sudo apt-get install -y curl
	sudo apt-get install -y xclip 
	sudo apt-get install -y neovim
fi

# create config structure
mkdir -p $HOME/.config/nvim/
mkdir -p $HOME/.config/nvim/backup
mkdir -p $HOME/.config/nvim/undo

# backup current init.vim
if [ -e $HOME/.config/nvim/init.vim ] ; then
    mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/init.vim.bak
fi

# sym-link new init.vim
ln -s $HOME/git/dotfiles/neovim/init.vim $HOME/.config/nvim/init.vim

# install vim-plug
curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# setup virtual environments
virtualenv -p python2 ~/.venv/neovim2/
virtualenv -p python3 ~/.venv/neovim3/

# install neovim package in virtual envs
source ~/.venv/neovim2/bin/activate
pip install neovim
source ~/.venv/neovim3/bin/activate
pip install neovim
deactivate

# symlink ftplugin folder
ln -s $HOME/git/dotfiles/neovim/ftplugin $HOME/.config/nvim/ftplugin

# symlink snippets folder
ln -s $HOME/git/dotfiles/neovim/snippets $HOME/.config/nvim/snippets

# install plugins
nvim +PlugInstall
