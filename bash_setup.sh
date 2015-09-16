#!/bin/bash

# if .bashrc exists, make a backup and then create the symlink
if [ -e ~/.bashrc ] ; then
    echo "Backing up .bashrc"
    cp ~/.bashrc ~/.bashrc.bak
    echo "Removing .bashrc"
    rm ~/.bashrc
fi
echo "Creating a symlink to .bashrc"
ln -s ~/git/dotfiles/bash/.bashrc ~/.bashrc

# if .bash_aliases exists, make a backup and then create the symlink
if [ -e ~/.bash_aliases ] ; then
    echo "Backing up .bash_aliases"
    cp ~/.bash_aliases ~/.bash_aliases.bak
    echo "Removing .bash_alises"
    rm ~/.bash_aliases
fi
echo "Creating a symlink to .bash_aliases"
ln -s ~/git/dotfiles/bash/.bash_aliases ~/.bash_aliases

# if .dircolors exists, make a backup and then create the symlink
if [ -e ~/.dircolors ] ; then
    echo "Backing up .dircolors"
    cp ~/.dircolors ~/.dircolors.bak
    echo "Removing .dircolors"
    rm ~/.dircolors
fi
echo "Creating a symlink to .dircolors"
ln -s ~/git/dotfiles/bash/.dircolors ~/.dircolors
