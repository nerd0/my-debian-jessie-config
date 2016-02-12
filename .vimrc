set nocompatible              " be iMproved, required
set encoding=utf-8
scriptencoding utf-8
filetype plugin indent on    
execute pathogen#infect('bundle/{}')
"highligth search 
set hlsearch
set noswapfile
set nobackup
set hidden
set wildignore=*.pyc,env/**,bower_components/**,node_modules/**,
set clipboard=unnamed
set autoindent
set number
set laststatus=2
" size of a hard tabstop
set tabstop=4
"set shiftwidth=4
set expandtab
set textwidth=79
set updatetime=400
set go+=a
set ai                  " always set autoindenting on
set viminfo=!,'20,\"50  " read/write a .viminfo file, don't store more
                        " than 50 lines of registers, store glob
set history=50          " keep 50 lines of command
                        " line history


set cursorcolumn        "highlight column cursor is in
set cursorline          "highlight line cursor is in

" ==== Formatting options ==== {{{2
set et    " Tabs become spaces
set sw=2  " Autoident uses 4 space tabs
set sts=2 " Tabs become 4 spaces while editing
set ts=2  " Tabs are two if they're in the file
set fo+=l " Don't wrap long lines if they're long when you enter insert mode
set fo+=2 " Use second line for indent
set tw=78 " Wrap at 78 characters

"COLORS
syntax enable
set background=dark
set t_Co=256
colorscheme desert
set colorcolumn=79
" NERDS
map <C-n> :NERDTreeToggle<CR>
noremap <C-z> <Nop>
let NERDTreeIgnore = ['\.pyc$']

" Gundo 
nnoremap <C-j> :GundoToggle<CR>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Enable neocomplete
let g:neocomplete#enable_at_startup = 1

" Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '\ue0a2' : ''
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
           \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
           \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? "\ue0a0 "._ : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" rebind keys to allow hjkl to nav around split windows

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
