#!/bin/bash
# install automake and autoconf
if hash brew 2>/dev/null ; then
	brew install automake autoconf socat libtool
elif hash dnf 2>/dev/null ; then
	sudo dnf install automake autoconf socat libtool
elif hash pacman 2>/dev/null ; then
	yes | sudo pacman -S automake autoconf socat libtool
fi

pip install --user psutil pyuv i3-py

# install powerline
pip install --user powerline-status

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
