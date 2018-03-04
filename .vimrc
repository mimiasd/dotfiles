" This is the personal .vimrc file of mimiasd.
" 
" Inspired by spf13-vim, amix/vimrc and space-vim.

" 一些vim常规的配置
" Use general config if available {
    if filereadable(expand("~/.vimrc.general"))
        source ~/.vimrc.general
    endif
" }

" vim 各个插件的配置
" Use bundles config if available {
    if filereadable(expand("~/.vimrc.bundles"))
        source ~/.vimrc.bundles
    endif
" }
