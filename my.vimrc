"" VIM-PLUG
"" Plugins will be downloaded under the specified directory.
"call plug#begin('~/.vim/plugged')
"
"" Declare the list of plugins.
"
"Plug 'SirVer/ultisnips'
"let g:UltiSnipsExpandTrigger="<Tab>"
"let g:UltiSnipsJumpForwardTrigger="<Tab>"
"let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
"let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetDirectories = ['~/.vim/plugged/ultisnips']
"
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
"Plug 'tpope/vim-fugitive'
"
"" List ends here. Plugins become visible to Vim after this call.
"call plug#end()

set autoindent
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4

set smartcase
set hlsearch

set number
set ruler

"set mouse=a

set syntax=on
set title

iabbr <expr> __pwd expand("%:p:h")
cabbr Q! q!
cabbr q1 q!
cabbr Q1 q!
cabbr vrc ~/.vimrc
imap <F2> <C-N>

" Start Vim at where you lastly worked 
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

"func CmtOn() "Comment on
"	exe "'<,'>norm i//"
"endfunc
"
"func CmtOff() "Comment off
"	exe "'<,'>norm 2x"
"endfunc
" Why not work? => Reason : Vim recognizes <C-/> as <C-_>
" But this function is a litle big poor
" Let's skip this ones
" <leader> means <\>
"vmap <leader>/ <esc>:call CmtOn()<cr> 
"vmap <leader>' <esc>:call CmtOff()<cr>
"nmap <leader>/ <esc>v:call CmtOn()<cr>
"nmap <leader>' <esc>v:call CmtOff()<cr>
" and use the below ones

" Start a long journey of binding shortcut for comment
"TOPIC: Toggling Comment (via functions) 
"FUNCTIONS: for toggle comments 
"FUNCTIONS: set comment's prefix character based on filetype
function! SetCommentPrefix()
    let s:comment_prefix = "#"
    if &filetype == "vim"
        " for vim, inline comment start with \"
        let s:comment_prefix = "\""
    elseif &filetype ==? "c" || &filetype ==? "h" || &filetype ==? "cpp" || &filetype ==? "hpp"
        let s:comment_prefix = "//"
	elseif &filetype ==? "py"
		let s:comment_prefix = "#"
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

	nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>

	nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif
