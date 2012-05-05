.PHONY: setup bootstrap update-submodules
SUBMODULES_BUNDLES=bundle/vim-powerline bundle/ctrlp.vim bundle/ack.vim bundle/vim-bundle-python bundle/vim-fugitive bundle/vim-git bundle/vim-markdown
SUBMODULES_INIT=.init/vim-powerline .init/ctrlp.vim .init/ack.vim .init/vim-bundle-python .init/vim-fugitive .init/vim-git bundle/vim-markdown

setup: update-submodules vimrc gvimrc
	rm ~/.vimrc
	rm ~/.gvimrc
	ln -s ~/.vim/vimrc ~/.vimrc
	ln -s ~/.vim/gvimrc ~/.gvimrc

.init:
	@install -d ./.init

update-submodules: $(SUBMODULE_BUNDLES) $(SUBMODULES_INIT)
	git submodule update

init-submodules: $(SUBMODULE_BUNDLES)

bundle/vim-powerline:
	git submodule add https://github.com/Lokaltog/vim-powerline.git $@

.init/vim-powerline: .init bundle/vim-powerline
	git submodule init

bundle/ctrlp.vim:
	git submodule add https://github.com/kien/ctrlp.vim.git $@

.init/ctrlp.vim: .init bundle/ctrlp.vim
	git submodule init

bundle/ack.vim:
	git submodule add https://github.com/mileszs/ack.vim.git $@

.init/ack.vim: .init bundle/ack.vim
	git submodule init

bundle/vim-bundle-python:
	git submodule add https://github.com/sophacles/vim-bundle-python.git $@

.init/vim-bundle-python: .init bundle/vim-bundle-python
	git submodule init

bundle/vim-fugitive:
	git submodule add https://github.com/tpope/vim-fugitive.git $@

.init/vim-fugitive: .init bundle/vim-fugitive
	git submodule init

bundle/vim-git:
	git submodule add https://github.com/tpope/vim-git.git $@

.init/vim-git: .init bundle/vim-git
	git submodule init

bundle/vim-markdown:
	git submodule add https://github.com/tpope/vim-markdown.git $@

.init/vim-markdown: .init bundle/vim-markdown
	git submodule init

bootstrap: $(SUBMODULE_BUNDLES) update-submodules
	@echo "bootstrapping submodules"
