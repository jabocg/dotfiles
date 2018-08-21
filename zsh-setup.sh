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
fi

sudo $PACK_MAN $INST zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# backup current zshrc
if [ -e $HOME/.zshrc ] ; then 
    mv $HOME/.zshrc $HOME/.zshrc.bak
fi

# create symlink
ln -s $HOME/git/dotfiles/zsh/.zshrc $HOME/.zshrc

# install keychain
sudo $PACK_MAN $INST keychain
