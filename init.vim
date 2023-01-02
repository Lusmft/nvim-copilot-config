set nocompatible              " be iMproved, required
filetype off                  " required

if has('nvim')
  function! UpdateRemotePlugins(...)
    let &rtp=&rtp
    UpdateRemotePlugins
  endfunction
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/site/plugged')

" Declare the list of plugins.
"---------=== Навигация по коду ===-------------
Plug 'scrooloose/nerdtree'              " Project and file navigation

"---------=== Работа с кодом ===-------------
"Plug 'tpope/vim-fugitive'               " Git wrapper
"Plug 'tpope/vim-rhubarb'                " Fugitive GitHub integration
"Plug 'lewis6991/gitsigns.nvim'          " Git signs / Не получилось инициировать
Plug 'simnalamburt/vim-mundo'            " Undo Tree
Plug 'Raimondi/delimitMate'              " Auto closings of brackets, quotes, etc..
Plug 'petobens/poet-v'                   " Poet.vim - A simple, fast, and powerful vim plugin for poetry

"------------------=== Внешний вид ===----------------------
Plug 'vim-airline/vim-airline'          " Statusline
Plug 'vim-airline/vim-airline-themes'   " Themes for Airline
Plug 'ryanoasis/vim-devicons'           " Icons for NerdTree

"------------------=== Прочее ===----------------------
Plug 'mhinz/vim-startify'               " Start screen
Plug 'preservim/nerdcommenter'          " Комментирование строк
"Plug 'neoclide/coc.nvim', {'branch': 'release'}      " Nodejs host extension
"Plug 'rosenfeld/conque-term'           " Consoles as buffers
"Plug 'Valloric/YouCompleteMe'	         " Autocompletion
Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }       " Autocompletion command line

"--------------=== Поддержка сниппетов ===---------------
" Plug 'MarcWeber/vim-addon-mw-utils'   " dependencies #1
" Plug 'tomtom/tlib_vim'                " dependencies #2
" Plug 'honza/vim-snippets'             " snippets repo
" Plug 'SirVer/ultisnips'	        " snippets engine

"---------------=== Поддержка языка ===-------------
"Plug 'williamboman/mason.nvim'	      " Mason language support
"Plug 'williamboman/mason-lspconfig.nvim' " Mason language server
"Plug 'neovim/nvim-lspconfig'	      " LSP configuration

" --- Python ---
Plug 'klen/python-mode'               " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plug 'davidhalter/jedi-vim'           " Jedi-vim autocomplete plugin
Plug 'mitsuhiko/vim-python-combined'  " Python syntax highlighting
Plug 'lepture/vim-jinja'	      " Jinja2 syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Treesitter

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""
" Color Settings
"""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

set splitright
set splitbelow

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L
" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Press i to enter insert mode, and ii to exit insert mode.
:inoremap ii <Esc>
:inoremap jk <Esc>
:inoremap kj <Esc>
:vnoremap jk <Esc>
:vnoremap kj <Esc>

filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
" General settings
"=====================================================
set backspace=indent,eol,start
let no_buffers_menu=1
set mousemodel=popup
let mapleader = " "

set ruler
set completeopt-=preview
set gcr=a:blinkon0
if has("gui_running")
  set cursorline
endif
set ttyfast

if has("gui_running")
" GUI? устаналиваем тему и размер окна
  set lines=50 columns=125
  colorscheme solarized "molokai
" раскомментируйте эти строки, если хотите, чтобы NERDTree/TagBar автоматически отображались при запуске vim
" autocmd vimenter * NERDTree
" autocmd vimenter * if !argc() | NERDTree | endif

" на маке vim?
if has("mac")
  set guifont=Consolas:h13
  set fuoptions=maxvert,maxhorz
else
" дефолтный GUI
  set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 10
endif
else
" терминал?
  colorscheme default
endif

tab sball
set switchbuf=useopen

" отключаем пищалку и мигание
set visualbell t_vb=
set novisualbell

set enc=utf-8        " utf-8 по дефолту в файлах
set ls=2             " всегда показываем статусбар
set incsearch        " инкреминтируемый поиск
set hlsearch         " подсветка результатов поиска
set nu               " показывать номера строк
set scrolloff=5      " 5 строк при скролле за раз

" отключаем бэкапы и своп-файлы
set nobackup         " no backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile       " no swap files

" прячем панельки
"set guioptions-=m   " меню
set guioptions-=T    " тулбар
"set guioptions-=r   "  скроллбары

" настройка на Tab
set smarttab
set tabstop=8

"  при переходе за границу в 80 символов в Ruby/Python/js/C/C++ подсвечиваем на темном фоне текст
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%120v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

" указываем каталог с настройками SnipMate
let g:snippets_dir = "~/.vim/vim-snippets/snippets"

" настройки Vim-Airline
set laststatus=2
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" NerdTree настройки
" показать NERDTree на F3
map <F3> :NERDTreeToggle<CR>
"игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
map <S-h> :tabn<cr>
map <S-l> :tabp<cr>

" Работа буфферами
map <C-q> :bd<CR>          " CTRL+Q - закрыть текущий буффер
map <C-n> :bn<CR>          " CTRL+N - Следующий буффер
map <C-p> :bp<CR>          " CTRL+P - Предыдущий буффер

"=====================================================
" Python-mode settings
"=====================================================
" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pep8"
let g:pymode_lint_ignore="E501,W601,C0110,E2"
" провека кода после сохранения
let g:pymode_lint_write = 1

" поддержка virtualenv
let g:pymode_virtualenv = 1

" установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 0

" возможность запускать код
let g:pymode_run = 0


"=====================================================
" User hotkeys
"=====================================================
" проверка кода в соответствии с PEP8 через <leader>8
"autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>
" автокомплит через <Ctrl+Space>
inoremap <C-Space> <C-x><C-o>


" переключение между синтаксисами
nnoremap <F11> :set ft=htmljinja<CR>
nnoremap <F10> :set ft=python<CR>
"nnoremap <leader>Tj :set ft=javascript<CR>
"nnoremap <leader>Tc :set ft=css<CR>
"nnoremap <F9> :set ft=django<CR>


"=====================================================
" Languages support
"=====================================================
" --- Python ---
"autocmd FileType python set completeopt-=preview " раскомментируйте, в случае, если не надо, чтобы jedi-vim показывал документацию по методу/классу
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" --- JavaScript ---
let javascript_enable_domhtmlcss=1
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.json setlocal ft=javascript

" --- HTML ---
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" --- template language support (SGML / XML too) ---
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd bufnewfile,bufread *.rhtml setlocal ft=eruby
autocmd BufNewFile,BufRead *.mako setlocal ft=mako
autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python
let html_no_rendering=1
let g:closetag_default_xml=1
let g:sparkupNextMapping='<c-l>'
autocmd FileType html,htmldjango,htmljinja,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako source ~/.vim/scripts/closetag.vim

" --- CSS ---
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" --- Others ---

set tw=120           " 120 символов на строке
set colorcolumn=120  " 120 символов на строке
hi ColorColumn ctermbg=black
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"=====================================================
" Plugins configuration
"=====================================================
" --- YCM ---

"let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
"let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
"let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
"let g:ycm_complete_in_comments = 1 " Completion in comments
"let g:ycm_complete_in_strings = 1 " Completion in string

" --- Wilder ---
" Key bindings can be changed, see below
call wilder#setup({'modes': [':']})

" --- Vim Undo ---
" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo
nnoremap <F5> :MundoToggle<CR>

" --- Jedi ---
let g:jedi#popup_on_dot = 1

" --- Poet-v ---
autocmd FileType python PoetvActivate

" --- Highlights ---
autocmd FileType python,lua,vim highlight Comment ctermfg=Green
autocmd FileType python,lua,vim highlight Normal ctermfg=White

" --- Additional config in lua ---
lua require('config')
