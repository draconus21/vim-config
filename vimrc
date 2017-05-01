" tells vim not to bother with compatibility for Vi
set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" VUNDLE AND PLUGINS: {{{
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" NERDTREE: {{{
Plugin 'scrooloose/nerdtree'
let nerdtreeignore = ['\.pyc$', 'build', 'venv', 'egg', 'egg-info/', 'dist', 'docs']
"  }}}

" Better WhiteSpace: {{{
Plugin 'ntpeters/vim-better-whitespace'
" }}}
" PYTHON SYNTAX: {{{
"Plugin 'vim-scripts/Pydiction'
"let g:pydiction_location='/home/neeth/.vim/bundle/Pydiction/complete-dict'

Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
" }}}

" POWERLINE: {{{
Plugin 'git://github.com/powerline/powerline.git', {'rtp': 'powerline/bindings/vim'}
"set encoding=utf-8
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
set laststatus=2

" }}}

" PATHOGEN: {{{
" Plugin 'pathogen.vim'
" runtime !debian.vim
" set nocompatible
" call pathogen#infect()

" }}}

" GUNDO: {{{
" undo tree
Plugin 'Gundo'
" }}}

call vundle#end()
" }}}

" enable syntax
syntax enable
filetype plugin on
set encoding=utf-8
" set spell spelllang=en

" search down into subfolders
" Provide tab-completion for all file related tasks
set path+=**

" TAG JUMPING:{{{
" create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" ^] jump to tag
" g^] list files that have the tag
" ^t jump back up the tag stack
" }}}

" AUTOCOMPLETE:{{{
" documented in |ins-complettion|
" ^n   autocomplete, move up in list
" ^p   autocomplete move back in list
" ^x^n for JUST this file
" ^x^f for filenames (works for path+=**)
" ^x^] for tags only
" ^xs  spelling suggestion
" }}}

" FOLDING: {{{
" set foldenable
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " max of 10 nested folds
set foldmethod=indent   " fold based on indent level

nnoremap <space> za

" }}}

" FILE BROWSING:{{{
" Tweaks for browsing
let g:netrw_banner=0          " disable annoying banner
let g:netrw_browse_split=4    " open in prior window
let g:netrw_altv=1            " open splits to the right
let g:netrw_liststyle=3       " tree view
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^|\s\s)\zs\.S\+'

" :edit a folder to open a file browser
" <CR>/v/t to open in a h-split/v-split/tab
" documentation in |netrw-browse-maps|
" }}}

" MAPPINGS AND SNIPPETS:{{{
" n no  remap <keycomb> <task/cmdlist>
" ^  ^   ^
" |  |   |
" |  |	 remap <keycomb> to <task/cmdlist>
" |  don't invoke other mappings
" normal mode

" B
" <esc> in insert mode is now jk
inoremap jk <esc>
inoremap <esc> <NOP>

nnoremap ,u :GundoToggle<CR>

nnoremap ,pyb :-1read /home/neeth/.vim/.skeleton.import.basic<CR>8ja
nnoremap ,pya :-1read /home/neeth/.vim/.skeleton.import.basic<CR>8j:read /home/neeth/.vim/.skeleton.import.airy<CR>4ja
nnoremap ,pyt :-1read /home/neeth/.vim/.skeleton.import.basic<CR>8j:read /home/neeth/.vim/.skeleton.import.theano<CR>7ja
nnoremap ,pyk :-1read /home/neeth/.vim/.skeleton.import.basic<CR>8j:read /home/neeth/.vim/.skeleton.import.keras<CR>9ja

" enable consequtive indenting with > or <
vnoremap < <gv
vnoremap > >gv

" disable arrow keys
" get into the habit of using kjhl instead
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <c-Up> <NOP>
noremap <c-Down> <NOP>
noremap <c-Left> <NOP>
noremap <c-Right> <NOP>

" COMP322 A2
" rename student main
" nnoremap <space><space><space><space> :/int\ main()<CR>^lllllllli2<esc>:wq<CR>
" }}}

" SPACES AND TABS: {{{
set shiftwidth=4    " number of spaces for >> or <<
set tabstop=4       " number of spaces inserted when viewing <space>
set softtabstop=4   " number of spaces inserted when <space> is pressed
set expandtab       " expand tabs to spaces
set autoindent
highlight BadWhiteSpace ctermbg=red guibg=red
filetype indent on  " indent based on ~/.vim/indent and filetype
autocmd FileType python autocmd BufEnter <buffer> EnableStripWhitespaceOnSave
" }}}

" UI CONFIG:{{{
set wildmenu    " Display all matching files when we tab complete
set number
set cursorline  " highlight/underline current line
set showmatch   " highlight matching brackets
set lazyredraw  " redraw only when we need to
set tw=99       " width of document
set colorcolumn=100
" }}}

" MISC: {{{
set backspace=indent,eol,start
set splitbelow
set splitright
set number
" }}}

" SEARCHING: {{{
set incsearch   " search as characters are entered
set hlsearch    " highlight matches

" turn off highlighting
nnoremap <space>n :nohlsearch<CR>
" }}}

" MOVEMENT: {{{
" move vertically without skipping single line broken
" as mutliple lines
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gv `[`v`]

" split window naviations
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
" }}}

" COLORS: {{{
" colorscheme molokai
" let g:molokai_original=1
colorscheme badwolf
let g:badwolf_darkgutter = 1			" number line color is darker than bg
let g:badwolf_tabline = 0				" tabline (in console, at the top,
                                        " contains various tabs) much lighter
                                        " than bg
let g:badwolf_html_link_underline = 1	" Turn on HTML link underlining
let g:badwolf_css_props_highlight = 1	" Turn on CSS properties highlighting

" }}}

" PYTHON:{{{
nnoremap [r :w<CR>:!python %<CR> 
" }}}

" VIM CONFIG:
" config for this file
" configs are placed in comments
set modelines=2
" vim: foldmethod=marker
" vim: foldlevel=0
