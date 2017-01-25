#!/bin/bash
# install and setup FZF

# install ag
sudo dnf install -y the_silver_searcher

# download
git clone https://github.com/junegunn/fzf $HOME/git/fzf

# install
. ~/git/fzf/install
