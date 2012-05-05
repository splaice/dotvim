.PHONY: setup bootstrap update-submodules

setup: update-submodules vimrc gvimrc
	rm ~/.vimrc
	rm ~/.gvimrc
	ln -s ~/.vim/vimrc ~/.vimrc
	ln -s ~/.vim/gvimrc ~/.gvimrc

update-submodules:
	git submodule init
	git submodule update

bundle/vim-powerline:
	git submodule add https://github.com/Lokaltog/vim-powerline.git $@

bundle/ctrlp.vim:
	git submodule add https://github.com/kien/ctrlp.vim.git $@

bundle/ack.vim:
	git submodule add https://github.com/mileszs/ack.vim.git $@

bundle/vim-bundle-python:
	git submodule add https://github.com/sophacles/vim-bundle-python.git $@

bundle/vim-fugitive:
	git submodule add https://github.com/tpope/vim-fugitive.git $@

bundle/vim-git:
	git submodule add https://github.com/tpope/vim-git.git $@

bundle/vim-markdown:
	git submodule add https://github.com/tpope/vim-markdown.git $@

bootstrap: bundle/vim-powerline bundle/ctrlp.vim bundle/ack.vim bundle/vim-bundle-python bundle/vim-fugitive bundle/vim-git bundle/vim-markdown update-submodules
	@echo "bootstrapping submodules"
