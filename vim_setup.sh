#!/bin/bash

# A setup script to initialize all my vim stuffs

cd ~
mkdir temp
cd temp

echo "Getting vim-pathogen"
git clone https://github.com/tpope/vim-pathogen
mkdir -p ~/.vim/autoload/ ~/.vim/bundle
cp -r vim-pathogen/autoload/ ~/.vim/
rm -rf vim-pathogen

cd ~/.vim/bundle/
echo "Getting vim-abolish"
git clone https://github.com/tpope/vim-abolish.git
echo "Getting vim-commentary"
git clone https://github.com/tpope/vim-commentary.git
echo "Getting vim-fugitive"
git clone https://github.com/tpope/vim-fugitive.git
echo "Getting vim-reapeat"
git clone https://github.com/tpope/vim-repeat.git
echo "Getting vim-surround"
git clone https://github.com/tpope/vim-surround.git
echo "Getting vim-bufkill"
git clone https://github.com/qpkorr/vim-bufkill.git
echo "Added vim-fugitive helptags"
vim -u NONE -c "helptags vim-fugitive/doc" -c q

echo "Copying .vimrc"
if [ -e ~/.vimrc ]; then
    echo "Backing up .vimrc"
    cp ~/.vimrc ~/.vimrc.bak
    echo "Removing .vimrc"
    rm ~/.vimrc
fi
echo "Symlinking .vimrc"
ln -s ~/git/dotfiles/vim/.vimrc ~/.vimrc

