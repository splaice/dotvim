" Include standard vim config
if filereadable(expand("~/.vimrc"))
	source ~/.vimrc
endif

" Set our font
if has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Darwin"
        set guifont=Monaco:h13
    else
        set guifont=Ubuntu\ Mono\ 14
    endif
endif

" Remove right scrollbar
set guioptions-=r

" Remove left scrollbar
set guioptions-=l

" Remove the toolbar
set guioptions-=T

" Highlight cursorline
set cursorline

highlight ColorColumn guibg=Black
