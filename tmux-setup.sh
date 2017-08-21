#!/bin/bash

# install
brew install tmux || sudo apt-get install tmux || sudo dnf -y install tmux

# if .tmux.conf exists, back up
if [ -e ~/.tmux.conf ] ; then
    echo "Backing up .tmux.conf"
    cp ~/.tmux.conf ~/.tmux.conf.bak
    echo "Removing .tmux.conf"
    rm ~/.tmux.conf
fi
echo "Creatin symlink to .tmux.conf"
ln -s ~/git/dotfiles/tmux/.tmux.conf ~/.tmux.conf

