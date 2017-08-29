#!/bin/bash
# setup git configs
git config --global user.name "Jacob Gersztyn"
git config --global user.email "jabocg@gmail.com"
git config --global push.default simple

git config --global core.editor nvim

if [ -e ~/.gitignore_global ] ; then
    mv ~/.gitignore_global ~/.gitignore_global.bak
fi
ln -s ~/git/dotfiles/git/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
