#!/bin/sh
update ubuntu
sudo apt-get -y update
sudo apt-get -y upgrade
 
# setting for vim
sudo apt-get -y install vim
if [ ! -f ~/.vimrc ]; then
    echo "nnoremap <C-j> <ESC>" >> ~/.vimrc
    echo "inoremap <C-j> <ESC>" >> ~/.vimrc
    echo "vnoremap <C-j> <ESC>" >> ~/.vimrc
fi

# install and update Guake
sudo apt-get -y install guake

# install and update Git
sudo apt-get -y install git

# colorscheme solarized
mkdir ~/Github
cd ~/Github
git clone git://github.com/coolwanglu/guake-colors-solarized
cd guake-colors-solarized
./set_dark.sh

# font
sudo apt-get -y install fontforge
sudo apt-get -y install fonts-inconsolata
# 次に Migu 1Mフォントを入れる
echo "Migu 1M フォントを入れてください"

cd ~
chmod 777 ros_setup.sh
./ros_setup.sh
