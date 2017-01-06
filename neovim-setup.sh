#!/bin/bash

# backup current init.vim
if [ -e ~/.config/nvim/init.vim ] ; then
    mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bak
fi

# sym-link new init.vim
ln -s ~/git/dotfiles/neovim/init.vim ~/.config/nvim/init.vim

# install vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install plugins
nvim +PlugInstall +qa
