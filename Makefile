.PHONY: setup

setup: ~/.vim/vimrc ~/.vim/gvimrc
	rm ~/.vimrc
	rm ~/.gvimrc
	ln -s ~/.vim/vimrc ~/.vimrc
	ln -s ~/.vim/gvimrc ~/.gvimrc
