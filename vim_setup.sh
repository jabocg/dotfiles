# I HAVE CHANGED EVERYTHING
# NO LONGER USING PATHOGEN
# NOW USING VUNDLE
# FIX THIS
# TOTO


# make the directories if needed
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/ftplugin

# make symlink for .vimrc
if [ -e ~/.vimrc ] ; then
    echo ".vimrc exists, backing up"
    mv ~/.vimrc ~/.vimrc.bak
fi

echo "creating symlink for .vimrc"
ln -s ~/git/dotfiles/vim/.vimrc ~/.vimrc

# get Vundle
cd ~/.vim/bundle
echo "cloning Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim

# run vim and install plugins
vim +PluginInstall +all

# install YCM
echo "installing YouCompleteMe"
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

# put eclim stuff here?
