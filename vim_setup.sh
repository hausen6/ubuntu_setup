#!/usr/bin/env bash
# apt で入れるvimは+luaではないので自分でmake

# makeに必要なツール群
sudo apt-get build-dep vim
sudo apt-get install -y luajit libluajit-5.1

# vim ソースコード取得
cd ~/Downloads
sudo apt-get install -y mercurial
hg clone https://vim.googlecode.com/hg/ vim

# make
cd vim
./configure --with-features=huge \
		--disable-darwin \
		--disable-selinux \
		--enable-multibyte \
		--enable-perlinterp \
		--enable-pythoninterp \
		--enable-rubyinterp \
		--enable-luainterp=dynamic \
		--with-lua-prefix=/usr \
		--with-luajit \
		--enable-fail-if-missing \
make reconfig
sudo make install

# 自分用のvim setting
# vim 用directoryの作成
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/vimbackup

# neobundle install
cd ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim

# もしも./configure でlibluajitがないと言われたら以下をコメントイン
# git clone https://luajit.org/git/luajit-2.0.git
# cd luajit-2.0
# make
# sudo make intall
