call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'b4b4r07/vim-hcl'
Plug 'cespare/vim-toml'
Plug 'chrisbra/NrrwRgn'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'dbmrq/vim-ditto'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'fatih/vim-hclfmt'
Plug 'godlygeek/tabular'
Plug 'google/vim-jsonnet'
Plug 'hashivim/vim-terraform'
Plug 'jceb/vim-orgmode'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'msanders/snipmate.vim'
Plug 'mtth/scratch.vim'
Plug 'neomake/neomake'
Plug 'reedes/vim-wordy'
Plug 'romainl/flattened'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'slashmili/alchemist.vim'
Plug 'suan/vim-instant-markdown'
Plug 't9md/vim-choosewin'
Plug 'ternjs/tern_for_vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-speeddating'
Plug 'unblevable/quick-scope'
Plug 'vim-scripts/calendar.vim--Matsumoto'
Plug 'vim-scripts/utl.vim'
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug '/usr/local/opt/fzf'

call plug#end()

syntax on
set ruler
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
"Custom options:
set nobackup		" Don't keep a backup file
set nosol		" Cursor kept in same column (if possible)
set ttyfast		" Smoother changes
set number		" Line numbers
filetype on
filetype indent on
filetype plugin on
set shiftwidth=2
set tabstop=2		" Number of spaces to autoindent
set expandtab		" Converts tab to spaces
set softtabstop=2
set autoindent
set backspace=indent,eol,start " Smart backspacing
set noerrorbells
autocmd BufWritePre * :%s/\s\+$//e

" Mouse highlight quick copy
vmap <C-C> "+y

colorscheme  flattened_dark
set termguicolors

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Remap terminal exit command to <Leader> q
tnoremap <Leader>q <C-\><C-n>

" always start terminal in insert mode
autocmd BufWinEnter,WinEnter term://* startinsert

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>

" Tagbar
nmap <leader>tg :TagbarToggle<CR>
let g:tagbar_type_puppet = {
   \ 'ctagstype': 'puppet',
   \ 'kinds': [
   \ 'c:class',
   \ 's:site',
   \ 'n:node',
   \ 'd:definition'
   \]
\}
let g:tagbar_type_markdown = {
	\ 'ctagstype' : 'markdown',
	\ 'kinds' : [
		\ 'h:Heading_L1',
		\ 'i:Heading_L2',
		\ 'k:Heading_L3'
	\ ]
\ }

let g:tagbar_type_elixir = {
  \ 'ctagstype' : 'elixir',
  \ 'kinds' : [
      \ 'f:functions',
      \ 'functions:functions',
      \ 'c:callbacks',
      \ 'd:delegates',
      \ 'e:exceptions',
      \ 'i:implementations',
      \ 'a:macros',
      \ 'o:operators',
      \ 'm:modules',
      \ 'p:protocols',
      \ 'r:records',
      \ 't:tests'
  \ ]
\ }

" Puppet
autocmd BufRead,BufNew *.eyaml set filetype=yaml

" LaTeX
let g:Tex_CompileRule_pdf='pdflatex --shell-escape -synctex=1 --interaction=nonstopmode $*'
let g:Tex_MultipleCompileFormats='pdf,aux,dvi,ps'
let g:Tex_DefaultTargetFormat='pdf'

" Fugitive
command GSquashLast2 Git rebase -i HEAD~2

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_path = 1
au FileType go nmap <Leader>l <Plug>(go-metalinter)
au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <leader>s  <Plug>(go-test)
au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
"let g:go_gocode_propose_source=1

" Add in golint
let g:neomake_go_metalinter_args = ['--disable-all', '--enable=errcheck', '--enable=megacheck', '--enable=golint']

" NERDTree
noremap <Leader>n :NERDTreeToggle<cr>
let NERDTreeShowHidden=1

" Deoplete
let g:deoplete#enable_at_startup = 1

" Neomake
autocmd! BufWritePost * Neomake

" vim-json
let g:vim_json_syntax_conceal = 1

" vim-org
let g:org_export_emacs = "/usr/local/bin/emacs"
let g:org_export_init_script = "~/.emacs"

" vim-terraform (pulled in by vim-polyglot)
let g:terraform_align=1

" fzf.vim
nnoremap <leader>t :Files<CR>
