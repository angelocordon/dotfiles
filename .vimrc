" Custom Leads
let mapleader = ","

map <leader>so :source $MYVIMRC<CR>
map <leader>vi :tabe ~/.vimrc<CR>
map <leader>pi :PlugInstall<CR>

" Line rule
set colorcolumn=80

" Line numbers
set number
set relativenumber
set numberwidth=2

set expandtab
set shiftwidth=2
set softtabstop=2

"Word wrap
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" set foldmethod=syntax

" fzf file fuzzy search that respects .gitignore
" If in git directory, show only files that are committed, staged, or unstaged
" else use regular :Files
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

" Plugins!
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Syntax highliting
Plug 'sheerun/vim-polyglot'

" Shows which lines have been modified, added or deletes
Plug 'airblade/vim-gitgutter'

" Automatically end ruby do blocks
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby'

" Fuzzy searching, ctrl + p to use command line
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Formatting!
Plug 'dense-analysis/ale'
" let g:ale_fix_on_save = 1
Plug 'mhinz/vim-mix-format'
let g:mix_format_on_save = 1

let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'ruby': ['rubocop'],
      \ }

" GitLens for NVis
Plug 'APZelos/blamer.nvim'
let g:blamer_enabled = 1

call plug#end()

syntax on

filetype plugin indent on
