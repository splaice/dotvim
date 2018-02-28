.PHONY: setup bootstrap update-submodules pull-submodules
SUBMODULES_INIT=.init/ack.vim \
				.init/ctrlp.vim \
				.init/lusty-vim \
				.init/nerdtree \
				.init/syntastic \
				.init/vim-airline \
				.init/vim-bundle-python \
				.init/vim-fugitive \
				.init/vim-gitgutter \
				.init/vim-javascript \
				.init/awesome-vim-colorschemes \
				.init/vim-powerline

setup: update-submodules vimrc gvimrc
	test -f ~/.vimrc && rm ~/.vimrc || true
	test -f ~/.gvimrc && rm ~/.gvimrc || true
	ln -s ~/.vim/vimrc ~/.vimrc
	ln -s ~/.vim/gvimrc ~/.gvimrc

.init:
	@install -d ./.init

update-submodules: .init $(SUBMODULES_INIT)
	git submodule update

pull-submodules: .init $(SUBMODULES_INIT)
	git submodule foreach "(git checkout master; git pull origin master)"

bundle/ack.vim:
	git submodule add https://github.com/mileszs/ack.vim.git $@

.init/ack.vim: .init bundle/ack.vim
	git submodule init
	touch $@

bundle/awesome-vim-colorschemes:
	git submodule add https://github.com/rafi/awesome-vim-colorschemes.git $@

.init/awesome-vim-colorschemes: .init bundle/awesome-vim-colorschemes
	git submodule init
	touch $@

bundle/ctrlp.vim:
	git submodule add https://github.com/kien/ctrlp.vim.git $@

.init/ctrlp.vim: .init bundle/ctrlp.vim
	git submodule init
	touch $@

bundle/lusty-vim:
	git submodule add https://github.com/sjbach/lusty.git $@

.init/lusty-vim: .init bundle/lusty-vim
	git submodule init
	touch $@

bundle/nerdtree:
	git submodule add https://github.com/scrooloose/nerdtree.git $@

.init/nerdtree: .init bundle/nerdtree
	git submodule init
	touch $@

bundle/syntastic:
	git submodule add https://github.com/scrooloose/syntastic.git $@

.init/syntastic: .init bundle/syntastic
	git submodule init
	touch $@

bundle/vim-airline:
	git submodule add https://github.com/vim-airline/vim-airline.git $@

.init/vim-airline: .init bundle/vim-airline
	git submodule init
	touch $@

bundle/vim-bundle-python:
	git submodule add https://github.com/sophacles/vim-bundle-python.git $@

.init/vim-bundle-python: .init bundle/vim-bundle-python
	git submodule init
	touch $@

bundle/vim-fugitive:
	git submodule add git://github.com/tpope/vim-fugitive.git $@

.init/vim-fugitive: .init bundle/vim-fugitive
	git submodule init
	touch $@

bundle/vim-gitgutter:
	git submodule add git://github.com/airblade/vim-gitgutter.git $@

.init/vim-gitgutter: .init bundle/vim-gitgutter
	git submodule init
	touch $@

bundle/vim-javascript:
	git submodule add https://github.com/pangloss/vim-javascript.git $@

.init/vim-javascript: .init bundle/vim-javascript
	git submodule init
	touch $@

bundle/vim-powerline:
	git submodule add https://github.com/Lokaltog/vim-powerline.git $@

.init/vim-powerline: .init bundle/vim-powerline
	git submodule init
	touch $@

bootstrap: update-submodules
	@echo "bootstrapping submodules"
