#!/bin/bash
# setup git configs
git config --global user.name "Jacob Gersztyn"
git config --global user.email "jabocg@gmail.com"
git config --global push.default simple

# use neovim for the editor
git config --global core.editor nvim

# tell less to not paginate if less than 1 page
git config --global core.pager "less -F -X"

if [ -e ~/.gitignore_global ] ; then
    mv ~/.gitignore_global ~/.gitignore_global.bak
fi
ln -s ~/git/dotfiles/git/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
