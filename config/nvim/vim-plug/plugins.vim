" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

"Themes
Plug 'ajmwagar/vim-deus'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'romainl/flattened'
Plug 'vim-scripts/twilight256.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'lifepillar/vim-solarized8'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'

" Better Syntax Support
Plug 'sheerun/vim-polyglot'

" File Explorer
Plug 'scrooloose/NERDTree'
nmap <silent> <leader>f :NERDTreeToggle<CR>

" Fuzzy File Finder
Plug 'junegunn/fzf.vim'
nmap <C-t> :Files<CR>

" Conquerer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Prettier (Formatter)
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
let g:prettier#autoformat_require_pragma = 0

" Comment/uncomment lines/selections
Plug 'tpope/vim-commentary'
nmap <C-_> gcc

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Autoclose brackets etc.
Plug 'Raimondi/delimitMate'

" Vim/Tmux easy navigation with ctrl-h,j,k,l
Plug 'christoomey/vim-tmux-navigator'

" Perl
" Mojolicious
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'yko/mojo.vim'

let g:snipMate = { 'snippet_version' : 1 }
let mojo_highlight_data = 1

call plug#end()
