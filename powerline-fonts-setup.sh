#!/bin/bash
cd $HOME/git/
git clone https://github.com/powerline/fonts powerline-fonts
cd powerline-fonts
. ./install.sh
# mkdir -p $HOME/.fonts/
# cp "$HOME/git/powerline-fonts/DejaVuSansMono/DejaVu Sans Mono for Powerline.ttf" $HOME/.fonts/
# fc-cache -v
