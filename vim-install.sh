#!/bin/bash
set -x
sudo dnf install -y ruby ruby-devel lua lua-devel luajit \
     luajit-devel ctags git python python-devel \
     python3 python3-devel tcl-devel \
     perl perl-devel perl-ExtUtils-ParseXS \
     perl-ExtUtils-XSpp perl-ExtUtils-CBuilder \
     perl-ExtUtils-Embed ncurses ncurses-libs \
     ncurses-static ncurses-devel libX11 libX11-common \
     libX11-devel
# symlink xsubpp (perl) from /usr/bin to the perl dir
sudo ln -s /usr/bin/xsubpp /usr/share/perl5/ExtUtils/xsubpp
git clone https://github.com/vim/vim.git vim-src
cd vim-src
./configure --with-features=huge \
         --enable-multibyte \
         --enable-rubyinterp \
         --enable-pythoninterp \
         --with-python-config-dir=/usr/lib/python2.7/config \
         --enable-perlinterp \
         --enable-luainterp \
         --enable-gui=auto --enable-cscope --prefix=/usr \
         --with-tlib=ncurses --with-x
 make VIMRUNTIMEDIR=/usr/share/vim/vim74
 sudo make install
 sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
 sudo update-alternatives --set editor /usr/bin/vim
 sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
 sudo update-alternatives --set vi /usr/bin/vim
