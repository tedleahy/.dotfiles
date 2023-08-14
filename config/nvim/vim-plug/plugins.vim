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

" Linting
Plug 'w0rp/ale'

" Git integration
Plug 'tpope/vim-fugitive'

" Better Syntax Support
Plug 'sheerun/vim-polyglot'

" File Explorer
Plug 'scrooloose/NERDTree'
nmap <silent> <leader>f :NERDTreeToggle<CR>

" Fuzzy File Finder
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'
nmap <silent> <leader>p FZF

" Conquerer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
    \ 'coc-tsserver'
    \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" When hovering over a word, make the tooltip show the diagnostic if
" error/warnings, else show documentation
nnoremap <silent> K :call CocAction('doHover')<CR>

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

" Haskell
Plug 'neovimhaskell/haskell-vim'

" Ruby on Rails
Plug 'tpope/vim-rails'

" Javascript, Typescript & React
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Rust
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'

call plug#end()

