"         _                    
"        (_)                   
"  __   ___ _ __ ___  _ __ ___ 
"  \ \ / / | '_ ` _ \| '__/ __|
"   \ V /| | | | | | | | | (__ 
"  (_)_/ |_|_| |_| |_|_|  \___|
"                            
" ~/.vimrc -
"
" Wrtitten to work on *most* GNU/Linux distributions.
" Things not working or WIP are commented. Usually.
" Stolen from many places over the years and tweaked to work for me.
" Feel free to use and modify all or some part of it,
" just remeber: I am not responsible if this breakes your OS or Machine!
"
"" by: Giuseppe (mhsalvor) Molinaro g.molinaro@linuxmail.org
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle - Plugin Manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.Vim ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()	" required, all plugins must appear after this line

Plugin 'VundleVim/Vundle.vim'	" let Vundle manage Vundle, required

Plugin 'vim-syntastic/syntastic'  " uber awesome syntax and error highlighter
"Default settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"end

"Plugin 'tpope/vim-fugitive'

Plugin 'itchyny/Lightline.vim'	" Lightline statusbar
"Plugin 'tomasiser/vim-code-dark'    " VSCode Dark+ theme, clone
Plugin 'sainnhe/sonokai'    " shonokai/maia colorscheme
Plugin 'sheerun/vim-polyglot' " multi languages syntax
"Plugin 'francoiscabrol/ranger.vim' "Ranger integration in vim and neovim 
Plugin 'scrooloose/nerdtree' " nerdtree
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plugin 'ryanoasis/vim-devicons'
"Plugin 'vim-python/python-syntax'
"Plugin 'jreybert/vimagit'
"Plugin 'severin-lemaignan/vim-minimap'
Plugin 'ap/vim-css-color' " CSS color preview
Plugin 'gko/vim-coloresque.git'
"Plugin 'tpope/vim-surround' " Change surrounding marks
"Plugin 'tpope/vim-repeat'
"Plugin 'tpope/vim-commentary'
"Plugin 'tpope/vim-unimpaired'
"Plugin 'hsitz/VimOrganizer' " Org Mode in Vim!
Plugin  'kovetskiy/sxhkd-vim' "sxhkd syntax and indentetion
Plugin  'stephpy/vim-yaml'  "YAML syntax (alacritty config)
"Plugin 'jremmen/vim-ripgrep' "fast grep
"Plugin 'leafgarland/typescript-vim' " typescript file highlights
"Plugin 'vim-utils/vim-man'
"Plugin 'lyuts/vim-rtags' " C++ rtags
"Plugin 'ycm-core/YouCompleteMe' " disabled: having problems with Python
"Plugin 'kien/ctrlp.vim'
"Plugin 'mbbill/undotree'

if iCanHazVundle == 0
    echo "Installing Vundles, please ignore key map error messages"
    echo ""
    :PluginInstall
endif

call vundle#end() " required, all Plugins MUST appear before this line
filetype plugin indent on    " required
syntax on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins;
                        " append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Allows rg to find the git root
if executable('rg')
    let g:rg_derive_root='true'
endif

" Ignore useless files in ctrl-p search
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"nerdtree options
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize = 25

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_chaching = 0



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Defaults (may be changed later)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands / General Options / More Defaults
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When started ad "evim", evim.vim will already have done this settings
if v:progname =~? "evim"
    finish
endif

set encoding=utf-8

if has("autocmd")    " Put these in an autocmd group, so that we can delete them easily
    augroup vimrcStartup
        autocmd!
        
        " view files are about 500 bytes
        " bufleave but not bufwinleave captures closing 2nd tab
        " nested is needed ny bufwrite* (if triggered via other autocmd)
        autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
        autocmd BufWinEnter ?* silent! loadview
        

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid, when inside an event handler
        " (happens when dropping a file on gvim) and for a commit message (it's
        " likely a different one than last time).
        autocmd BufReadPost *
          \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
          \ |   exe "normal! g`\""
          \ | endif
   
        
        " NERTree section
        "autocmd VimEnter * if argc()== 1 | NERDTree | wincmd p | endif
        "autocmd StdinReadPre * let s:std_in=1
        "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif 
        "autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) &&\
            " !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
        "autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&\
            " b:NERDTree.isTabTree()) | q | endif
    augroup END
else
    set autoindent  "always set autoindenting on
endif 

" Options for Buf*
set viewoptions=folds,cursor
set sessionoptions=folds

if has("autocmd")    " Put these in an autocmd group, so that we can delete them easily
 augroup vimrcEx
  au!

   " For all text files set 'textwidth' to 78 characters.
   autocmd FileType text setlocal textwidth=78
  augroup END
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
         \ | wincmd p | diffthis
endif
"au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim

set hidden  " hide when switching buffers, don't unload
set nowrap    " word wrap
"set linebreak   " attempt to wrap lines cleanly
"set cursorline  " highlight cursor line
"set title      " use filename in window title
set ttyfast
set history=200  "keep 50 lines of command line history

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Packages
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Add optinal packages here

" The matchit plugin makes the % command work better,
" but it's not backwards compatible
if has('syntax') && has('eval')
    packadd matchit
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap Keys
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map leader
let mapleader = "-"
let maplocalleader = "_"

" Remap ESC to ii
" :imap ii <Esc>

" Disable arrow keys in Normal mode
" no <Up> <Nop>
" no <Dowm> <Nop>
" no <Left> <Nop>
" no <Right> <Nop> 

" Disable arrow keys in Insert mode
" ino <Up> <Nop>
" ino <Dowm> <Nop>
" ino <Left> <Nop>
" ino <Right> <Nop> 

" Allow backspacing over everything in Insert mode
set backspace=indent,eol,start

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Don't use Ex mode, use Q for formatting
map Q gq

" Insert newline in normal mode
nnoremap <S-o> O<Esc>

"various mappings

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Stasus bar / Poweline / LightLine
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
	\ 'colorscheme' : 'sonokai'
	\}

" Always show statusline
set laststatus=2

set t_Co=256

syntax enable                                                             
set number
set relativenumber
"let g:rehash256 = 1    " only needed for Molokai colorscheme??

" Prevent non-normal modes showing in Lightline and below it
set noshowmode

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab   

" be smart when using tabs
set smarttab " <BS> removes shiftwidth worth of spaces

" 1 tab == 4 spaces
set shiftwidth=4    " spaces for autoindenting
set tabstop=4       " spaces for <Tab>

set so=5

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nertree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostard NERDTree
" autocmd vimenter * NERDTRee

" Ctrl+n toggles Nerdtree
map <C-n> :NERDTreeToggle<CR>

" Options
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Minimap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:minimap_show='<leader>mm'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>mc'
let g:minimap_toggle='<leader>mt'
let g:minimap_highlight='Visual'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_ut=
"let g:codedark_term256=1
"let g:hybrid_use_Xresources = 1
"colorscheme hybrid
"colo default " use the default colorscheme
"colorscheme codedark    " Dark+ VSCode theme
set background=dark
set termguicolors
let g:sonokai_style = 'maia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mouse scrolling
set mouse=a

" Fixes mouse issues using Alacritty terminal
set ttymouse=sgr

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Split and Tabbed Files, UI and Visual Options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Panes
set splitbelow splitright

set path+=**	" Searches current directory recursively
set wildmenu	" Display all matches when tab complete
set nobackup    " do not keep a backup file, use versions instead
set noswapfile
set showcmd     " Show incomplete commands

"set ruler   "show the cursor position all the time

let g:minimap_highlight='Visual'
let g:python_highlight_all = 1
let c_command_strings=1 " highlight strings inside C comments

set guioptions-=m	"remove menu bar
set guioptions-=T	"remote toolbar
set guioptions-=r	"remove right-hand scroll bar
set guioptions-=L	"remove left-hand scroll bar

" Folding
set foldignore=         " don't ignore anything when folding
set foldlevelstart=99   " no folds closed on open
set foldmethod=indent   " collapse code using indentations

" Tabs
set autoindent
set smartindent
set softtabstop=4   " spaces for editing, e.g. <Tab> or <BS>

"Searches
set hlsearch    " higlight search results
set incsearch   " search whiltst typing
set ignorecase  " case insensitive searching
set smartcase   " override ignorecase if upper case typed

set showmatch   " show bracket matches

" Persistent undo
set undodir=~/.vim/undodir
set undofile

"set visualbell
set noerrorbells    " don't beep
set foldlevel=1     " default foldlevel 1 to see headings

set ttimeout    " time out for key codes
set ttimeoutlen=100 " wait up to 100ms after Esc for a special key

set display=truncate

" line term
set colorcolumn=80
"highlight ColorColumn guibg=grey
"highlight Comment cterm=italic  " Use italic fonts for comments
"hi Normal ctermbg=NONE
" do not recognize octal numbers for C-A and C-X, most users find it confusing
set nrformats-=octal

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Removes pipes | that act as a separators on splits
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set fillchars+=vert:\

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spelling
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set spelllang=it

""EOF""
