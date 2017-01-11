#!/bin/bash

# create config structure
mkdir -p $HOME/.config/nvim/
mkdir -p $HOME/.config/nvim/backup
mkdir -p $HOME/.config/nvim/undo

# backup current init.vim
if [ -e $HOME/.config/nvim/init.vim ] ; then
    mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/init.vim.bak
fi

# sym-link new init.vim
ln -s $HOME/git/dotfiles/neovim/init.vim $HOME/.config/nvim/init.vim

# install vim-plug
curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install plugins
nvim +PlugInstall +qa
