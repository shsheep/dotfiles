" autocmd VimEnter * NERDTree | wincmd p
" Close Vim if the only winow left open is a NERDTree.
" autocmd BufEnter * if (winnr("$" == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" let NERDTreeWinSize=20
