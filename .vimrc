" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Set Indentation soft tabs
set autoindent          " Use autoindentation
set expandtab
set shiftwidth=2
set softtabstop=2
set expandtab
set pastetoggle=<f5>

set clipboard=unnamed

" Donrt write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1
" nnoremap <Left> :echo "Stop being an idiot!"<CR>
" nnoremap <Right> :echo "Stop being an idiot!"<CR>
" nnoremap <Up> :echo "Stop being an idiot!"<CR>
" nnoremap <Down> :echo "Stop being an idiot!"<CR>
" 
" 
" vnoremap <Left> :echo "Stop being an idiot!"<CR>
" vnoremap <Right> :echo "Stop being an idiot!"<CR>
" vnoremap <Down> :echo "Stop being an idiot!"<CR>
" vnoremap <Up> :echo "Stop being an idiot!"<CR>

syntax on

" Set escape key function
:map <S-z> <Esc>
:imap <S-z> <Esc>

nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>

" Set Line number
set number
" set tw=79 " Width of document

set hlsearch
set incsearch
set ignorecase
set smartcase

" Install nerdtree https://github.com/preservim/nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
