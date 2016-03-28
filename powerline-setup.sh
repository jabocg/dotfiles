#!/bin/bash
# install automake and autoconf
brew install automake
dnf install automake
brew install autoconf
dnf install autoconf
# install socat
dnf install socat
brew install socat
# install psutil, python
pip install psutil
# req for pyuv, lib-toolize
dnf install libtool
brew install libtool
# install pyuv, python
pip install pyuv
# install i3-py, python
pip install i3-py

# install powerline
pip install powerline-status

# install fonts
git clone git@home.github.com:powerline/fonts ~/git/powerline-fonts
. ~/git/powerline-fonts/install.sh
echo "install the fonts from ~/git/powerline-fonts"

# install configs
mkdir -p ~/.config/powerline/
cd ~/git/dotfiles/powerline/
for i in * ; do
    echo "symlinking $i"
    ln -s ~/git/dotfiles/powerline/$i ~/.config/powerline/$i
done
