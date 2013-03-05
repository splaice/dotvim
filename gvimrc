" Include standard vim config
if filereadable(expand("~/.vimrc"))
	source ~/.vimrc
endif

" Set our font
set guifont=Monaco:h14

" Remove right scrollbar
set guioptions-=r

" Remove left scrollbar
set guioptions-=l

" Remove the toolbar
set guioptions-=T

" Highlight cursorline
set cursorline

highlight ColorColumn guibg=Black
