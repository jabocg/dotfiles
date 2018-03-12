# i3 setup 

# install i3 and i3status
if hash dnf 2>/dev/null ; then
	sudo dnf -y install i3 i3status
else if hash pacman 2>/dev/null ; then
		sudo pacman --noconfirm -S i3-gaps dmenu feh
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

# crate symlink
ln -s ~/git/dotfiles/i3/config ~/.config/i3/config

# install polybar
if hash pacman 2>/dev/null ; then
	sudo pacman --noconfirm -S polybar
fi

# install polybar config
if [ -e ~/.config/polybar ] ; then
	echo "backing up polybar config"
	mv ~/.config/polybar/config ~/.config/polybar/config.bak
else
	mkdir -p ~/.config/polybar/
fi

ln -s ~/git/dotfiles/polybar/* ~/.config/polybar/
