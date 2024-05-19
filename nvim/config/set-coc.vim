nmap <F3> :CocCommand explorer --sources=buffer+,file+ --width=25<CR>
imap <F3> <ESC><F3>i
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" inoremap <expr> <CR> coc#pum#visible() ? coc#_select_confirm() : \<CR>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm() : ""\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" autocmd VimEnter * CocCommand explorer --sources=buffer+,file+ --width=25 | wincmd p
" 유일한 버퍼가 coc-explorer 라면 종료한다.
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
