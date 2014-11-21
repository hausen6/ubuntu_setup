#!/usr/bin/env bash
# apt で入れるvimは+luaではないので自分でmake

# makeに必要なツール群
sudo apt-get build-dep vim
sudo apt-get install luajit libluajit-5.1

# vim ソースコード取得
cd ~/Downloads
sudo apt-get install mercurial
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

# もしも./configure でlibluajitがないと言われたら以下をコメントイン
# git clone https://luajit.org/git/luajit-2.0.git
# cd luajit-2.0
# make
# sudo make intall