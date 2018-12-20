#!/bin/bash
# install and setup FZF

# install ag
if hash dnf 2>/dev/null ; then
	sudo dnf install -h the_silver_searcher
elif hash yum 2>/dev/null ; then
	sudo yum install the_silver_searcher
elif hash brew 2>/dev/null ; then
	brew install the_silver_searcher
elif hash pacman 2>/dev/null ; then
	sudo pacman -S the_silver_searcher
elif hash apt 2>/dev/null ; then
	sudo apt install silversearcher-ag
elif hash apt-get 2>/dev/null ; then
	sudo apt-get install silversearcher-ag
fi

# download
git clone https://github.com/junegunn/fzf $HOME/git/fzf

# install
. ~/git/fzf/install
