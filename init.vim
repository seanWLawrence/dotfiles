" This setting must be set before ALE is loaded.
" Turn off ALE autocomplete for YouCompleteMe
" Only using ALE for formatting currently
let g:ale_completion_enabled = 0

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-commentary'
Plug 'joshdick/onedark.vim'
Plug '907th/vim-auto-save'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Valloric/YouCompleteMe', {'do': ':!install.py'}
Plug 'jceb/vim-orgmode'

call plug#end()

" map <Space> to leader
let mapleader="\<Space>"

" Spaces & Tabs {{{
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
" }}} Spaces & Tabs

" Format on save
let g:ale_fix_on_save = 1

" Only enable specific Ale linters defined below
let g:ale_linters_explicit = 1

" Specify available Ale linters
let g:ale_fixers = {
\ 'javascript': ['prettier', 'prettier-eslint', 'eslint'],
\ 'typescript': ['prettier', 'prettier-eslint', 'eslint'],
\ 'json': ['prettier'],
\ 'css': ['prettier'],
\ 'scss': ['prettier'],
\ 'sass': ['prettier'],
\ 'ruby': ['rubocop', 'ruby', 'rails_best_practices'],
\ }

" Specify available Ale formatters
let b:ale_fixers = ['prettier', 'eslint']

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Fuzzy search files with leader -> f
map <leader>f :Files<cr>

" Open files with leader -> 0
map <leader>o :NERDTreeToggle<cr>

" Navigate buffers with leader -> direction
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Save on leader -> w
nnoremap <leader>w :w<cr>

" Save and quit on leader -> wq
nnoremap <leader>wq :wq<cr>

" Add shortcut for commenting out lines
noremap <leader>\ :Commentary<cr>

" prettier config overrides
let g:prettier3config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#parser = 'babylon'

" set theme
syntax on
colorscheme onedark

" Import ruby server
let g:ruby_host_prog = '/Users/sean/.gem/ruby/2.6.0/gems/neovim-0.8.1/exe/neovim-ruby-host'

let g:auto_save = 1  " enable AutoSave on Vim startup

" allow file editing with NERDTree
set modifiable

" General commands
"
" Alias 'S' for 'Ack'
command -nargs=1 S Ack <args>

" Git commands
command -nargs=1 Gsync ! git fetch --all && git pull upstream <args>
command Gpf ! git push --no-verify
command -nargs=1 Gcm ! git commit -m <args>
command -nargs=1 Gco ! git checkout <args>
command -nargs=1 Gcob ! git checkout -b <args>
command Gaa ! git add .
command Gca ! git commit --amend
command Gc ! git commit 
command Gl ! git log --reverse

" Make School commands
command Graphql ! ./server graphql
command PullStagingDb ! ./server pull_staging_db
command Jest ! yarn test:hook
command CypressStart ! yarn test:e2e:integration:start
command CypressRun ! yarn test:e2e:integration:run


" Show line numbers
" set number

" Set the Silver Searcher up to search through files
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Case insensitive search when search is lowercase, case-sesitive search when
" search contains at least upper case letter
set ignorecase
set smartcase

" use bubblegum theme for airline status bar
let g:airline_theme='bubblegum'

" set emmet key to <leader>,
let g:user_emmet_leader_key=','

" set text width to 80 and auto wrap if longer than that
set textwidth=80
set fo+=t
set fo-=l

" auto wrap on Markdown files
au BufRead,BufNewFile *.md setlocal textwidth=80

" Hide files from .gitignore from FZF file search plugin
let g:fzf_default_command = 'ag --hidden -p ~/.gitignore -g ""'

" Enable autocomplete
let g:ycm_language_server = [
  \   {
  \     'name': 'yaml',
  \     'cmdline': [ 'node', expand( '$HOME/lsp/yaml/node_modules/.bin/yaml-language-server' ), '--stdio' ],
  \     'filetypes': [ 'yaml' ],
  \   },
  \   {
  \     'name': 'json',
  \     'cmdline': [ 'node', expand( '$HOME/lsp/json/node_modules/.bin/vscode-json-languageserver' ), '--stdio' ],
  \     'filetypes': [ 'json' ],
  \   },
  \   {
  \     'name': 'ruby',
  \     'cmdline': [ expand( '$HOME/lsp/ruby/bin/solargraph' ), 'stdio' ],
  \     'filetypes': [ 'ruby' ],
  \   },
  \   { 'name': 'docker',
  \     'filetypes': [ 'dockerfile' ], 
  \     'cmdline': [ expand( '$HOME/lsp/docker/node_modules/.bin/docker-langserver' ), '--stdio' ]
  \   },
  \   { 'name': 'vim',
  \     'filetypes': [ 'vim' ],
  \     'cmdline': [ expand( '$HOME/lsp/viml/node_modules/.bin/vim-language-server' ), '--stdio' ]
  \   },
  \ ]

" set shell to Zsh
set shell=/bin/zsh

" allow Magit to delete untracked files
let g:magit_discard_untracked_do_delete=1
