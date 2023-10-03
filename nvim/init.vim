let g:config_dir = expand('~/.nvim/config/')
let s:file_plug_candidate = []

command! -nargs=1 PlugFile call <SID>plug_file(<args>)
function! s:plug_file( ... )
    call add(s:file_plug_candidate, g:config_dir . a:1)
endfunction

call plug#begin('~/.nvim/plugged')

PlugFile 'set-plugfile.vim'

Plug 'fatih/molokai'
" let g:molokai_original = 1

Plug 'morhetz/gruvbox'

Plug 'SirVer/ultisnips'
    PlugFile 'set-ultisnips.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
    PlugFile 'set-coc.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Plug 'preservim/nerdtree'
    " PlugFile 'set-nerdtree.vim'

" let Tlist_Use_Right_Window=1
" let Tlist_Exit_OnlyWindow=1
" let Tlist_Auto_Open=1
" let Tlist_WinWidth=25

Plug 'preservim/tagbar'
    PlugFile 'set-tagbar.vim'

" Diminactive
Plug 'blueyed/vim-diminactive'
hi ColorColumn ctermbg=0 guibg=#eee8d5
let g:diminactive_use_syntax=0
" autocmd VimEnter * DimInactiveColorcolumnOn " Not work, why?

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    PlugFile 'set-vimgo.vim'

Plug 'mhinz/vim-startify'

Plug 'vimwiki/vimwiki', {'branch': 'dev'}
    PlugFile 'set-vimwiki.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

Plug 'tpope/vim-repeat'

Plug 'AndrewRadev/splitjoin.vim'

Plug 'MunifTanjim/nui.nvim'

Plug 'xeluxee/competitest.nvim'
    PlugFile 'set-competitest.vim'

Plug 'nvim-colortils/colortils.nvim'

Plug 'rust-lang/rust.vim'
syntax enable
filetype plugin indent on

Plug 'sotte/presenting.vim'

Plug 'airblade/vim-gitgutter'

" Plug 'bling/vim-bufferline'

Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'folke/neodev.nvim'
    PlugFile 'set-nvim-dap.vim'

Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown' 

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


for include_file in s:file_plug_candidate
    execute "source " . include_file
endfor
let s:file_plug_candidate = v:null

let g:vim_markdown_folding_disabled = 1
colorscheme molokai
" colorscheme gruvbox

" Settings for Rust
autocmd FileType rust nmap <leader>R :RustRun<CR>

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
autocmd FileType cpp set equalprg=clang-format\ -style=file
autocmd FileType python set colorcolumn=80
autocmd FileType vim set colorcolumn=80

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
cabbr W w
cabbr Wq wq
cabbr WQ wq
cabbr vrc ~/.config/nvim/init.vim
cabbr vvrc vi ~/.config/nvim/init.vim

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
iabbr TRue True
iabbr TUre True
iabbr Ture True
iabbr ture true
iabbr THis This
iabbr tiem time
iabbr Tiem Time
iabbr TIme Time

nmap <F4> :q<CR>
nmap <silent> <PageUp> :bn<CR>
nmap <silent> <PageDown> :bp<CR>
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

inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-l> <Del>
inoremap <C-d> <Del>
" inoremap <C-g> <C-Left> " Why is it so slow?

" Vim command mode arrow, backspace, delete, home, end mappings
cnoremap <C-a> <Home>
cnoremap <C-j> <Left>
cnoremap <C-k> <Right>
cnoremap <C-l> <Del>
cnoremap <C-g> <C-Left>
cnoremap <C-;> <C-Right>

" Start Nvim at where you lastly worked
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "norm g'\"" | endif

" Recognize Pro*C file as C file to use Taglist and syntax highlight
" without changing /usr/share/vim/filetype.vim
" au BufRead *.pc set filetype=c " I hate Pro*C

" TOPIC: Toggling Comment via functions
" FUNCTIONS: for toggle comments 
" FUNCTIONS: set comment's prefix character based on filetype
function! SetCommentPrefix()
    let s:comment_prefix = "# "
    if &filetype == "vim"
        let s:comment_prefix = "\" "
    elseif &filetype ==? "c"
               \ || &filetype ==? "h"
               \ || &filetype ==? "cpp"
               \ || &filetype ==? "hpp"
               \ || &filetype ==? "go"
               \ || &filetype ==? "rust"
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

" MAPPING: maps for comment toggling
" Vim recognizes <C-/> as <C-_>
inoremap <C-/> <ESC>:call ToggleCommentLine()<CR>i
nnoremap <C-/> :call ToggleCommentLine()<CR>
vnoremap <C-/> <ESC> :call ToggleCommentRange()<CR>
inoremap <C-_> <ESC>:call ToggleCommentLine()<CR>i
nnoremap <C-_> :call ToggleCommentLine()<CR>
vnoremap <C-_> <ESC> :call ToggleCommentRange()<CR>
