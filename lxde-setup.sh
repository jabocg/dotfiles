#!/bin/bash

# if lxde exists, make a backup
if [ -e ~/.config/openbox/lxde-rc.xml ] ; then
    echo "Backing up lxde-rc.xml"
    cp ~/.config/openbox/lxde-rc.xml ~/.config/openbox/lxde-rc.xml.bak
    echo "Removing lxde-rc.xml"
    rm ~/.config/openbox/lxde-rc.xml
fi
echo "Creating symlink to lxde-rc.xml"
ln -s ~/git/dotfiles/lxde/lxde-rc.xml ~/.config/openbox/lxde-rc.xml
