syntax on
" VIM-PLUG
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/Workspace/dotfiles/snippets']


Plug 'neoclide/coc.nvim', {'branch': 'release'}
nmap <F3> :CocCommand explorer --sources=buffer+,file+ --width=25<CR>
imap <F3> <ESC><F3>i
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

Plug 'preservim/nerdtree'
" Open NERDTree whenever starts Vim.
" autocmd VimEnter * NERDTree | wincmd p
" Close Vim if the only window left open is a NERDTree.
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeWinSize=25

" Plug 'yegappan/taglist'
" let Tlist_Use_Right_Window=1
" let Tlist_Exit_OnlyWindow=1
" let Tlist_Auto_Open=1
" let Tlist_WinWidth=25

Plug 'preservim/tagbar'
autocmd VimEnter * Tagbar
let g:tagbar_sort = 0
let g:tagbar_width = 22
let g:tagbar_ctags_bin = '/opt/homebrew/bin/ctags'
let g:Tlist_Ctags_Cmd = '/opt/homebrew/bin/ctags'
nmap <F5> :Tagbar<CR>
imap <F5> <ESC><F5>i

" Diminactive
Plug 'blueyed/vim-diminactive'
hi ColorColumn  ctermbg=0 guibg=#eee8d5
let g:diminactive_use_syntax=0

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-repeat'

Plug 'airblade/vim-gitgutter'

Plug 'puremourning/vimspector'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'mhinz/vim-startify'

Plug 'vimwiki/vimwiki', {'branch': 'dev'}
"1번 위키(공개용)와 2번 위키(개인용)
let g:vimwiki_list = [
\{
\   'path': '~/Workspace/shsheep.github.io/_wiki',
\   'ext' : '.md',
\   'diary_rel_path': '.',
\},
\{
\   'path': '~/Workspace/shsheepwiki/_wiki',
\   'ext' : '.md',
\   'diary_rel_path': '.',
\},
\{
\   'path': '~/shsheep/Diary/wiki',
\   'ext' : '.md',
\   'diary_rel_path': '.',
\}
\]

let g:vimwiki_conceallevel = 0
let maplocalleader = "\\"

autocmd BufRead,BufNewFile *.md call NewTemplate()
" 자주 사용하는 vimwiki 명령어에 단축키를 취향대로 매핑해둔다
command! WikiIndex :VimwikiIndex
nmap <LocalLeader>ww <Plug>VimwikiIndex
nmap <LocalLeader>wi <Plug>VimwikiDiaryIndex
nmap <LocalLeader>w<LocalLeader>w <Plug>VimwikiMakeDiaryNote
nmap <LocalLeader>wt :VimwikiTable<CR>
" let g:vimwiki_key_mappings = { 'all_maps': 0, }

let g:md_modify_disabled = 0
function! LastModified()
    if g:md_modify_disabled
        return
    endif
    if &modified
        echo('markdown updated time modified')
        let save_cursor = getpos(".")
        let n = min([10, line("$")])
        keepjumps exe '1,' . n . 's#^\(.\{,10}updated\s*: \).*#\1' .
                    \ strftime('%Y-%m-%d %H:%M:%S +0900') . '#e'
        call histdel('search', -1)
        call setpos('.', save_cursor)
    endif
endfun
function! NewTemplate()
    let l:wiki_directory = v:false

    for wiki in g:vimwiki_list
        if expand('%:p:h') =~ expand(wiki.path)
            let l:wiki_directory = v:true
            break
        endif
    endfor

    if !l:wiki_directory
        return
    endif

    if line("$") > 1
        return
    endif

    let l:template = []
    call add(l:template, '---')
    call add(l:template, 'layout  : wiki')
    call add(l:template, 'title   : ')
    call add(l:template, 'summary : ')
    call add(l:template, 'date    : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'updated : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'tag     : ')
    call add(l:template, 'toc     : true')
    call add(l:template, 'public  : true')
    call add(l:template, 'parent  : ')
    call add(l:template, 'latex   : false')
    call add(l:template, 'resource: ' . substitute(system("uuidgen"), '\n', '', ''))
    call add(l:template, '---')
    call add(l:template, '* TOC')
    call add(l:template, '{:toc}')
    call add(l:template, '')
    call add(l:template, '# ')
    call setline(1, l:template)
    execute 'normal! G'
    execute 'normal! $'

    echom 'new wiki page has created'
endfunction

augroup vimwikiauto
    autocmd BufWritePre *wiki/*.md call LastModified()
    autocmd BufRead,BufNewFile *wiki/*.md call NewTemplate()
augroup END

Plug 'fatih/molokai'
Plug 'morhetz/gruvbox'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/linediff.vim'
Plug 'rust-lang/rust.vim'

Plug 'Shougo/echodoc.vim'
let g:echodoc#type = "echo" " Default value
" To use echodoc, you must increase 'cmdheight' value.
set cmdheight=2
let g:echodoc_enable_at_startup = 1

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

colorscheme molokai

let g:termdebug_wide = 1

set nocompatible
set backspace=indent,eol,start
set path+=**
set wildmenu
set autoindent
set smartindent
set smarttab
set tabstop=4
set expandtab
set shiftwidth=4
set smartcase
set ignorecase
set hlsearch
set number
set ruler
set mouse=a
set syntax=on
set title
set ut=500
set relativenumber
set clipboard=unnamed
set encoding=utf-8

autocmd FileType c set colorcolumn=80
autocmd FileType cpp set colorcolumn=80
autocmd FileType cpp set equalprg=clang-format\ -style=file
autocmd FileType python set colorcolumn=80
autocmd FileType vim set colorcolumn=80

cabbr csf cs find
cabbr Csf cs find
cabbr CSf cs find
cabbr CSF cs find
cabbr CS cs
cabbr Cs cs
cabbr Lw w
cabbr LW w
cabbr Noh noh
cabbr NOh noh
cabbr Q q
cabbr Q! q!
cabbr Q1 q!
cabbr q1 q!
cabbr Qa qa
cabbr QA qa
cabbr Qa! qa!
cabbr QA! qa!
cabbr Qa1 qa!
cabbr QA1 qa!
cabbr qa1 qa!
cabbr qA! qa!
cabbr qA1 qa!
cabbr Vs vs
cabbr VS vs
cabbr Set set
cabbr SEt set
cabbr Sp sp
cabbr SP sp
cabbr Sh sh
cabbr SH sh
cabbr W w
cabbr Wq wq
cabbr WQ wq
cabbr vrc ~/.vimrc
cabbr vvrc vi ~/.vimrc

iabbr <expr> __pwd expand("%:p:h")
iabbr <expr> __time strftime("%Y-%m-%d %H:%M:%S")
iabbr <expr> __date strftime("%Y-%m-%d")
iabbr <expr> __file expand('%:p')
iabbr <expr> __name expand('%')

" Typical typo
iabbr calss class
iabbr Calss Class
iabbr clinet client
iabbr Clinet client
iabbr evnet event
iabbr Evnet Evnet
iabbr FAlse False
iabbr flase false
iabbr FLase False
iabbr initalize initialize
iabbr Initalize Initialize
iabbr instnace instance
iabbr Instnace Instance
iabbr pInstnace pInstance
iabbr subejct subject
iabbr SUbject Subject
iabbr SUBject Subject
iabbr THis This
iabbr tiem time
iabbr Tiem Time
iabbr TIme Time
iabbr ture true
iabbr TRue True
iabbr Ture True
iabbr TUre True
" TODO
iabbr :W <ESC>:w<CR>
iabbr :w <ESC>:w<CR>

nmap <F4> :q<CR>
" nmap <F5> :TlistUpdateOn<CR>
" imap <F5> <ESC><F5>i
nmap <F6> :UltiSnipsEdit<CR>i
imap <F6> <ESC><F6>i
nmap <F9> ko{<ESC>jo}<ESC>
imap <F9> <ESC><F9>i
nmap <PageUp> :bn<CR>
nmap <PageDown> :bp<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap ciq ci'
nmap ciQ ci"
nmap csq cs'
nmap csQ cs"
nmap dsq ds'
nmap dsQ ds"
nmap viq vi'
nmap viQ vi"
nmap ysiwq ysiw'
nmap ysiwQ ysiw"
nmap ysiWQ ysiW"
vmap SQ S"
vmap Sq S'
nmap -G :noh<CR>

inoremap <C-j> <Left>
inoremap <C-k> <Right>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-l> <Del>
inoremap <C-d> <Del>
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

cnoremap <C-a> <Home>
cnoremap <C-j> <Left>
cnoremap <C-k> <Right>
cnoremap <C-l> <Del>
cnoremap <C-g> <C-Left>
cnoremap <C-;> <C-Right>

" vim-go
let g:go_code_completion_enable = 1
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
autocmd FileType go nmap <C-\>d :GoDoc<CR>
autocmd FileType go nmap gi :GoInfo<CR>
autocmd FileType go nmap gn :GoRename<CR>
autocmd FileType go nmap gr :GoReferrers<CR>
autocmd FileType go nmap <leader>B :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>R <Plug>(go-run)
autocmd FileType go set colorcolumn=80

" Settings for Python
autocmd FileType python nmap gd <Plug>(coc-definition)
" nmap <Leader>gr <Plug>(coc-references)
autocmd FileType python nmap gr <Plug>(coc-references-used)
autocmd FileType python nmap gn <Plug>(coc-rename)
" <Plug>(coc-references-used)
" coc-callHierarchy CocAction('showIncomingCalls')
"
" vimspector
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>
nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>
nmap <Leader>dk <Plug>VimspectorRestart
nnoremap <F7> :call vimspector#Launch()<CR>
nnoremap <F8> :call vimspector#ToggleBreakpoint()<CR>
nnoremap <F9> <Plug>VimspectorStepOver
nnoremap <F10> <Plug>VimspectorStepInto
nnoremap <F11> <Plug>VimspectorStepOut

" fzf-vim
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fr :Rg<CR>

" Start Vim at where you lastly worked 
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "norm g`\"" | endif

" Recognize Pro*C file as C file to use Taglist and syntax highlight without
" changing /usr/share/vim/vim80/filetype.vim
au BufRead *.pc set filetype=c

" TOPIC: Toggling Comment (via functions) 
" FUNCTIONS: for toggle comments 
" FUNCTIONS: set comment's prefix character based on filetype
function! SetCommentPrefix()
    let s:comment_prefix = "# "
    if &filetype == "vim"
        " for vim, inline comment start with \"
        let s:comment_prefix = "\" "
    elseif &filetype ==? "c"
               \ || &filetype ==? "h"
               \ || &filetype ==? "cpp"
               \ || &filetype ==? "hpp"
               \ || &filetype ==? "go"
               \ || &filetype ==? "rust"
               \ || &filetype ==? "javascript"
        let s:comment_prefix = "// "
	elseif &filetype ==? "py"
		let s:comment_prefix = "# "
    endif
endfunction

"FUNCTION: Make given line into Comment
function! CommentLine(line_number)
    call SetCommentPrefix()
    " remember current cursor position
    let cpos = getpos(".")
    " move to seletced line
    call setpos(".", [0, a:line_number, 0, 0])
    " just insert comment prefix character at the front of given line
    exec "normal! I".s:comment_prefix
     "restore cursor position
    call setpos(".", cpos)
endfunction

"FUNCTION: Uncomment given line
function! UncommentLine(line_number)
    call SetCommentPrefix()
    " remember current cursor position
    let cpos = getpos(".")
    "move to selected line
    call setpos(".", [0, a:line_number, 0, 0])
    " remove comment prefix charactor
    " !!! use escape() for some languages's prefix eg. C=> "//"
    exec ".s/".escape(s:comment_prefix, s:comment_prefix[0])."//"
    " restore cursor position
    call setpos(".", cpos)
endfunction

"FUNCTION: Check given line number if the line is comment
"ARGS: line_number
"RETURN: 1: the line is comment, 0: the line is not comment
function! CheckIsComment(line_number)
    " check the line for given line number is comment
    let sl = getline(a:line_number)
    let c = 0
    while c < strlen(sl)
        let d = c + strlen(s:comment_prefix) - 1
        " sl[c] is space or tabe?
        if  " \t" =~ sl[c]
            " ignore indentation
            " pass
        elseif sl[(c):(d)] == s:comment_prefix
            return 1
        else
            return 0
        endif
        let c += 1
    endwhile
    return 0
endfunction

"FUNCTION: Toogle line comment
function! ToggleCommentLine()
    call SetCommentPrefix()
    let cl = line(".")
    if CheckIsComment(cl)
        call UncommentLine(cl)
    else
        call CommentLine(cl)
    endif
endfunction

"FUNCTION: Toggle Range comment
function! ToggleCommentRange()
    call SetCommentPrefix()
    let line_begin = line("'<")
    let line_end = line("'>")
    " decide mode with first line in selection
    let mode_ = CheckIsComment(line_begin)
    let cpos = getpos(".")
    let i = line_begin
    while i < line_end + 1
        if mode_
            call UncommentLine(i)
        else
            call CommentLine(i)
        endif
        let i+=1
    endwhile
endfunction

"MAPPING: maps for comment toggling
"-----------------------------------
"Vim recognizes <C-/> as <C-_>
inoremap <C-_> <ESC>:call ToggleCommentLine()<cr>i
nnoremap <C-_> :call ToggleCommentLine()<cr>
vnoremap <C-_> <ESC> :call ToggleCommentRange()<cr>
" Long journey of binding shortcut for comment ENDs

if has("cscope")
	set cscopetag
	set csto=0
	if filereadable("cscope.out")
		cs add cscope.out
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set cscopeverbose

	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-\>d :cs find d ^<C-R>=expand("<cword>")<CR><CR>

	nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-@>d :cs find d ^<C-R>=expand("<cword>")<CR><CR>

	nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif
