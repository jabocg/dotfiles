#!/bin/bash
# install automake and autoconf
brew install automake
sudo dnf install -y automake
brew install autoconf
sudo dnf install -y autoconf
# install socat
sudo dnf install -y socat
brew install socat
 pip install --user psutil
# req for pyuv, lib-toolize
sudo dnf install -y libtool
brew install libtool
# install pyuv, python
pip install --user pyuv
# install i3-py, python
pip install --user i3-py

# install powerline
sudo pip install powerline-status

# install fonts
git clone https://github.com/powerline/fonts $HOME/git/powerline-fonts
. $HOME/git/powerline-fonts/install.sh
echo "installing powerline fonts"
mkdir -p $HOME/.fonts/
cp "$HOME/git/powerline-fonts/DejaVuSansMono/DejaVu Sans Mono for Powerline.ttf" $HOME/.fonts/
fc-cache -v

# install configs
mkdir -p $HOME/.config/powerline/
cd $HOME/git/dotfiles/powerline/
for i in * ; do
    echo "symlinking $i"
    ln -s $HOME/git/dotfiles/powerline/$i $HOME/.config/powerline/$i
done
