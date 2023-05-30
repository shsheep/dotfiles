let g:go_code_completion_enable = 0
function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction

" Settings for Go 
autocmd FileType go nmap ]c :cnext<CR>
autocmd FileType go nmap [c :cprev<CR>

" autocmd FileType go nmap <leader>B <Plug>(go-build)
" autocmd FileType go nmap <leader>d :GoDoc<CR>
" autocmd FileType go nmap <leader>i :GoInfo<CR>
" autocmd FileType go nmap vgd :vs<CR>gd
" autocmd FileType go nmap hgd :sp<CR>gd
autocmd FileType go nmap <C-\>d :GoDoc<CR>
autocmd FileType go nmap gi :GoInfo<CR>
autocmd FileType go nmap gr :GoReferrers<CR>
autocmd FileType go nmap <leader>B :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>R <Plug>(go-run)
autocmd FileType go set colorcolumn=80
