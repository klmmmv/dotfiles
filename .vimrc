execute pathogen#infect()
syntax on filetype plugin indent on

set number
set ruler
set tabstop=4
set expandtab
set hlsearch
colorscheme gruvbox
set background=dark
set backspace=indent,eol,start
set colorcolumn=80

set noswapfile
set fsync

set runtimepath^=~/.vim/bundle/ctrlp.vim

let mapleader = " "

" Functions

function! SimpleWindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction

" som stuff

nnoremap <Leader>rc :vsplit $MYVIMRC<cr>
nnoremap <Leader>sr :source $MYVIMRC<cr>

" Bind leader<i> to switch to  window

nnoremap <Leader>1 :1wincmd w<CR>
nnoremap <Leader>2 :2wincmd w<CR>
nnoremap <Leader>3 :3wincmd w<CR>
nnoremap <Leader>4 :4wincmd w<CR>
nnoremap <Leader>5 :5wincmd w<CR>
nnoremap <Leader>6 :6wincmd w<CR>
nnoremap <Leader>7 :7wincmd w<CR>
nnoremap <Leader>8 :8wincmd w<CR>
nnoremap <Leader>9 :9wincmd w<CR>

" Resize windows with arrow keys
" does not work

nnoremap <c-down>  :resize +2<cr>
nnoremap <c-up>  :resize -2<cr>
nnoremap <c-left>  :vertical resize -2<cr>
nnoremap <c-right>  :vertical resize +2<cr>

" Ctrlsf
" --------

let g:ctrlsf_default_root = "project"
let g:ctrlsf_auto_focus = { "at":"start" }
let g:ctrlsf_winsize = '86'

" Nerdtree
" --------

" autocmd VimEnter * NERDTree | wincmd p
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 50
let g:NERDTreeStatusline = "%{SimpleWindowNumber()}"

" Ale setup
" ---------
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\    'python': ['black'],
\}
let g:ale_linters = {
\    'python': ['flake8'],
\}
let g:ale_fix_on_save = 1
let g:ale_linters = {
\    'python': ['flake8'],
\}

" Vim-Airline
"
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.branch = ''
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

function! WindowNumber(...)
    let builder = a:1
    let context = a:2
    call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
    return 0
endfunction

call airline#add_statusline_func('WindowNumber')
call airline#add_inactive_statusline_func('WindowNumber')


" Leader commands
" ---------------




" KeyBindings
" -----------

nmap <C-F>f <Plug>CtrlSFPrompt
nmap <C-F>w <Plug>CtrlSFCwordPath

" Filetypespecific
" ----------------

autocmd FileType yaml,sh setlocal ts=2 sts=2 sw=2 expandtab

com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"

nnoremap = :FormatXML<Cr>
