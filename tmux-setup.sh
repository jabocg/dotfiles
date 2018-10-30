#!/bin/bash

# install
if hash brew 2>/dev/null ; then
	brew install tmux
elif hash apt 2>/dev/null ; then
	sudo apt install -y tmux
elif hash apt-get 2>/dev/null ; then
	sudo apt-get install -y tmux
elif hash dnf 2>/dev/null ; then
	sudo dnf -y install tmux
elif hash pacman 2>/dev/null ; then
	sudo pacman --noconfirm -S tmux
fi

# if .tmux.conf exists, back up
if [ -e ~/.tmux.conf ] ; then
    echo "Backing up .tmux.conf"
    cp ~/.tmux.conf ~/.tmux.conf.bak
    echo "Removing .tmux.conf"
    rm ~/.tmux.conf
fi
echo "Creatin symlink to .tmux.conf"
ln -s ~/git/dotfiles/tmux/.tmux.conf ~/.tmux.conf

