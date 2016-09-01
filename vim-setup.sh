# dependencies
sudo dnf -y install cmake clang

# install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install plugins
if [[ `uname` == 'Darwin' ]] ; then
    mvim -c 'PlugInstall'
elif [[ `uname` == 'Linux' ]] ; then
    vimx -c 'PlugInstall'
else
    vim -c 'PlugInstall'
fi
