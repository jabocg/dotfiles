#!/bin/bash
# install fonts
echo "installing powerline fonts"
git clone https://github.com/powerline/fonts $HOME/git/powerline-fonts
sh $HOME/git/powerline-fonts/install.sh
