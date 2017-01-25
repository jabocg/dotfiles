#!/bin/bash
mkdir -p $HOME/.fonts/
cp "$HOME/git/powerline-fonts/DejaVuSansMono/DejaVu Sans Mono for Powerline.ttf" $HOME/.fonts/
fc-cache -v
