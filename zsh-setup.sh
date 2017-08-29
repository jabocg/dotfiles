#!/bin/bash
# setup for ZSH

# set executable
if hash yum 2>/dev/null ; then
	PACK_MAN="yum"
	sudo yum install -y zsh
else if hash brew 2>/dev/null ; then
		PACK_MAN="brew"
		brew install zsh
	else if hash pacman 2>/dev/null ; then
			PACK_MAN="pacman"
			pacman --noconfirm -S zsh
		fi
	fi
fi

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# backup current zshrc
if [ -e $HOME/.zshrc ] ; then 
    mv $HOME/.zshrc $HOME/.zshrc.bak
fi

# create symlink
ln -s $HOME/git/dotfiles/zsh/.zshrc $HOME/.zshrc
