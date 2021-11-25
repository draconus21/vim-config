" tells vim not to bother with compatibility for Vi
set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" VUNDLE AND PLUGINS: {{{
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Badwolf COLORSCHEME: {{{
Plugin 'https://github.com/sjl/badwolf.git'
let g:badwolf_darkgutter = 1  " number line color is darker than bg
let g:badwolf_tabline = 0		  " tabline (in console, at the top, contains various tabs) much
                              " lighter than bg
let g:badwolf_html_link_underline = 1	" Turn on HTML link underlining
let g:badwolf_css_props_highlight = 1	" Turn on CSS properties highlighting
" }}}

" NERDTREE: {{{
Plugin 'preservim/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'

let NERDTreeIgnore = ['\.pyc$', 'CmakeBuild', 'venv', 'egg', 'egg-info', 'dist', '\.pb$', '\.pbtxt$', '\.bin$', '\.raw$', '__pycache__']

" clone NERDTree on exit (to ensure that vim-workspace can save and load sessions properly'
autocmd VimLeave * NERDTreeClose

" open NERDTree for directories
autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" workaroud for a nerdtree bug
" https://github.com/preservim/nerdtree/issues/911
let g:NERDTreeNodeDelimiter = "\u00a0"

let g:NERDTreeWinSize = 35

" NERDTree Toggle
" close if open, else open nerdtree to current file
nnoremap <expr> <C-n> g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'

" Commands
" o : open file
" i : open in hsplit
" s : open in vsplit
"  }}}

" vim-workspace: {{{
Plugin 'thaerkh/vim-workspace'
nnoremap <space>s :ToggleWorkspace<CR>
" }}}

" surround: {{{
" easy surrouding brackets/quotes, etc
Plugin 'tpope/vim-surround'
" }}}

" Better WhiteSpace: {{{
Plugin 'ntpeters/vim-better-whitespace'
let g:strip_whitespace_confirm=0
let g:show_spaces_that_precede_tabs=1
let g:strio_only_modified_lines=1
highlight BadWhiteSpace ctermbg=red guibg=red
autocmd FileType c,cpp,python,rst,sh EnableStripWhitespaceOnSave

" }}}

" CODE SYNTAX: {{{
set background=dark

Plugin 'psf/black'
" run Black on save
autocmd BufWritePre *.py execute ':Black'
" }}}

" POWERLINE: {{{
"Plugin 'git://github.com/powerline/powerline.git', {'rtp': 'powerline/bindings/vim'}
" use python installation to avoid nasty redraw bug
" https://powerline.readthedocs.io/en/latest/installation/linux.html
set encoding=utf-8
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2 " Always show status line
" }}}

" undotree: {{{
Plugin 'https://github.com/mbbill/undotree.git'
let g:undotree_WindowLayout = 4
nnoremap ,u :UndotreeToggle<CR>
" }}}

" Gutentags: {{{
Plugin 'ludovicchabant/vim-gutentags'

" addititional config: {{{
let g:gutentags_project_root = ['.git']
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_cache_dir = '~/.tags/'
let g:gutentags_ctags_exclude = [
  \ '*.git',
  \ '*/third_parties/*',
  \ '*/resources/*',
  \ '*/tests/*',
  \ 'CmakeBuild',
  \ 'build',
  \ 'dist',
  \ '*sites/*/files/*',
  \ 'bin',
  \ 'cache',
  \ 'compiled',
  \ 'docs',
  \ 'examples',
  \ 'bundle',
  \ '*.sh',
  \ '*.md',
  \ '*-lock.json',
  \ '*.lock',
  \ '*bundle*.js',
  \ '*build*.js',
  \ '.*rc*',
  \ '*.json',
  \ '*.min.*',
  \ '*.map',
  \ '*.bak',
  \ '*.zip',
  \ '*.pyc',
  \ '*.class',
  \ '*.sln',
  \ '*.master',
  \ '*.csproj',
  \ '*.tmp',
  \ '*.csproj.user',
  \ '*.cache',
  \ '*.pdb',
  \ 'tags*',
  \ 'cscope.*',
  \ '*.css',
  \ '*.less',
  \ '*.scss',
  \ '*.exe', '*.dll',
  \ '*.mp3', '*.ogg', '*.flac',
  \ '*.swp', '*.swo',
  \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
  \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
  \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
  \]
" }}}
" }}}

" LaTeX: {{{
Plugin 'lervag/vimtex'
let g:tex_flavor = 'latex'
" }}}

" SimpylFold: {{{
Plugin 'tmhedberg/SimpylFold'
" }}}

" Vim log highlighting: {{{
Plugin 'MTDL9/vim-log-highlighting'
" }}}

call vundle#end()
" }}}

" enable syntax
syntax enable
filetype plugin on
filetype plugin indent on
set encoding=utf-8
" set spell spelllang=en

" search down into subfolders
" Provide tab-completion for all file related tasks
set path+=**

" TAG JUMPING:{{{
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

" popup-menu options
let completeopt = "menuone,preview"

" remap <C-n>, <C-p> to j, k to navigate autocomplete list
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

" }}}

" FOLDING: {{{
" set foldenable
set foldlevelstart=0    " close all folds by default
set foldnestmax=10      " max of 10 nested folds
set foldmethod=indent   " fold based on indent level

nnoremap <space> za

autocmd FileType cpp set foldmarker={,}
autocmd FileType c set foldmarker={,}


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
inoremap jj <esc>
inoremap <esc> <NOP>

" enable consequtive indenting with > or <
vnoremap < <gv
vnoremap > >gv

command TabToSpace :set tabstop=4 shiftwidth=4 expandtab <bar> :%retab! <bar> :set list
command SpaceToTab :set tabstop=4 noexpandtab <bar> :%retab! <bar> :set tabstop=4 shiftwidth=4
command FixTabs :SpaceToTab <bar> :TabToSpace

" MOVEMENT: {{{
" move vertically without skipping single line broken
" as mutliple lines
vnoremap j gj
vnoremap k gk
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gv `[`v`]

" split window naviations
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>

" tab navigation
nnoremap tN  :tabnew<CR>
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
" }}}

" }}}

" UI CONFIG:{{{
set wildmenu    " Display all matching files when we tab complete
" do not search for autocomplete in included files
" super super slow!
setglobal complete-=i
set number
set cursorline  " highlight/underline current line
set showmatch   " highlight matching brackets
set lazyredraw  " redraw only when we need to
"set tw=99       " width of document
set colorcolumn=107

set backspace=indent,eol,start
set splitbelow
set splitright
set relativenumber
set number
" }}}

" SEARCHING: {{{
set incsearch   " search as characters are entered
set hlsearch    " highlight matches

" turn off highlighting
nnoremap <space>n :nohlsearch<CR>
" }}}

" COLORS: {{{
colorscheme badwolf
set t_Co=256
" }}}

" AUTORELOAD CHANGED FILES: {{{
" autoreload triggered when changing bufferes when inside vim
 set autoread
 au FocusGained,BufEnter * :checktime
" }}}

" AUTORELOAD VIMRC:{{{
" no need to restart vim everytime vimrc is changed
nnoremap <space>vr :source $MYVIMRC<CR>
 augroup myvimrc
     au!
     au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc source $MYVIMRC | if has('gui_running') | source $MYVIMRC | endif
 augroup END
" }}}

" OPEN MAXIMIZED: {{{
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
endif
" }}}

" SPACES AND TABS: {{{
set shiftwidth=2    " number of spaces for >> or <<
set tabstop=2       " number of spaces inserted when viewing <space>
set softtabstop=2   " number of spaces inserted when <space> is pressed
set expandtab       " expand tabs to spaces
set autoindent

" display tabs as >-
set list
set listchars=tab:>-,trail:.

command ShowTabs :set list | :set listchars=tab:>-
" }}}

" VIM CONFIG:
" config for this file
" configs are placed in comments
set modelines=2
set foldmarker={{{,}}}
set foldmethod=marker
set foldlevel=0
