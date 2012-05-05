.PHONY: setup bootstrap update-submodules
SUBMODULES_BUNDLES=bundle/vim-powerline bundle/ctrlp.vim bundle/ack.vim bundle/vim-bundle-python bundle/vim-fugitive bundle/vim-git bundle/vim-markdown

setup: update-submodules vimrc gvimrc
	rm ~/.vimrc
	rm ~/.gvimrc
	ln -s ~/.vim/vimrc ~/.vimrc
	ln -s ~/.vim/gvimrc ~/.gvimrc

update-submodules: $(SUBMODULE_BUNDLES)
	git submodule update

bundle/vim-powerline:
	git submodule add https://github.com/Lokaltog/vim-powerline.git $@
	git submodule init

bundle/ctrlp.vim:
	git submodule add https://github.com/kien/ctrlp.vim.git $@
	git submodule init

bundle/ack.vim:
	git submodule add https://github.com/mileszs/ack.vim.git $@
	git submodule init

bundle/vim-bundle-python:
	git submodule add https://github.com/sophacles/vim-bundle-python.git $@
	git submodule init

bundle/vim-fugitive:
	git submodule add https://github.com/tpope/vim-fugitive.git $@
	git submodule init

bundle/vim-git:
	git submodule add https://github.com/tpope/vim-git.git $@
	git submodule init

bundle/vim-markdown:
	git submodule add https://github.com/tpope/vim-markdown.git $@
	git submodule init

bootstrap: $(SUBMODULE_BUNDLES) update-submodules
	@echo "bootstrapping submodules"
