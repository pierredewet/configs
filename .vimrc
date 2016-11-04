set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'scrooloose/nerdtree'             " NERDTree
Plugin 'scrooloose/nerdcommenter'        " Nerd commenter - comment blocks of code easily        
Plugin 'jistr/vim-nerdtree-tabs'         " Nerdtree can always be open
Plugin 'vimscript/multiple-cursors'      " Multiple cursors like sublime text
Plugin 'tmhedberg/simpylfold'            " Better code folding
Plugin 'valloric/youcompleteme'          " Python completion
Plugin 'scrooloose/syntastic'            " Syntax highlighting
Plugin 'nvie/vim-flake8'                 " PEP8 Checking
Plugin 'vim-latex/vim-latex'             " Latex bindings for Vim
Plugin 'mattn/emmet-vim'                 " EMMET for Vim
Plugin 'tpope/vim-markdown'              " Vim Markdown stuff

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Back to normal programming
filetype plugin indent on                " required

" Enable fenced code block syntax highlighting in your markdown documents  
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

let python_highlight_all=1
syntax on
colorscheme Tomorrow-Night-Bright

set colorcolumn=120
let &colorcolumn=join(range(121,999),",")
highlight colorcolumn ctermbg=Black
set textwidth=120
set number
highlight LineNr ctermfg=grey
set showcmd
let mapleader=","                        " <Leader> key set to comma
map <leader>r :source %<CR>              
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set showmatch                            " highlight matching parens

" Code Folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za  " Enable folding just by using space key

" Remove whitespace 
autocmd BufWritePre *.py :%s/\s\+$//e

" Keep more stuff in memory
set hidden
set history=100

set hlsearch                             " highlight search

" Use Arrows to navigate
map <D-A-RIGHT> <C-w>l
map <D-A-LEFT> <C-w>h
map <D-A-DOWN> <C-w><C-w>
map <D-A-UP> <C-w>W

" Open previously opened file by hitting comma twice
nnoremap <Leader><Leader> :e#<CR>

" Nerd Tree/commenter settings
let g:NERDSpaceDelims = 1             " Add space after comment delimiter by default
let g:NERDCompactSexyComs = 1         " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'       " Align line-wise comment delimiters flush left instead of following code
                                      " indentation
let NERDTreeMapActivateNode='<right>' " Right arrow opens node
let NERDTreeShowHidden=1              " Show hidden files
nmap <leader>nt :NERDTreeToggle<CR>   " Toggle display of tree
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp'] " Ignore some useless files

" Nerd Tree TABS Settings
let g:nerdtree_tabs_open_on_gui_startup = 1     " NerdTree TABS opens on GVim start
let g:nerdtree_tabs_open_on_console_startup = 1 " NerdTree opens at console start
let g:nerdtree_tabs_autoclose = 1               " Close if only window open in NerdTree
let g:nerdtree_tabs_startup_cd = 1              " If directory name given at start, cd into it 
let g:nerdtree_tabs_smart_startup_focus = 1     " Focus on NerdTree if opening folder, file if opening file 

" Split movement
nnoremap <C-J> <C-W><C-J> " CTRL-j move to split below
nnoremap <C-K> <C-W><C-K> " CTRL-k move to the split above
nnoremap <C-L> <C-W><C-L> " CTRL-l move to the split right
nnoremap <C-H> <C-W><C-H> " CTRL-h move to the split left


" Remap F5 to allow insertion of current date in normal or insert mode
:nnoremap <F5> "=strftime("%Y/%m/%d (%a)"<CR>
:inoremap <F5> <C-R>"=strftime("%Y/%m/%d (%a)"<CR>

" YouCompleteMe Settings
"
" Ensures that the autocomplete window goes away when you’re done with it
let g:ycm_autoclose_preview_window_after_completion=1
" Defines shortcut for GOTO definition (my leader is comma, so: ',g)
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Enable powerline-status
set rtp+=/home/pierre/.local/lib/python3.5/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
