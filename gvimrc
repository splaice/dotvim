" Include standard vim config
if filereadable(expand("~/.vimrc"))
	source ~/.vimrc
endif

" Remove right scrollbar
set guioptions-=r

" Remove left scrollbar
set guioptions-=l

" Remove the toolbar
set guioptions-=T

" Highlight cursorline
set cursorline

" Set our font
set guifont=Menlo:h12

" Set colorscheme for gui
set background=dark
colorscheme jellybeans

" Include standard vim config
if filereadable(expand("~/.vim/vimrc.local"))
	source ~/.vim/vimrc.local
endif
