"   _       _ _         _
"  (_)     (_) |       (_)
"   _ _ __  _| |___   ___ _ __ ___
"  | | '_ \| | __\ \ / / | '_ ` _ \
"  | | | | | | |_ \ V /| | | | | | |
"  |_|_| |_|_|\__(_)_/ |_|_| |_| |_|
"
"  ~/.config/nvim/init.vim - Neovim configuration file.
"
" Witten to work on *most* GNu/Linux distributions.
" Things that are not working or WIP are commented. Usually.
" Stolen from many places over the years and tweaked to my likings and needs,
" feel free to do the same. I will give credit when possiple to the original
" authors.
"
" I am NOT responsable if this breaks your OS or Machine.
"
" By: Giuseppe (mhsalvor) Molinaro - g.molinaro@linuxmail.org
"
"
" General credits: Brodie Robertson - github.com/BrodieRobertson
"                  Luke Smith - github.com/LukeSmithxyz
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle - Plugin Manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The following code will check for Vundle. If it's not present in your system
" it will set it up and all of your plugins with it.
" Useful on new installation when all you need to restore your settings is
" this one file.
" Credits: Erik Zaadi - https://erikzaadi.com
let iCanHazVundle=1
let vundle_readme=expand('~/.local/share/nvim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
	echo "Installing Vundle..."
	echo ""
	silent !mkdir -p ~/.local/share/nvim/bundle
	silent !mkdir -p ~/.local/share/nvim/undo
	silent !git clone https://github.com/VundleVim/Vundle.Vim ~/.local/share/nvim/bundle/vundle
	let iCanHazVundle=0
endif

" nvim is allways nocompatible.
" The folowing is needed for package installation
filetype off

" set the runtime path to include Vundle and Initialize
set rtp+=~/.local/share/nvim/bundle/vundle/
" set a sane installation dir for the plugins,
" the default points to ~/.vim - lets keep ~ clean.
call vundle#rc("~/.local/share/nvim/bundle")

" Plugin list and Installation.
" All Plugins must appear between vundle#begin() and vundle#end()
call vundle#begin()
"" Let Vundle manage itself, required.
Plugin	'VundleVim/Vundle.vim'

"" Themes
Plugin 'vim-airline/vim-airline' " AirLine status bar
Plugin 'vim-airline/vim-airline-themes' " AirLine themes
Plugin 'sainnhe/sonokai'	" sonokai/maia theme

"" Quality of life
Plugin 'terryma/vim-multiple-cursors'   " Multi-cursor
Plugin 'RRethy/vim-hexokinase', {'do': 'make hexokinase'} " Async color preview

"" Code completion
Plugin 'neoclide/coc.nvim', {'branch': 'release'}  " coc-vim
Plugin 'tpope/vim-commentary'   " commenting

"" Syntax hightliting
Plugin 'sheerun/vim-polyglot'       " A collection of language packs.
Plugin 'baskerville/vim-sxhkdrc'    " Simple X Hotkey Daemon config file

"" Files search, navigation and manipulation
Plugin 'junegunn/fzf.vim'    " fuzzy file finder
Plugin 'preservim/nerdtree'  " NERDTree - a tree explorer plugin for vim
Plugin 'Xuyuanp/nerdtree-git-plugin' " git support for NERDTree
Plugin 'ryanoasis/vim-devicons'     " enables devicons - needs to be After NERDTree-git
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' " syntax highlight for NERDTree

"" Git
Plugin 'airblade/vim-gitgutter'

"" Initialize Vundle
if iCanHazVundle == 0
	echo "Installing Vundle, please ignore keymap error messages."
	echo ""
	:PluginInstall
endif
call vundle#end()
filetype plugin indent on	" required
" To ignore plugin indent changes, instead, use:
" filetype plugin on
"
" Vundle commands - brief help
" :PluginList		-	lists configured plugins;
" :PluginInstall	-	install plugins, append '!' to update;
" :PluginUpdate		-	update plugins;
" :PluginSearch foo	-	searches plugins for 'foo', append '!' to
" 				refresh local chache;
" :PluginClean		-	confirms removal of unused (commented)
" 				plugins, append '!' to auto-approve removal.
"
" See :h vundle for more details.
" Put your non-plugin stuff after this line.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic configuration and Defaults
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set title       " use filename in windowtitle
set undofile    " persistent undo
set mouse=a     " enable mouse support (should work by default in nvim but...)
set clipboard+=unnamedplus " use the system clipboard for copy-paste
set wildmode=longest,list,full  " Adjust autocompletion behavior
set noshowmode  " don't show mode info below the statusline, only show them once
set termguicolors " make nvim use truecolors

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader="è"         " map <leader>
let maplocalleader="ò"    " map <localLeader>

" Create multiple newlines in normal mode
nnoremap <S-o> O<Esc>

" Better split navigation
map <A-h> <C-w>h
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-l> <C-w>l

" Alias write and quit
nnoremap <leader>q :wq<CR>
nnoremap <leader>s :w<CR>

" Save file as sudo when no sudo permissions
cmap w!! w !sudo tess > /dev/null %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Appearances and Quality of Life
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" AirLine Statusbar
let g:airline_powerline_fonts = 1 " enable powerline symbols
let g:airline_theme = 'sonokai'    " use sonokai theme

"" Theme - Sonokai Maia
let g:sonokai_style = 'maia'    " select the style for sonokai
let g:sonokai_enable_italic = 0 " toggle italic keywords
let g:sonokai_disable_italic_comment = 0    " toggle italic for comments
let g:sonokai_transparent_background = 0    " toggle transparent background
let g:sonokai_sign_column_background = 'none' " set the background for signcolumn
let g:sonokai_better_performance = 1    " reduce loading times

colorscheme sonokai

"" Interface tweaking
set hidden          " hide when switching buffers, don't unload
set colorcolumn=81	" show a line on column 80
set scrolloff=5     " Always show 5 lines above and below the cursor
set number		    " enable line numbers
set relativenumber	" make them relative to current line
set splitbelow splitright " adjust were splits go
set cursorline      " highlight cursor line
set cursorcolumn    " highlight cursor column

"" Improved searches
set ignorecase      " case insensitive searching
set smartcase       " override ignorecase if upper case is typed
set path+=**        " search current directory recursively

"" Text tweaks
" 1 TAB == 4 Spaces
set expandtab		" use spaces instead of tabs
set shiftwidth=4	" spaces when auto indenting
set tabstop=4		" spaces for <Tab> and <BS>

set nowrap          " disable word wrap
set smartindent     " do smart auto indent when starting a new line
set showmatch       " show bracket matches

"" Folding
set foldlevelstart=99   " no folding on a newly opened file
set foldlevel=1         " default foldlevel to 1 to see headings
set foldmethod=indent   " collapse using indentations

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic AutoCmd
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin specific configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ------------ CoC -----------------------------------------------------------
"  prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"let g:gog_global_extension = [
"    \ 'coc-snippets',
"    \ 'coc-pairs',
"    \ 'coc-prettier',
"    \ 'coc-vimtex'
"    \]

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mycocgroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to foldcurrent buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"-------end Coc


"---------------------- Vim fzf-----------------------------------------------
" Searches git repositories
nnoremap <A-g> :GFiles<CR>
command! -bang -nargs=? -complete=dir GFiles
        \call fzf#vim#gfiles(<q-args>, {'options': ['--preview', 'preview {}']}, <bang>0)
" Searches filesystem
nnoremap <A-z> :Files<CR>
command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, {'options': ['--preview', 'preview {}']}, <bang>0)
" Preview windows preferences
let g:fzf_preview_window = 'right:60%'  "split right, 60% size of main split
"----end vim fzf

"------------Nerdtree---------------------------------------------------------
" Open NerdTree automatically on nvim startup
"autocmd vimenter * NERDTree
" Close nvim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle NERDTree
map <C-f> :NERDTreeToggle<Cr>

"" nerdtree-git-plugin
" use nerdfonts
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts!
let NERDTreeMinimalUI = 0 " use a minimalist UI if 1, hides ? help
"----end NERDTree

"-------------------vim-hexokinase--------------------------------------------
" Update when leaving Insert Mode
let g:Hexokinase_refreshEvents = ['InsertLeave']
" What formats to higlight
let g:Hexokinase_optInPatterns = [
            \ 'full_hex',
            \ 'triple_hex',
            \ 'rgb',
            \ 'rgba',
            \ 'hsl',
            \ 'hsla',
            \ 'colour_names'
            \]
" Use the full background theme
let g:Hexokinase_highlighters = ['backgroundfull']
" Enable hexokinase on enter
autocmd VimEnter * HexokinaseTurnOn
"-----end Hexokinase

"------- GitGutter --------------------------
" some colors
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0    " disable default mappings
let g:gitgutter_highlight_linenrs = 1
"----end gitgutter

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype specific options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Fix some filetype detections
autocmd BufRead,BufNewFile *.tex set filetype=tex  " TeX
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calsurse/notes/* set filetype=markdown

"" Enable spellcheking when needed
autocmd FileType tex,latex,markdown setlocal spell spelllang=it,en_us,en_gb


"" TeX and LaTeX

"
""""EOF""""
