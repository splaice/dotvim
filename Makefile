.PHONY: setup bootstrap update-submodules
SUBMODULES_INIT=.init/vim-powerline .init/ctrlp.vim .init/ack.vim .init/vim-bundle-python bundle/vim-markdown

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

bootstrap: update-submodules
	@echo "bootstrapping submodules"
