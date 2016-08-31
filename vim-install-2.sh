#!/bin/bash
set -x

# get dependencies
sudo dnf install -y ruby ruby-devel lua lua-devel luajit \
     luajit-devel ctags git python python-devel \
     python3 python3-devel tcl-devel \
     perl perl-devel perl-ExtUtils-ParseXS \
     perl-ExtUtils-XSpp perl-ExtUtils-CBuilder \
     perl-ExtUtils-Embed ncurses ncurses-libs \
     ncurses-static ncurses-devel libX11 libX11-common \
     libX11-devel

# get source
cd ~
git clone https://github.com/vim/vim.git
cd vim

# configure
env LDFLAGS=-L/usr/lib64/ 
./configure --with-features=huge \
	--with-tlib=ncurses \
	--enable-multibyte \
	--enable-rubyinterp \
	--enable-pythoninterp \
	--enable-python3interp \
	--enable-perlinterp \
	--enable-gui=auto \
	--enable-cscope \
	--prefix=/usr

# install
make VIMRUNTIMEDIR=/usr/share/vim/vim74
sudo make install
