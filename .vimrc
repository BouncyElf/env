set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'othree/html5.vim'
Plugin 'lilydjwg/colorizer'
Plugin 'Shougo/neocomplete.vim'
Plugin 'fatih/vim-go'
Plugin 'posva/vim-vue'
Plugin 'pangloss/vim-javascript'
Plugin 'dyng/ctrlsf.vim'
Plugin 'buoto/gotests-vim'
"Plugin 'mxw/vim-jsx'
"Plugin 'junegunn/fzf'
"Plugin 'rust-lang/rust.vim'
"Plugin 'racer-rust/vim-racer'
"Plugin 'majutsushi/tagbar'
"Plugin 'dart-lang/dart-vim-plugin'
"Plugin 'shawncplus/phpcomplete.vim'
"Plugin 'ludovicchabant/vim-gutentags'
"Plugin 'Shougo/denite.nvim'
"Plugin 'w0rp/ale'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'altercation/vim-colors-solarized'

call vundle#end()

filetype plugin indent on
syntax enable
syntax on

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set backspace=indent,eol,start
set termencoding=utf-8
set ambiwidth=double
set background=dark
set encoding=utf-8
set laststatus=2
set matchtime=3
set cursorcolumn
set cursorline
set history=50		" keep 50 lines of command line history
set showmatch
set incsearch		" do incremental searching
set hlsearch
set undodir=~/.vim/undo_dir		" keep an undo file (undo changes after closing)
set undofile		" keep an undo file (undo changes after closing)
set t_Co=256
set mouse=a
set showcmd		" display incomplete commands
set number
set backup		" keep a backup file (restore to previous version)
set backupdir=~/.vim/backup_dir
set directory=~/.vim/swapfile_dir
set ruler		" show the cursor position all the time
set noic
set go=
set fdm=indent
set foldlevelstart=99	" set this, means open file will not fold code
set cc=81
set scrolloff=8
set tabstop=4
set shiftwidth=4
set cindent
set autoindent
set nopaste
set ignorecase
set smartcase

" copy file path in go
:command! FP let @+ = expand('%:p')

" solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

" go
autocmd FileType go setlocal tabstop=8 shiftwidth=8
nmap <F3> :GoCoverageToggle<CR>
nmap <F4> :GoTests<CR>
nmap <C-h> :GoImplements<CR>
let g:go_gocode_propose_source = 0
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" php
autocmd FileType php setlocal softtabstop=4 expandtab

" html css
autocmd FileType html setlocal tabstop=2 shiftwidth=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2

" vue
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" nerdtree
nmap <C-j> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.swp$', '\~$']

" ctrlsf
let g:ctrlsf_ackprg = '/usr/local/bin/ack'
let g:ctrlsf_position = 'top'
nmap <C-k> <Plug>CtrlSFPrompt
vmap <C-k> <Plug>CtrlSFVwordPath

" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
if !exists('g:neocomplete#keyword_patterns')
   let g:neocomplete#keyword_patterns = {}
endif
   let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g>	neocomplete#undo_completion()
inoremap <expr><C-l>	neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.perl =  '\h\w*->\h\w*\|\h\w*::'
