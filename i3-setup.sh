# i3 setup 

# install i3 and i3status
sudo dnf install i3 i3status

# symlink the configs and shit
if [ ! -e ~/.config/i3/config ] ; then
    echo "backing up i3 config"
    mv ~/.config/i3/config ~/.config/i3/config.bak
fi

# create dir if needed
if [ ! -e ~/.config/i3/ ] ;then
    mkdir -p ~/.config/i3
fi

# crate symlink
ln -s ~/git/dotfiles/i3/config ~/.config/i3/config
