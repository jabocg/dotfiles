# i3 setup 

# install i3 and i3status
if hash dnf 2>/dev/null ; then
	sudo dnf -y install i3 i3status
else if hash pacman 2>/dev/null ; then
		sudo pacman --noconfirm -S i3-wm dmenu feh
	fi
fi

# symlink the configs and shit
if [ -e ~/.config/ ] ; then 
	if [ ! -e ~/.config/i3/config ] ; then
		echo "backing up i3 config"
		mv ~/.config/i3/config ~/.config/i3/config.bak
	fi
else
	mkdir -p ~/.config/i3/
fi

# create dir if needed
if [ ! -e ~/.config/i3/ ] ;then
    mkdir -p ~/.config/i3
fi

# crate symlink
ln -s ~/git/dotfiles/i3/config ~/.config/i3/config
