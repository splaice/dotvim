" Load pathogen
filetype off
call pathogen#infect()
call pathogen#helptags()

" The basics
set nocompatible
set hidden

set number
set ruler
syntax on

" Set encoding
set encoding=utf-8

" Whitespace handling
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set list listchars=tab:\ \ ,trail:·

set list

" Searching
set hlsearch
set incsearch
"set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*.pyc,*.pyo

" Status bar
set laststatus=2

" Use visualbell
set visualbell

" Show (partial) command in the status line
set showcmd

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Use modeline overrides
set modeline
set modelines=10

" Set no folding
set nofoldenable

" Set colorscheme
"colorscheme Tomorrow-Night-Eighties
"colorscheme jellybeans
"colorscheme molokai

if has('gui_running')
    set background=dark
    colorscheme jellybeans
else
    set background=dark
    colorscheme molokai
endif

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Enable indent plugin
filetype plugin indent on

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
au BufRead,BufNewFile .pp set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

"au BufRead,BufNewFile *.txt call s:setupWrapping()

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79 colorcolumn=80

" html
au BufRead,BufNewFile *.html set softtabstop=4 tabstop=4 shiftwidth=4

" yaml
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/syntax/yaml.vim

" ctrl+p config
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.egg-info
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|env$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_match_window_bottom = 0
nmap <C-B> :CtrlPBuffer<CR>

" nerdtree
nmap <leader>\ :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" conque terminal
nmap <leader>t :ConqueTermSplit bash<CR>

" vertical split
nmap <leader>v :vsplit<CR>

" horizontal split
nmap <leader>h :split<CR>

" Some split changes based on
" http://robots.thoughtbot.com/post/48275867281/vim-splits-move-faster-and-more-naturally

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" More natural split opening
set splitbelow
set splitright

" Resizing splits
" Max out the height of the current split
"ctrl + w _

" Max out the width of the current split
"ctrl + w |

" Normalize all split sizes, which is very handy when resizing terminal
"ctrl + w =

" Swap top/bottom or left/right split
"Ctrl+W R

" Break out current window into a new tabview
"Ctrl+W T

" Close every window in the current tabview but the current one
"Ctrl+W o

" reload file
nmap <leader>r :edit<CR>

" show existing marks
nmap <leader>m :marks<CR>

" 80 col marker
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" backupdir
set backupdir=$HOME/.vim/tmp
set directory=$HOME/.vim/tmp
