" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Surrounding quotes
Plugin 'tpope/vim-surround'
" Comment toggling vim
Plugin 'scrooloose/nerdcommenter'
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" File switching
Plugin 'kien/ctrlp.vim'
" Statusbar
Plugin 'vim-airline/vim-airline'
" Color scheme
Plugin 'morhetz/gruvbox'
" Focus mode (:Goyo)
Plugin 'junegunn/goyo.vim'
" Focus on paragraph
Plugin 'junegunn/limelight.vim'
" Indent guides
Plugin 'nathanaelkane/vim-indent-guides'
" Avoid auto indenting during paste
Plugin 'ConradIrwin/vim-bracketed-paste'
" Adds hex and rgb color highlighting
Plugin 'ap/vim-css-color'
" Preview find-replace commands
Plugin 'markonm/traces.vim'
" Highlighting csv files
Plugin 'mechatroner/rainbow_csv'
" Autoclose (/{/etc
Plugin 'townk/vim-autoclose'
" Autoclose html tags
Plugin 'alvan/vim-closetag'

" Rust Stuff
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'cespare/vim-toml'
Plugin 'maralla/vim-toml-enhance'
let g:racer_cmd = '~/.cargo/bin/racer'
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)

" Leader remapping
let mapleader = "\<Space>"
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Run mapping
au FileType rust nmap <C-x> :w ! cargo run<CR>
au FileType python nmap <C-x> :w ! python<CR>
au FileType python nmap <C-i> :w ! bpython -i %<CR>
au FileType python vnoremap r :w ! python<CR>
au FileType r nmap <C-x> :w ! R --vanilla -q<CR>

" Python autocomplete for vim
Plugin 'maralla/completor.vim'
" Rmarkdown stuff
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-pandoc'

call vundle#end()

filetype plugin indent on
set t_Co=256
set t_ut= " Solve tmux background color weirdness
set background=dark
colorscheme gruvbox

" vim-rmarkdown options
let g:pandoc#modules#disabled = ["folding"]
" let g:pandoc#syntax#conceal#use=0

" Gnome specific cursors
let &t_SI = "\e[6 q" " Vertical bar in insert mode
let &t_EI = "\e[2 q" " Block in normal mode

" Proper python indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix
" Proper encodings
set encoding=utf-8
" syntax highlighting
let python_highlight_all=1
syntax on
" Line numbering
set noruler
set number
" CtrlP binding
let g:ctrlp_map = '<c-p>'
" Remove backup and swap files
set nobackup
set nowb
set noswapfile
set showcmd
set incsearch

" Make folding more subtle
highlight Folded ctermfg=240 ctermbg=235
set fillchars=fold:\  

" Set split directions to sensical defaults
set splitbelow
set splitright

" Netrw (filebrowser) options
let g:netrw_banner=0
let g:netrw_altv=1  " splits to right
let g:netrw_liststyle=3  " tree view

" 1 tab == 4 spaces
set shiftwidth=4
set softtabstop=4

set ai " Auto indent
set si " Smart indent
set textwidth=0 wrapmargin=0
" modern backspace behavior
set backspace=indent,eol,start
filetype indent on

" Limelight
let g:limelight_conceal_ctermfg = 240

" Create shortcut for Goyo and Limelight
:command Focus Goyo | Limelight!!

" Filetype specific settings
augroup filetypedetect
    au BufRead,BufNewFile *.Rmd set filetype=rmarkdown
    " associate *.foo with php filetype
augroup END

"basic tab spacing for html, css and js
au BufNewFile,BufRead *.html,*.css
    \  set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2

" Prevents delay after ESC in insert mode
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
