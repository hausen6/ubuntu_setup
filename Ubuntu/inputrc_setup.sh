#!/bin/sh
# if [ ! -f ~/.inputrc ]; then
# 	echo '~/.inputrc is exist'
# else
	echo "Make new file -> ~/.inputrc ..."
	#  *** Make new ~/.inputrc ***
	echo "# ignore case in bash (e.g a / A" >> ~/.inputrc
	echo "set completion-ignore-case on" >> ~/.inputrc
	echo "# ONLY 1 time push <TAB> -> completion" >> ~/.inputrc
	echo "set show-all-if-ambiguous on" >> ~/.inputrc
	#  *** Make new ~/.inputrc ***
	echo ""
	echo "Reload ~/.inputrc"
	echo "Please push : <C-x><C-r>"
# fi
