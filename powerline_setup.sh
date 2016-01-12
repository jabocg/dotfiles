# install socat
dnf install socat
# install psutil, python
pip install psutil
# req for pyuv, lib-toolize
dnf install libtool
# install pyuv, python
pip install pyuv
# install i3-py, python
pip install i3-py

# install powerline
pip install powerline-status

# install fonts
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

# Linux only stuff
echo "use these on linux, if can't patch"
echo "mv PowerlineSymbols.otf ~/.fonts/"
echo "fc-cache -vf ~/.fonts/"
echo "mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/"
