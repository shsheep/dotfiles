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

Plug 'preservim/nerdtree'
" Open NERDTree whenever starts Vim.
autocmd VimEnter * NERDTree | wincmd p
" Close Vim if the only window left open is a NERDTree.
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeWinSize=25

let Tlist_Use_Right_Window=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Auto_Open=1
let Tlist_WinWidth=25

" Diminactive
Plug 'blueyed/vim-diminactive'
hi ColorColumn  ctermbg=0 guibg=#eee8d5
let g:diminactive_use_syntax=0
autocmd VimEnter * DimInactiveColorcolumnOn

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'airblade/vim-gitgutter'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

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

autocmd FileType c set colorcolumn=80
autocmd FileType cpp set colorcolumn=80
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

" Typical typo
iabbr calss class
iabbr Calss Class
iabbr clinet client
iabbr Clinet client
iabbr evnet event
iabbr Evnet Evnet
iabbr FAlse False
iabbr flase False
iabbr FLase False
iabbr initalize initialize
iabbr Initalize Initialize
iabbr instnace instance
iabbr Instnace Instance
iabbr pInstnace pInstance
iabbr subejct subject
iabbr SUbject Subject
iabbr SUBject Subject
iabbr TRue True
iabbr ture true
iabbr Ture True
iabbr TUre True
iabbr THis This
iabbr tiem time
iabbr Tiem Time
iabbr TIme Time
" TODO
iabbr :W <ESC>:w<CR>
iabbr :w <ESC>:w<CR>

nmap <F4> :q<CR>
nmap <F5> :TlistUpdateOn<CR>
imap <F5> <ESC><F5>i
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
nmap -G :noh<CR>

inoremap <C-j> <Left>
inoremap <C-k> <Right>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-l> <Del>
inoremap <C-d> <Del>
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

iabbr <expr> __pwd expand("%:p:h")
iabbr <expr> __time strftime("%Y-%m-%d %H:%M:%S")
iabbr <expr> __date strftime("%Y-%m-%d")
iabbr <expr> __file expand('%:p')
iabbr <expr> __name expand('%')

" Start Vim at where you lastly worked 
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "norm g`\"" | endif

" Recognize Pro*C file as C file to use Taglist and syntax highlight without
" changing /usr/share/vim/vim80/filetype.vim
au BufRead *.pc set filetype=c

" TOPIC: Toggling Comment (via functions) 
" FUNCTIONS: for toggle comments 
" FUNCTIONS: set comment's prefix character based on filetype
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
