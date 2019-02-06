#!/bin/bash
# setup for ZSH

# set executable
if hash yum 2>/dev/null ; then
	PACK_MAN="yum"
	INST="install"
elif hash brew 2>/dev/null ; then
	PACK_MAN="brew"
	INST="install"
elif hash pacman 2>/dev/null ; then
	PACK_MAN="pacman"
	INST="--noconfirm -S"
elif hash apt-get 2>/dev/null ; then
	PACK_MAN="apt-get"
	INST="install -y"
elif hash apt 2>/dev/null ; then
	PACK_MAN="apt"
	INST="install -y"
fi

echo "Installing zsh..."
ecoh "DON'T FORGET TO EXIT ZSH DURING INSTALL!!!"
sudo $PACK_MAN $INST zsh

echo "Installing oh-my-zsh..."
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# backup current zshrc
echo "Backing up current zshrc..."
if [ -e $HOME/.zshrc ] ; then 
    mv $HOME/.zshrc $HOME/.zshrc.bak
fi

echo "Symlinking zshrc..."
# create symlink
ln -s $HOME/git/dotfiles/zsh/.zshrc $HOME/.zshrc

echo "Installing keychain..."
# install keychain
sudo $PACK_MAN $INST keychain
