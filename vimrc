" 解决backspace按键不能用问题
set nocompatible
set backspace=indent,eol,start

" 设置前缀
let mapleader = ','

" 个性设置
syntax on
set nu
set cursorline
highlight CursorLine cterm=NONE ctermbg=grey ctermfg=NONE 
set showmatch
set wildmenu
set wildmode=list:longest,full
set hlsearch 
nnoremap <silent> xh    :nohlsearch<CR>
nmap <Leader>y "+y
" 相对行号
nnoremap <silent> sr    :set relativenumber<CR>
nnoremap <silent> xr    :set norelativenumber<CR>

" 粘贴缩进
nnoremap <silent> sp    :set paste<CR>
nnoremap <silent> np    :set nopaste<CR>

" solarized配色方案设置
syntax enable
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
set background=dark
colorscheme solarized

" 括号自动补全
"inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap < <><ESC>i
inoremap { {<CR>}<ESC>O
inoremap <Leader>{ {}<ESC>i

" 自动补全css，html代码
autocmd FileType css set omnifunc=csscomplete
autocmd FileType html set omnifunc=htmlcomplete

" 使鼠标可用，并在输入时自动隐藏鼠标
set mouse=a
set mousehide

"  tabstop 表示一个 tab 显示出来是多少个空格的长度，默认 8
"  shiftwidth 表示每一级缩进的长度，一般设置成跟 softtabstop 一样
set tabstop=4
set shiftwidth=4
nnoremap <silent> st    :set expandtab<CR>

" Vundle设置
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
" ...

Bundle 'scrooloose/nerdtree'
" NERDTree 配置
map <C-e> :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
"let NERDTreeChDirMode=0
"let NERDTreeQuitOnOpen=0
"let NERDTreeMouseMode=2
"let NERDTreeShowHidden=1
"let NERDTreeKeepTreeInNewTab=1
"let g:nerdtree_tabs_open_on_gui_startup=0
"let g:NERDShutUp=1

Bundle 'fatih/vim-go'
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>i <Plug>(go-imports)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>f <Plug>(gofmt)
au FileType go nmap <Leader>t <Plug>(go-test)

Bundle 'nsf/gocode', {'rtp': 'vim/'}
filetype plugin on
imap <C-a> <C-x><C-o>

Bundle 'SirVer/ultisnips'

Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'

Bundle 'tpope/vim-surround'

Bundle 'vim-airline/vim-airline'

Bundle 'vim-scripts/ctags.vim'
Bundle 'majutsushi/tagbar'
nnoremap <silent> tb :TagbarToggle<CR>

Bundle 'Lokaltog/vim-easymotion'

Bundle 'scrooloose/nerdcommenter'

Bundle 'altercation/vim-colors-solarized'
let g:NERDSpaceDelims=1

Bundle 'godlygeek/tabular'
nmap <Leader>= :Tabularize /=<CR>
vmap <Leader>= :Tabularize /=<CR>
nmap <Leader>: :Tabularize /:<CR>
vmap <Leader>: :Tabularize /:<CR>

Bundle 'luochen1990/rainbow'
let g:rainbow_active = 1 

Bundle 'Valloric/YouCompleteMe'
set runtimepath+=~/.vim/bundle/YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键, 没有这个会拦截掉tab
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |    " 回车即选中当前项
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>

" html/css
Bundle 'mattn/emmet-vim'

" 对齐线
Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
nnoremap <silent> eg    :IndentGuidesEnable<CR>
nnoremap <silent> dg    :IndentGuidesDisable<CR>

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
