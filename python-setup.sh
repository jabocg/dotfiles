#!/bin/bash
if hash dnf 2>/dev/null ; then
	sudo dnf install -y python2 python3
elif hash yum 2>/dev/null ; then
	sudo yum -y install python2 python3
elif hash brew 2>/dev/null ; then
	brew install python2 python3
elif hash pacman 2>/dev/null ; then
	sudo pacman --noconfirm -S python2 python
	sudo pacman --noconfirm -S python2-pip python-pip
fi

sudo pip install virtualenv
sudo pip3 install virtualenv

virtualenv -p python2 ~/.venv/py2/
virtualenv -p python3 ~/.venv/py3/

sudo pip install ipython
sudo pip3 install ipython
