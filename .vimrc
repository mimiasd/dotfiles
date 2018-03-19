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

" 窗口切换  
nnoremap <leader><left>  <c-w>h  
nnoremap <leader><right> <c-w>l  
nnoremap <leader><down>  <c-w>j  
nnoremap <leader><up>    <c-w>k   
" 句首，句末
nnoremap <S-left> ^
nnoremap <S-right> $

" 开启语法高亮功能
syntax enable
" 允许指定语法高亮配色方案替换默认方案
syntax on
" 开启行号显示
set nu
" 命令行显示输入的命令
set showcmd         
" 命令行的高度
set cmdheight=2
" 命令行显示vim当前模式
set showmode

" 高亮显示当前行/列
set cursorline
" set cursorcolumn

" 配置高亮行，see :help highlight
highlight CursorLine   cterm=NONE ctermbg=235 guibg=NONE guifg=NONE
" highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

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

" 使鼠标可用，并在输入时自动隐藏鼠标
set mouse=a
set mousehide

"  tabstop 表示一个 tab 显示出来是多少个空格的长度，默认 8
"  shiftwidth 表示每一级缩进的长度，一般设置成跟 softtabstop 一样
set tabstop=4
set shiftwidth=4
nnoremap <silent> st    :set expandtab<CR>

" star dictionary
function! Mydict()
  let expl=system('sdcv -n ' .
        \  expand("<cword>"))
  windo if
        \ expand("%")=="diCt-tmp" |
        \ q!|endif
  25vsp diCt-tmp
  setlocal buftype=nofile bufhidden=hide noswapfile
  1s/^/\=expl/
  1
endfunction
nmap <leader>q  :call Mydict()<CR>

nmap <M-up>  :resize +3<CR>
nmap <M-down>  :resize -3<CR>
nmap <M-left>  :vertical resize -3<CR>
nmap <M-right>  :vertical resize +3<CR>
