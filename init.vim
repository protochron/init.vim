call plug#begin('~/.config/nvim/plugged')

Plug 'SirVer/ultisnips'
Plug 'b4b4r07/vim-hcl'
Plug 'calendar.vim--Matsumoto'
Plug 'cespare/vim-toml'
Plug 'chrisbra/NrrwRgn'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'elixir-lang/vim-elixir'
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'fatih/vim-go'
Plug 'fatih/vim-hclfmt'
Plug 'godlygeek/tabular'
Plug 'jceb/vim-orgmode'
Plug 'jcf/vim-latex'
Plug 'junegunn/goyo.vim'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'msanders/snipmate.vim'
Plug 'mtth/scratch.vim'
Plug 'mxw/vim-jsx'
Plug 'neomake/neomake'
Plug 'pangloss/vim-javascript'
Plug 'rodjek/vim-puppet'
Plug 'romainl/flattened'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'Shougo/deoplete.nvim'
Plug 'solarnz/thrift.vim'
"Plug 'suan/vim-instant-markdown'
Plug 'ternjs/tern_for_vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-speeddating'
Plug 'utl.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'wlangstroth/vim-haskell'
Plug 'wting/rust.vim'
Plug 'zchee/deoplete-go', {'build': {'unix': 'make'}}

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
tnoremap <Leader>q <C-\><C-n>gg<cr>

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

" Puppet
autocmd BufRead,BufNew *.eyaml set filetype=yaml

" Javascript
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'
autocmd FileType javascript setlocal omnifunc=tern#Complete

" LaTeX
let g:Tex_CompileRule_pdf='pdflatex --shell-escape -synctex=1 --interaction=nonstopmode $*'
let g:Tex_MultipleCompileFormats='pdf,aux,dvi,ps'
let g:Tex_DefaultTargetFormat='pdf'

" Fugitive
command GSquashLast2 Git rebase -i HEAD~2

" ctrl-p
let g:ctrlp_map = '<Leader>t'
"let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_prompt_mappings = { 'ToggleMRURelative()': ['<F2>'] }

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_path = 1
au FileType go nmap <Leader>l <Plug>(go-metalinter)
au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <leader>s  <Plug>(go-test)
au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

" NERDTree
noremap <Leader>n :NERDTreeToggle<cr>
let NERDTreeShowHidden=1

" Deoplete
let g:deoplete#enable_at_startup = 1

" Neomake
autocmd! BufWritePost * Neomake
