# I HAVE CHANGED EVERYTHING
# NO LONGER USING PATHOGEN
# NOW USING VUNDLE
# FIX THIS
# TOTO


# make the directories if needed
mkdir -p ~/.vim/ftplugin

# make backup and undo directories
mkdir -p ~/.vim/backup/
mkdir -p ~/.vim/undo/

# make symlink for .vimrc
if [ -e ~/.vimrc ] ; then
    echo ".vimrc exists, backing up"
    mv ~/.vimrc ~/.vimrc.bak
fi

echo "creating symlink for .vimrc"
ln -s ~/git/dotfiles/vim/.vimrc ~/.vimrc

if [ -e ~/.vimkey ] ; then
    echo ".vimkey already exists, making back up"
    mv ~/.vimkey ~/.vimkey.bak
fi

echo "creating symlink for .vikey"
ln -s ~/git/dotfiles/vim/.vimkey ~/.vimkey


# get vim-plug
echo "cloning Vundle"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install cmake
brew install cmake || sudo dnf install cmake || sudo apt-get install cmake
# run vim and install plugins
vim +PlugInstall 

# put eclim stuff here?

echo "symlinking ftplugin files"
for i in ~/git/dotfiles/vim/ftplugin/* ; do
    echo "symlinking $i"
    ln -s ~/git/dotfiles/vim/ftplugin/$i ~/.vim/ftplugin/$i
done
