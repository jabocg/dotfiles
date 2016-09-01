#!/bin/bash
# install automake and autoconf
brew install automake
sudo dnf -y install automake
brew install autoconf
sudo dnf -y install autoconf
# install socat
sudo dnf -y install socat
brew install socat
sudo # install psutil, python
sudo pip install psutil
# req for pyuv, lib-toolize
sudo dnf -y install libtool
brew install libtool
# install pyuv, python
sudo pip install pyuv
# install i3-py, python
sudo pip install i3-py

# install powerline
sudo pip install powerline-status

# install fonts
git clone https://github.com/powerline/fonts ~/git/powerline-fonts
. ~/git/powerline-fonts/install.sh
echo "install the fonts from ~/git/powerline-fonts"

# install configs
mkdir -p ~/.config/powerline/
cd ~/git/dotfiles/powerline/
for i in * ; do
    echo "symlinking $i"
    ln -s ~/git/dotfiles/powerline/$i ~/.config/powerline/$i
done
