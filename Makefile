.PHONY: setup bootstrap update-submodules
SUBMODULES_INIT=.init/vim-powerline .init/ctrlp.vim .init/ack.vim \
				.init/vim-bundle-python bundle/vim-markdown .init/vim-less \
				.init/vim-javascript .init/vim-vimux .init/nerdtree \
				.init/vim-conque .init/webapi-vim .init/gist-vim .init/lusty-vim

setup: update-submodules vimrc gvimrc
	test -f ~/.vimrc && rm ~/.vimrc || true
	test -f ~/.gvimrc && rm ~/.gvimrc || true
	ln -s ~/.vim/vimrc ~/.vimrc
	ln -s ~/.vim/gvimrc ~/.gvimrc

.init:
	@install -d ./.init

update-submodules: .init $(SUBMODULES_INIT)
	git submodule update

bundle/vim-powerline:
	git submodule add https://github.com/Lokaltog/vim-powerline.git $@

.init/vim-powerline: .init bundle/vim-powerline
	git submodule init
	touch $@

bundle/ctrlp.vim:
	git submodule add https://github.com/kien/ctrlp.vim.git $@

.init/ctrlp.vim: .init bundle/ctrlp.vim
	git submodule init
	touch $@

bundle/ack.vim:
	git submodule add https://github.com/mileszs/ack.vim.git $@

.init/ack.vim: .init bundle/ack.vim
	git submodule init
	touch $@

bundle/vim-bundle-python:
	git submodule add https://github.com/sophacles/vim-bundle-python.git $@

.init/vim-bundle-python: .init bundle/vim-bundle-python
	git submodule init
	touch $@

bundle/vim-markdown:
	git submodule add https://github.com/tpope/vim-markdown.git $@

.init/vim-markdown: .init bundle/vim-markdown
	git submodule init
	touch $@

bundle/vim-less:
	git submodule add https://github.com/groenewege/vim-less.git $@

.init/vim-less: .init bundle/vim-less
	git submodule init
	touch $@

bundle/vim-javascript:
	git submodule add https://github.com/pangloss/vim-javascript.git $@

.init/vim-javascript: .init bundle/vim-javascript
	git submodule init
	touch $@

bundle/vim-vimux:
	git submodule add https://github.com/benmills/vimux.git $@

.init/vim-vimux: .init bundle/vim-vimux
	git submodule init
	touch $@

bundle/nerdtree:
	git submodule add https://github.com/scrooloose/nerdtree.git $@

.init/nerdtree: .init bundle/nerdtree
	git submodule init
	touch $@

bundle/vim-conque:
	git submodule add git@github.com:splaice/vim-conque.git $@

.init/vim-conque: .init bundle/vim-conque
	git submodule init
	touch $@

bundle/webapi-vim:
	git submodule add https://github.com/mattn/webapi-vim.git $@

.init/webapi-vim: .init bundle/webapi-vim
	git submodule init
	touch $@

bundle/gist-vim:
	git submodule add https://github.com/mattn/gist-vim.git $@

.init/gist-vim: .init bundle/gist-vim
	git submodule init
	touch $@

bundle/lusty-vim:
	git submodule add https://github.com/sjbach/lusty.git $@

.init/lusty-vim: .init bundle/lusty-vim
	git submodule init
	touch $@

bootstrap: update-submodules
	@echo "bootstrapping submodules"
