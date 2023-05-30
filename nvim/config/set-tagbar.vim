autocmd VimEnter * Tagbar

let g:tagbar_sort = 0
let g:tagbar_width = 22

nmap <F5> :Tagbar<CR>:Tagbar<CR>
imap <F5> <ESC><F5>i
