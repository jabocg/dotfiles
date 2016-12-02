#!/bin/bash
# setup for ZSH

# install zsh
sudo dnf install zsh -y

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# backup current zshrc
if [ -e ~/.zshrc ] ; then 
    mv ~/.zshrc ~/.zshrc.bak
fi

# create symlink
ln -s ~/git/dotfiles/zsh/.zshrc ~/.zshrc
