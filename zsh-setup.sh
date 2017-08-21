#!/bin/bash
# setup for ZSH

# install zsh
sudo dnf install -y zsh || sudo yum install -y zsh || sudo apt-get install zsh || brew install zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# backup current zshrc
if [ -e $HOME/.zshrc ] ; then 
    mv $HOME/.zshrc $HOME/.zshrc.bak
fi

# create symlink
ln -s $HOME/git/dotfiles/zsh/.zshrc $HOME/.zshrc
