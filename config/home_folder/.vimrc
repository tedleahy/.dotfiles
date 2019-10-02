" To unlock the full potential of vim - got to be set first
set nocompatible

" Vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" --- Make Vim look good ---
Plugin 'arcticicestudio/nord-vim'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" --- File browser ---
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" --- Syntastic - gives error checking next to the line numbers ---
Plugin 'vim-syntastic/syntastic'

" --- vim-easytags and tagbar ---
" These let you see what kinds of methods, variables, functions and other
" types of declarations you have in your files
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'

" --- Fuzzy file finder:
"  ctrl-p to open,
"  enter to open file,
"  ctrl+t to open in new tab
Plugin 'ctrlpvim/ctrlp.vim'

" shows a +/-/~ next to lines that have been added/removed/modified
Plugin 'airblade/vim-gitgutter'

" Makes working w/ Git from w/in Vim incredibly easy. Common commands:
" - git add                  --> :Gwrite
" - git commit               --> :Gcommit
" - git push                 --> :Gpush
" - git checkout <file name> --> :Gread
" - git blame                --> :Gblame
Plugin 'tpope/vim-fugitive'

" Insert matching delimiters automatically
Plugin 'Raimondi/delimitMate'

" Pane navigator
Plugin 'christoomey/vim-tmux-navigator'

" Easily surround chunks of texts
Plugin 'tpope/vim-surround'

" Align CSV files at commas, align Markdown tables, and more
Plugin 'godlygeek/tabular'

" Automaticall insert closing HTML tags
Plugin 'HTML-AutoCloseTag'

" Haskell plugins
Plugin 'neovimhaskell/haskell-vim'
Plugin 'alx741/vim-hindent'
Plugin 'dense-analysis/ale'
Plugin 'parsonsmatt/intero-neovim'

call vundle#end()

filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler			" show cursor position all the time
set number			" show line numbers
set showcmd			" display incomplete commands
set incsearch			" do incremental searching
set hlsearch			" use syntax highlighting in searches

syntax on

set mouse=a " Enable the mouse

" Needed for plugins like Syntastic and vim-gitgutter which put symbols in the
" sign column
hi clear SignColumn

" ----- Plugin-Specific Settings -----

" --- colorscheme settings ---
set background=light
colorscheme nord " set colorscheme

" --- bling/vim-airline settings ---
set laststatus=2 " Always show status bar

let g:solarized_termcolors=256
let g:airline_powerline_fonts=1 " enable patched fonts
let g:airline_detect_paste=1 " show PASTE if in paste mode
let g:airline#extensions#tabline#enabled=1 " show airline for tabs too
let g:airline_theme='nord' " use nord theme for the airline status bar

" --- jistr/vim-nerdtree-tabs settings ---
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup=0

" --- scrooloose/nerdtree settings ---
nmap <silent> <leader>f :NERDTreeToggle<CR>

" --- scrooloose/syntastic settings ---
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = '▲'
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = 'passive'
augroup END

" --- xolox/vim-easytags settings ---
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" --- mjutsushi/tagbar settings ---
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>

" --- airblade/vim-gitgutter settings ---
"  In vim-airline, only display 'hunks' if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" --- Raimondi/delimitMate settings ---
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END
