#!/bin/bash

# A setup script to initialize all my vim stuffs

cd ~
mkdir temp
cd temp

git clone https://github.com/tpope/vim-pathogen
mkdir -p ~/.vim/autoload/ ~/.vim/bundle
cp -r vim-pathogen/autoload/ ~/.vim/
rm -rf vim-pathogen

cd ~/.vim/bundle/
git clone https://github.com/tpope/vim-abolish.git
git clone https://github.com/tpope/vim-commentary.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/tpope/vim-repeat.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/qpkorr/vim-bufkill.git
vim -u NONE -c "helptags vim-fugitive/doc" -c q

