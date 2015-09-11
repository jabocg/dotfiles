#!/bin/bash

# if .bashrc exists, make a backup and then create the symlink
if [ -e ~/.bashrc ] ; then
    cp ~/.bashrc ~/.bashrc.bak
    rm ~/.bashrc
fi
ln -s ~/git/dotfiles/bash/.bashrc ~/.bashrc

# if .bash_aliases exists, make a backup and then create the symlink
if [ -e ~/.bash_aliases ] ; then
    cp ~/.bash_aliases ~/.bash_aliases.bak
    rm ~/.bash_aliases
fi
ln -s ~/git/dotfiles/bash/.bash_aliases ~/.bash_aliases

# if .dircolors exists, make a backup and then create the symlink
if [ -e ~/.dircolors ] ; then
    cp ~/.dircolors ~/.dircolors.bak
    rm ~/.dircolors
fi
ln -s ~/git/dotfiles/bash/.dircolors ~/.bashrc
