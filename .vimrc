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
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-commentary'
Plug 'joshdick/onedark.vim'
Plug '907th/vim-auto-save'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Valloric/YouCompleteMe', {'do': ':!install.py'}
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'SirVer/ultisnips'
Plug 'cormacrelf/vim-colors-github'
Plug 'junegunn/vim-xmark', { 'do': 'make' }
Plug 'zivyangll/git-blame.vim'
Plug 'Konfekt/vim-scratchpad'

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

" Specify available Ale linters
let g:ale_fixers = {
\ 'javascript': ['prettier', 'prettier-eslint', 'eslint'],
\ 'typescript': ['prettier', 'prettier-eslint', 'eslint'],
\ 'json': ['prettier'],
\ 'css': ['prettier'],
\ 'scss': ['prettier'],
\ 'sass': ['prettier'],
\ 'ruby': ['rubocop'],
\ 'thor': ['rubocop'],
\ 'erb': ['rubocop'],
\ }

" Prevent jarring lint errors
let g:ale_sign_column_always = 1

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Fuzzy search files with leader -> fs (files search)
map <leader>fs :Files<cr>

" Open file explorer with leader -> fe (file explorer)
map <leader>fe :NERDTreeToggle<cr>

" Open file explorer at the current file with leader -> fec (file explorer
" current)
map <leader>fec :NERDTreeFind<cr>

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

" Go to end of line with L
noremap L $

" Go to start of line with H
noremap H ^

" Select entire file (max 100 lines) using <space>va
noremap <leader>va V1000j<cr>

" Move lines up with <Alt + j>
nnoremap <A-j> :m .+1<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv

" Move lines up with <Alt + k>
nnoremap <A-k> :m .-2<CR>==
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-k> :m '<-2<CR>gv=gv

" prettier config overrides
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#parser = 'babylon'
let g:prettier#config#print_width = 80
let g:prettier#config#prose_wrap = 'always'
let g:prettier#config#trailing_comma = 'always'
let g:prettier#config#arrow_parens = 'always'

" set theme
syntax on
colorscheme onedark

" Import ruby server
let g:ruby_host_prog = '/Users/sean/.gem/ruby/2.6.0/gems/neovim-0.8.1/exe/neovim-ruby-host'

let g:auto_save = 1  " enable AutoSave on Vim startup

" allow file editing with NERDTree
set modifiable

" General commands

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

" Show lint warnings in status bar
let g:airline#extensions#ale#enabled = 1

" set text width to 80 and auto wrap if longer than that
set textwidth=80
set fo+=t
set fo-=l

" auto wrap on Markdown files
au BufRead,BufNewFile *.md setlocal textwidth=80

" " Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:fzf = 'ag --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

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

" Toggle zen mode with <leader>zen
nnoremap <leader>zen :Goyo<cr>

" Auto enable limelight (highlights current text) when in zen mode
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Limelight colors
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#999999'

" Split buffer vertically with <leader>bsv (buffer split vertical)
nnoremap <leader>bsv :vsplit<cr>

" Split buffer horizontally with <leader>bs (buffer split)
nnoremap <leader>bsh :split<cr>

" close Magit after commiting
let g:magit_auto_close = 1

" Toggle Magit with <leader>gm (git magit) in current buffer
nnoremap <leader>gm :MagitOnly<cr>

" Toggle Magit with <leader>gm (git magit) in new split vertical buffer
nnoremap <leader>gmv :Magit<cr>

" Detach from Tmux session with <leader>td (tmux detach)
nnoremap <leader>td :! tmux detach<cr>

" Show the first match for the pattern, while you are still typing it
set incsearch

" Highlight found text with yellow background to find it easier
set hlsearch

" Open snippets file for the current file type for editing
nnoremap <leader>se :UltiSnipsEdit<cr>

" Activate snippet with <Ctrl + j>
let g:UltiSnipsExpandTrigger = "<c-j>"

" Go to next tab stop with <Ctrl + l>
let g:UltiSnipsJumpForwardTrigger = "<c-l>"

" Go to previous tab stop with <Ctrl + h>
let g:UltiSnipsJumpBackwardTrigger = "<c-h>"

" Set utltisnips directory so they save correctly
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/UltiSnips']

" Split window vertically when editing snippets
let g:UltiSnipsEditSplit = "vertical"

" Always use the default clipboard
set clipboard+=unnamedplus

" Turn on markdwn preview
nnoremap <leader>mp :Xmark><cr>

" Turn off markdwn preview
nnoremap <leader>mpq :Xmark!><cr>

" Set Ruby syntax in thor files
au BufRead,BufNewFile *.thor set filetype=ruby

" set foldmethod to indent
nnoremap <leader>foldi :set foldmethod=indent<cr>

" set foldmethod to manual
nnoremap <leader>foldm :set foldmethod=manual<cr>

" update vimrc config within editor
nnoremap <leader>vimrcu :so ~/.config/nvim/init.vim<cr>

" adjust buffer height
nnoremap <leader>bh :resize

" adjust buffer width
nnoremap <leader>bw :vertical resize 

" Display git blame for current line
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" Set scratchpad file path (relative to the cwd)
let g:scratchpad_path = '.scratchpads'

" Set scratchpad file type to MD
let g:scratchpad_ftype = 'md'

" Toggle scratchpad with <leader>sp (scratch pad)
nmap <leader>sp <Plug>(ToggleScratchPad)

" Display comments in italic

hi Comment cterm=italic
hi jsStorageClass cterm=italic
hi jsExport cterm=italic
hi jsImport cterm=italic
hi jsFrom cterm=italic
hi jsExportDefault cterm=italic
hi jsModuleAs cterm=italic
hi jsConditional cterm=italic
hi jsRepeat cterm=italic
hi jsSwitchCase cterm=italic
hi jsTry cterm=italic
hi jsCatch cterm=italic
hi jsFinally cterm=italic
hi jsException cterm=italic
hi jsAsyncKeyword cterm=italic
hi jsStatement cterm=italic
hi rubyDefine cterm=italic
hi rubyClass cterm=italic
hi rubyModule cterm=italic
hi rubyAccess cterm=italic
hi rubyControl cterm=italic
hi rubyException cterm=italic
hi rubyInclude cterm=italic
hi rubyMacro cterm=italic
hi rubyConditional cterm=italic
