#!/usr/bin/env sh
# ubuntuがpythonのコンパイルをするために必要なもののインストール
# sudo apt-get install git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev

PYENV_ROOT=$HOME/.pyenv
echo "install pyenv -> $PYENV_ROOT"

# pyenvのダウンロード
git clone git://github.com/yyuu/pyenv ~/.pyenv
git clone git://github.com/yyuu/pyenv-virtualenv ~/.pyenv/plugins/pyenv-virtualenv
git clone git://github.com/yyuu/pyenv-which-ext ~/.pyenv/plugins/python-which-ext

# bashのセッティング
add_bashrc()
{
	echo $1 >> $HOME/.bashrc
}
add_bashrc 'if [[ !-x $PYENV_ROOT ]]; then'
add_bashrc "    export PYENV_ROOT=$PYENV_ROOT"
add_bashrc '    export PATH=$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH'
add_bashrc "fi"
add_bashrc 'eval "$(pyenv init -)"'
add_bashrc 'eval "$(pyenv virtualenv-init -)"'

# sudo時にもpathを引き継ぐように
echo "以下の記述をvisudo時に加えてください."
echo "Defaults    env_keep=\"PATH\""
echo "Defaults    env_keep=\"PYENV_ROOT\""
read yes
sudo visudo
