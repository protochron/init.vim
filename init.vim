if has('macunix')
  let g:python3_host_prog = '/usr/local/opt/python@3/libexec/bin/python'
end

call plug#begin('~/.config/nvim/plugged')

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'cespare/vim-toml'
Plug 'chrisbra/NrrwRgn'
"Plug 'davidhalter/jedi-vim'
Plug 'dbmrq/vim-ditto'
Plug 'dyng/ctrlsf.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'fatih/vim-go' ", { 'do': ':GoUpdateBinaries' }
Plug 'fatih/vim-hclfmt'
Plug 'godlygeek/tabular'
Plug 'google/vim-jsonnet'
Plug 'hashivim/vim-terraform'
Plug 'jasdel/vim-smithy'
Plug 'jceb/vim-orgmode'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'majutsushi/tagbar'
"Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'msanders/snipmate.vim'
Plug 'mtth/scratch.vim'
Plug 'neomake/neomake'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'overcache/NeoSolarized'
"Plug 'racer-rust/vim-racer'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-wordy'
"Plug 'romainl/flattened'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'sheerun/vim-polyglot'
"Plug 'slashmili/alchemist.vim'
Plug 't9md/vim-choosewin'
Plug 'tsandall/vim-rego'
"Plug 'ternjs/tern_for_vim'
"Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-speeddating'
Plug 'unblevable/quick-scope'
Plug 'vim-scripts/calendar.vim--Matsumoto'
"Plug 'vim-scripts/groovyindent-unix'
Plug 'vim-scripts/utl.vim'
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
"set expandtab		" Converts tab to spaces
set softtabstop=2
set autoindent
set backspace=indent,eol,start " Smart backspacing
set noerrorbells
autocmd BufWritePre * :%s/\s\+$//e
set background=dark

set updatetime=300
set signcolumn=number
set shortmess+=c
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mouse highlight quick copy
vmap <C-C> "+y

set termguicolors
colorscheme  NeoSolarized

"colorscheme  flattened_dark

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Remap terminal exit command to <Leader> q
tnoremap <Leader>q <C-\><C-n>

" always start terminal in insert mode
autocmd BufWinEnter,WinEnter term://* startinsert

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>

tnoremap <Esc> <C-\><C-n>

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
        \ 'p:protocols',
        \ 'm:modules',
        \ 'e:exceptions',
        \ 'y:types',
        \ 'd:delegates',
        \ 'f:functions',
        \ 'c:callbacks',
        \ 'a:macros',
        \ 't:tests',
        \ 'i:implementations',
        \ 'o:operators',
        \ 'r:records'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 'p' : 'protocol',
        \ 'm' : 'module'
    \ },
    \ 'scope2kind' : {
        \ 'protocol' : 'p',
        \ 'module' : 'm'
    \ },
    \ 'sort' : 0
\ }

let g:rust_use_custom_ctags_defs = 1  " if using rust.vim
let g:tagbar_type_rust = {
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
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
let g:go_gopls_use_placeholders=1
let g:go_metalinter_command='gopls'
let g:go_gopls_use_staticcheck=1
let g:go_rename_command='gopls'

" Add in golint
let g:neomake_go_metalinter_args = ['--disable-all', '--enable=errcheck', '--enable=megacheck', '--enable=golint']

" NERDTree
noremap <Leader>n :NERDTreeToggle<cr>
let NERDTreeShowHidden=1

" Deoplete
"let g:deoplete#enable_at_startup = 1
"call deoplete#custom#option('omni_patterns', {
"\ 'go': '[^. *\t]\.\w*',
"\})

" Neomake
autocmd! BufWritePost * Neomake

" vim-json
let g:vim_json_syntax_conceal = 1

" vim-org
let g:org_export_emacs = "/usr/local/bin/emacs"
let g:org_export_init_script = "~/.emacs"

" vim-terraform (pulled in by vim-polyglot)
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" fzf.vim
nnoremap <leader>t :Files<CR>
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" litecorrect
augroup litecorrect
  autocmd!
  autocmd FileType markdown,mkd call litecorrect#init()
augroup END

" vim-wordy
if !&wildcharm | set wildcharm=<C-z> | endif
execute 'nnoremap <leader>w :Wordy<space>'.nr2char(&wildcharm)

" vim-racer
"au FileType rust nmap gd <Plug>(rust-def)
"au FileType rust nmap gs <Plug>(rust-def-split)
"au FileType rust nmap gx <Plug>(rust-def-vertical)
""au FileType rust nmap gt <Plug>(rust-def-tab)
"au FileType rust nmap <leader>gd <Plug>(rust-doc)

" rust.vim
let g:rustfmt_autosave = 1

" vimhcl
let g:tf_fmt_autosave = 0

let g:neosolarized_termBoldAsBright = 0

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" coc config
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
