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
" vim-plug - Plugin Manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The following code will check for vim-plug. If it's not present in your system
" it will set it up and all of your plugins with it.
" Useful on new installation when all you need to restore your settings is
" this one file.
" Credits: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !mkdir -p ~/.local/share/nvim/bundle
    silent !mkdir -p ~/.local/share/nvim/undo
    silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Plugin list and Installation.
" All Plugins must appear between plug#begin() and plug#end()
call plug#begin('~/.local/share/nvim/bundle')
"" Required for :help vim-plug
Plug 'junegunn/vim-plug'

"" Themes
Plug 'vim-airline/vim-airline' " AirLine status bar
Plug 'vim-airline/vim-airline-themes' " AirLine themes
Plug 'sainnhe/sonokai'	" sonokai/maia theme

"" Quality of life
Plug 'terryma/vim-multiple-cursors'   " Multi-cursor
Plug 'RRethy/vim-hexokinase', {'do': 'make hexokinase'} " Async color preview
Plug 'tpope/vim-surround'     " Change surrounding symbols
Plug 'vimwiki/vimwiki'
Plug 'junegunn/goyo.vim'
Plug 'Yggdroot/indentLine'  " show indentations

"" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " coc-vim
Plug 'tpope/vim-commentary'   " commenting

"" Syntax hightliting
Plug 'sheerun/vim-polyglot'       " A collection of language packs.
Plug 'baskerville/vim-sxhkdrc'    " Simple X Hotkey Daemon config file

"" Files search, navigation and manipulation
Plug 'junegunn/fzf.vim'    " fuzzy file finder
Plug 'preservim/nerdtree'  " NERDTree - a tree explorer plugin for vim
    Plug 'Xuyuanp/nerdtree-git-plugin' " git support for NERDTree
    Plug 'ryanoasis/vim-devicons'     " enables devicons - needs to be After NERDTree-git
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " syntax highlight for NERDTree
"Plug 'francoiscabrol/ranger.vim'     " Ranger integration

"" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

call plug#end()

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
let mapleader="ò"         " map <leader>
let maplocalleader="à"    " map <localLeader>

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

" Copy and paste
vnoremap <C-c> "*y : let @+=@*<CR>  " copy to both the clipboard and primary selection
map <C-p> "+P   " paste where the cursor is

" Spell check 'o' as in orthography
map <leader>o :setlocal spell! spelllang=it

" Replace All is aliaset to S
nnoremap S :%s//g<left><left>

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler <c-r>%<CR>

" Navigating with guides
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" General Appearances and Quality of Life
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" AirLine Statusbar
let g:airline_powerline_fonts = 1 " enable powerline symbols
"" powerline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.crypt = ''
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.spell = 'Ꞩ'
"let g:airline_symbols.notexists = 'Ɇ'
"let g:airline_symbols.whitespace = 'Ξ'
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.dirty='⚡'

let g:airline#extensions#wordcounts#enabled = 1 " GitGutter integration
let g:airline#extensions#hunks#non_zero_only =1
let g:airline_theme = 'sonokai'    " use sonokai theme

"" Theme - Sonokai Maia
let g:sonokai_style = 'maia'                    " select the style for sonokai
let g:sonokai_enable_italic = 0                 " toggle italic keywords
let g:sonokai_disable_italic_comment = 0        " toggle italic for comments
let g:sonokai_transparent_background = 0        " toggle transparent background
let g:sonokai_sign_column_background = 'none'   " set the background for signcolumn
let g:sonokai_better_performance = 1            " reduce loading times
colorscheme sonokai

"" Interface tweaking
set hidden                  " hide when switching buffers, don't unload
set colorcolumn=81          " show a line on column 80
set scrolloff=5             " Always show 5 lines above and below the cursor
set number                  " enable line numbers
set relativenumber          " make them relative to current line
set splitbelow splitright   " adjust were splits go
set cursorline              " highlight cursor line
set cursorcolumn            " highlight cursor column
set nohlsearch              " turn off permanent highlighting of search results
set list listchars=tab:▸·

"" Improved searches
set ignorecase      " case insensitive searching
set smartcase       " override ignorecase if upper case is typed
set path+=**        " search current directory recursively

"" Text tweaks
" 1 TAB == 4 Spaces
set expandtab           " use spaces instead of tabs
set shiftwidth=4        " spaces when auto indenting
set softtabstop=4       " spaces fot <Tab> and <BS>
set tabstop=8           " size of the TAB character, 8 is the legacy safe value.

set nowrap          " disable word wrap
set autoindent      " enable autoindent
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
let g:NERDTreeGitStatusUseNerdFonts = 1     " you should install nerdfonts!
let NERDTreeMinimalUI = 0       " use a minimalist UI if 1, hides ? help
"----end NERDTree

""-------------------vim-hexokinase--------------------------------------------
"" Update when leaving Insert Mode
let g:Hexokinase_refreshEvents = ['TextChangedI', 'TextChanged', 'InsertLeave']
"" What formats to highlight
" let g:Hexokinase_optInPatterns = [
            " \ 'full_hex',
            " \ 'triple_hex',
            " \ 'rgb',
            " \ 'rgba',
            " \ 'hsl',
            " \ 'hsla',
            " \ 'colour_names'
            " \]
"" Use the full background theme
let g:Hexokinase_highlighters = ['backgroundfull']
"" Enable hexokinase on enter
autocmd VimEnter * HexokinaseTurnOn
""-----end Hexokinase

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

"------------- Goyo -----------------------------------------------------------
map <leader>f :Goyo set linebreak<CR>
" Enable Goyo by default for mutt writting
" Goyo's width will be the line limit in mutt.
autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo \| set bg=light

"---end goyo

"---- Indentline
"let g:indentLine_setColors = 0 " Use the colorscheme colors
let g:indentLine_char = '·'
"let g:indentLine_setConceal = 0     " don't change conceal settings
"-----------end Indentline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype specific options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Fix some filetype detections
"set g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/Documenti/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.config/calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

"" Enable spellcheking when needed
autocmd FileType tex,latex,markdown setlocal spell spelllang=it,en_us,en_gb

"" TeX and LaTeX

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
"	autocmd VimLeave *.tex !texclear %
" Word count:
autocmd FileType tex map <leader>w :w !detex \| wc -w<CR>
" Code snippets
autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,li <Enter>\item<Space>
autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,bt {\blindtext}
autocmd FileType tex inoremap ,nu $\varnothing$
autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}i

"""HTML
autocmd FileType html inoremap ,b <b></b><Space><++><Esc>FbT>i
autocmd FileType html inoremap ,it <em></em><Space><++><Esc>FeT>i
autocmd FileType html inoremap ,1 <h1></h1><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ,2 <h2></h2><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ,3 <h3></h3><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ,p <p></p><Enter><Enter><++><Esc>02kf>a
autocmd FileType html inoremap ,a <a<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType html inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType html inoremap ,ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
autocmd FileType html inoremap ,li <Esc>o<li></li><Esc>F>a
autocmd FileType html inoremap ,ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
autocmd FileType html inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
autocmd FileType html inoremap ,td <td></td><++><Esc>Fdcit
autocmd FileType html inoremap ,tr <tr></tr><Enter><++><Esc>kf<i
autocmd FileType html inoremap ,th <th></th><++><Esc>Fhcit
autocmd FileType html inoremap ,tab <table><Enter></table><Esc>O
autocmd FileType html inoremap ,gr <font color="green"></font><Esc>F>a
autocmd FileType html inoremap ,rd <font color="red"></font><Esc>F>a
autocmd FileType html inoremap ,yl <font color="yellow"></font><Esc>F>a
autocmd FileType html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
autocmd FileType html inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
autocmd FileType html inoremap &<space> &amp;<space>
autocmd FileType html inoremap á &aacute;
autocmd FileType html inoremap é &eacute;
autocmd FileType html inoremap í &iacute;
autocmd FileType html inoremap ó &oacute;
autocmd FileType html inoremap ú &uacute;
autocmd FileType html inoremap ä &auml;
autocmd FileType html inoremap ë &euml;
autocmd FileType html inoremap ï &iuml;
autocmd FileType html inoremap ö &ouml;
autocmd FileType html inoremap ü &uuml;
autocmd FileType html inoremap ã &atilde;
autocmd FileType html inoremap ẽ &etilde;
autocmd FileType html inoremap ĩ &itilde;
autocmd FileType html inoremap õ &otilde;
autocmd FileType html inoremap ũ &utilde;
autocmd FileType html inoremap ñ &ntilde;
autocmd FileType html inoremap à &agrave;
autocmd FileType html inoremap è &egrave;
autocmd FileType html inoremap ì &igrave;
autocmd FileType html inoremap ò &ograve;
autocmd FileType html inoremap ù &ugrave;

""".bib
autocmd FileType bib inoremap ,a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
autocmd FileType bib inoremap ,b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
autocmd FileType bib inoremap ,c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i

"MARKDOWN
autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO

""".xml
autocmd FileType xml inoremap ,e <item><Enter><title><++></title><Enter><guid<space>isPermaLink="false"><++></guid><Enter><pubDate><Esc>:put<Space>=strftime('%a, %d %b %Y %H:%M:%S %z')<Enter>kJA</pubDate><Enter><link><++></link><Enter><description><![CDATA[<++>]]></description><Enter></item><Esc>?<title><enter>cit
autocmd FileType xml inoremap ,a <a href="<++>"><++></a><++><Esc>F"ci"

"""---= Configuration Files =---"""

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" When shortcut files are updated, renew bash and vifm configs with new material:
"autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

" Update binds when sxhkdrc is updated.
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

"
""""EOF""""
