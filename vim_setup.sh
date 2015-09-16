#!/bin/bash

# A setup script to initialize all my vim stuffs

# get vim-pathogen, a plugin manager
cd ~
mkdir temp
cd temp
echo "Getting vim-pathogen"
git clone https://github.com/tpope/vim-pathogen
mkdir -p ~/.vim/autoload/ ~/.vim/bundle
cp -r vim-pathogen/autoload/ ~/.vim/
rm -rf vim-pathogen

cd ~/.vim/bundle/
# get vim-abolish
echo "Getting vim-abolish"
git clone https://github.com/tpope/vim-abolish.git

# get vim-commentary
echo "Getting vim-commentary"
git clone https://github.com/tpope/vim-commentary.git

# get vim-fugitive
echo "Getting vim-fugitive"
git clone https://github.com/tpope/vim-fugitive.git

# get vim-repeat
echo "Getting vim-reapeat"
git clone https://github.com/tpope/vim-repeat.git

# get vim-surround
echo "Getting vim-surround"
git clone https://github.com/tpope/vim-surround.git

# get vim-bufkill
echo "Getting vim-bufkill"
git clone https://github.com/qpkorr/vim-bufkill.git

# update vim helptags
echo "Added vim-fugitive helptags"
vim -u NONE -c "helptags vim-fugitive/doc" -c q

# install cpp-enhanced-highlight
git clone https://github.com/octol/vim-cpp-enhanced-highlight.git /tmp/vim-cpp-enhanced-highlight
mkdir -p ~/.vim/after/syntax/
mv /tmp/vim-cpp-enhanced-highlight/after/syntax/cpp.vim ~/.vim/after/syntax/cpp.vim
rm -rf /tmp/vim-cpp-enhanced-highlight

# if .vimrc exists, create a backup
echo "Copying .vimrc"
if [ -e ~/.vimrc ]; then
    echo "Backing up .vimrc"
    cp ~/.vimrc ~/.vimrc.bak
    echo "Removing .vimrc"
    rm ~/.vimrc
fi
echo "Creating a symlink to .vimrc"
ln -s ~/git/dotfiles/vim/.vimrc ~/.vimrc

