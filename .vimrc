"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
" mostly ripped off from
" https://github.com/nburkley/dotfiles/blob/master/vimrc
" Kudos!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use Vim settings, rather then Vi settings.
set nocompatible
set backspace=2

" set character encoding to utf-8
scriptencoding utfs8
set encoding=utf-8

" don't use swap files
set noswapfile

" Reload files if changed outside vim
set autoread

" use filetype detection
filetype plugin indent on

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set autoindent                  " Set the cursor at same indent as line above
set copyindent                  " Use existing indents for new indents
set shiftround                  " Always round indents to multiple of shiftwidth
set expandtab                   " Prefer spaces to tabs by default
set wildmenu                    " autocomplete list for filesearch
set lazyredraw                  " redraw only when we need to.
set showmatch                   " highlight matching [{()}]

" Share the clipboard outside of macvim
" set clipboard=unnamed

" mouse setting (don't copy linenumbers)
" set mouse=a

" Auto format any pasted text
"nnoremap P P=`]
"nnoremap p p=`]

" don't use vim backup files
set nobackup
set nowritebackup

" Use plugins install by vundle
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Enable spellchecking for Markdown files and git commit messages
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Look and feel
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set font to Source Code Pro, patched for Powerline, size 13
set gfn=Hack:h13

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

set ruler               " set ruler
set number              " add line numbers
"set relativenumber
"set colorcolumn=80     " add line marker at 80 characters
colorscheme molokai     " use molokai colorscheme

" don't highlight row when in insert mode
autocmd InsertEnter,InsertLeave * set cul!
" highlight the line the cursor is on
set cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings and shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use space as leader key
let mapleader = " "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching and indexing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" set some directories to be ignored
set wildignore+=tmp/**
set wildignore+=dist/**
" set wildignore+=public/uploads/**
" set wildignore+=public/images/**
" set wildignore+=vendor/**
" set wildignore+=log/**
" set wildignore+=spec/support/vcr_cassettes/**

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows, buffers & navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make arrowkey do something usefull, resize the viewports accordingly
" nnoremap <Left> :vertical resize +2<CR>
" nnoremap <Right> :vertical resize -2<CR>
" nnoremap <Up> :resize -2<CR>
" nnoremap <Down> :resize +2<CR>
" taken form https://github.com/rhysd/accelerated-jk
"nmap j <Plug>(accelerated_jk_gj)
"nmap k <Plug>(accelerated_jk_gk)

" Better split defaults
set splitbelow
set splitright

" Buffers
" This allows buffers to be hidden if you've modified a buffer.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>t :enew<cr>

" Move to the next buffer
"nmap <leader>l :bnext<cr>
nnoremap <leader>l :bnext<cr>

" Move to the previous buffer
"nmap <leader>h :bprevious<cr>
nnoremap <leader>h :bprevious<cr>

" Close the current buffer and move to the previous one
nmap <leader>q :bp <bar> bd #<cr>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" nerdtree
map <leader>n :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<CR>

" vim-airline
let g:airline_theme='molokai'

" disable tagline
let g:airline#extensions#tagbar#enabled = 1

" enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts=1

" Airline with Unicode (for MacVim)
if has("gui_macvim")
  :nnoremap <Tab> :bnext<CR>
  :nnoremap <S-Tab> :bprevious<CR>
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '◀'
  let g:airline_symbols = {}
  let g:airline_symbols.liner = '¶'
  let g:airline_symbols.branch = '⬍'
  let g:airline_symbols.paste = '✂'
  let g:airline_symbols.whitespace = 'Ξ'
endif

" Tabline looks better
let g:airline#extensions#tabline#enabled = 1

" ctrl-p
" add ctr-b as shortcut for buffer search
nnoremap <leader>b :CtrlPBuffer<CR>

" ignore some files and file types when indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|public\/images\|public\/system\|data\|log\|spec\/support\/vcr_cassettes\|/node_modules\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

" User the silver searcher with Ctrl-P if it's available
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"ack setup
let g:ackhighlight = 1

"incsearch
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set hlsearch
let g:incsearch#auto_nohlsearch = 1
command Diff execute 'w !git diff --no-index % -'

" use eslint to lint js
let g:syntastic_javascript_checkers = ['eslint']

" get rid of | between panes. Note! Meaningful whitespace at the end
set fillchars+=vert:\ 
hi VertSplit ctermbg=236

" change shape of cursor in insert mode in iTerm 2

if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI    = "\<Esc>]50;CursorShape=0\x7"
endif
