" This is the personal .vimrc file of mimiasd.
" 
" Inspired by spf13-vim, amix/vimrc and space-vim.

" vim 各个插件的配置
" Use bundles config if available {
    if filereadable(expand("~/.vimrc.bundles"))
        source ~/.vimrc.bundles
    endif
" }
"
" 解决backspace按键不能用问题
set nocompatible
set backspace=indent,eol,start

" 设置前缀
nmap <space> <leader>
  
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
