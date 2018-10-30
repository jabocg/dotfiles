#!/bin/bash
ecoh "Installing python..."
if hash dnf 2>/dev/null ; then
	sudo dnf install -y python2 python3
elif hash yum 2>/dev/null ; then
	sudo yum -y install python2 python3
elif hash brew 2>/dev/null ; then
	brew install python2 python3
elif hash pacman 2>/dev/null ; then
	sudo pacman --noconfirm -S python2 python
	sudo pacman --noconfirm -S python2-pip python-pip
elif hash apt 2>/dev/null ; then
	sudo apt install -y python python3
	sudo apt install -y python-pip python3-pip
elif hash apt-get 2>/dev/null ; then
	sudo apt-get install -y python python3
	sudo apt-get install -y python-pip python3-pip
fi

echo "Installing virtualenv..."
sudo pip install setuptools virtualenv
sudo pip3 install setuptools virtualenv

echo "Setting up virtualenvs..."
virtualenv -p python2 ~/.venv/py2/
virtualenv -p python3 ~/.venv/py3/

ecoh "Installing ipython..."
sudo pip install ipython
sudo pip3 install ipython
