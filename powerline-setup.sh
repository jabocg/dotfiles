#!/bin/bash
# install automake and autoconf
brew install automake || sudo dnf install -y automake
brew install autoconf || sudo dnf install -y autoconf
# install socat
sudo dnf install -y socat || brew install socat
pip install --user psutil
# req for pyuv, lib-toolize
sudo dnf install -y libtool || brew install libtool
# install pyuv, python
pip install --user pyuv
# install i3-py, python
pip install --user i3-py

# install powerline
pip install powerline-status

# install fonts
echo "installing powerline fonts"
git clone https://github.com/powerline/fonts $HOME/git/powerline-fonts
. $HOME/git/powerline-fonts/install.sh

# install configs
mkdir -p $HOME/.config/powerline/
cd $HOME/git/dotfiles/powerline/
for i in * ; do
    echo "symlinking $i"
    ln -s $HOME/git/dotfiles/powerline/$i $HOME/.config/powerline/$i
done
