# I HAVE CHANGED EVERYTHING
# NO LONGER USING PATHOGEN
# NOW USING VUNDLE
# FIX THIS
# TOTO


# make the directories if needed
mkdir -p ~/.vim/ftplugin

# make symlink for .vimrc
if [ -e ~/.vimrc ] ; then
    echo ".vimrc exists, backing up"
    mv ~/.vimrc ~/.vimrc.bak
fi

echo "creating symlink for .vimrc"
ln -s ~/git/dotfiles/vim/.vimrc ~/.vimrc

# get vim-plug
echo "cloning Vundle"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# run vim and install plugins
vim +PluginInstall 

# put eclim stuff here?
