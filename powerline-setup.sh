#!/bin/bash
# install automake and autoconf
if hash brew 2>/dev/null ; then
	brew install automake autoconf socat libtool
elif hash dnf 2>/dev/null ; then
	sudo dnf install automake autoconf socat libtool
elif hash pacman 2>/dev/null ; then
	sudo pacman --noconfirm -S automake autoconf socat libtool
elif hash apt 2>/dev/null ; then
	sudo apt install -y automake autoconf socat libtool
elif hash apt-get 2>/dev/null ; then
	sudo apt-get install -y automake autoconf socat libtool
fi

pip install --user psutil pyuv i3-py

# install powerline
sudo pip3 install powerline-status

# install fonts
echo "installing powerline fonts"
git clone https://github.com/powerline/fonts $HOME/git/powerline-fonts
sh $HOME/git/powerline-fonts/install.sh

# install gitstatus
pip3 install --user powerline-gitstatus

# install configs
mkdir -p $HOME/.config/powerline/
cd $HOME/git/dotfiles/powerline/
for i in * ; do
	echo "symlinking $i"
	ln -s $HOME/git/dotfiles/powerline/$i $HOME/.config/powerline/$i
done
