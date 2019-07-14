" CONFIGURATION

" MANDATORY OPTIONS
execute pathogen#infect()
set hidden

" EDITOR
set backupdir=~/.vim/.backup//
set dir=~/.vim/.swap//
set undodir=~/.vim/.undo//
set history=1000
set autoread
set nrformats-=octal

" DISPLAY
color dracula
syntax on
set listchars=tab:»\ ,space:·,trail:‼
set number
set relativenumber
set scrolloff=2
set sidescrolloff=5
"set wrap!
set display+=lastline
set visualbell

" INDENTING AND EDITING
set ts=4 sw=4 et
"set ts=2 sw=2 et
set autoindent
set backspace=indent,eol,start
set encoding=utf-8

" SEARCHING
set rtp+=~/.fzf
set ignorecase
set smartcase

" GENERAL KEYBINDINGS
noremap <c-k> <Esc>
noremap! <c-k> <Esc>
noremap! <c-j> <nop>

nnoremap J :bprev<CR>
nnoremap K :bnext<CR>
nnoremap + o<Esc>
nnoremap <c-n> :enew<CR>
noremap <c-u> 15k
noremap <c-d> 15j
noremap <c-b> 30kzz
noremap <c-f> 30jzz

let mapleader = ","
nnoremap <leader>, ,
nnoremap <leader>x :Bw<CR>
nnoremap <leader>j J
nnoremap <leader>k K
nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>? :set list!<CR>
nnoremap <leader>\ :e $MYVIMRC<CR>
nnoremap <leader>e :call Enclose()<CR>
vnoremap <leader>a :'<,'>!column -t<CR>
nnoremap <leader>/ :cw<CR>
nnoremap <leader>c :call RunAsCommand()<CR>
nnoremap <leader>sw :cd ..<CR>:pwd<CR>
nnoremap <leader>se :pwd<CR>
nnoremap <leader>ss :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>sh :cd ~<CR>:pwd<CR>

inoremap <c-a><c-a> <c-a>
inoremap <c-a>b {<CR><Tab><Esc>o}<Esc><<k$a
inoremap <c-a>c <Esc>O/**<CR><Space>*<Space><CR>*/<Esc>k$a
inoremap <s-Tab> <c-d>

nnoremap <Space> <c-w><c-w>
nnoremap <End> <nop>
nnoremap <Home> <nop>
nnoremap <Insert> <nop>
nnoremap <Delete> <nop>

noremap  <Up> <c-w>>
noremap! <Up> <Esc>
noremap  <Down> <c-w><
noremap! <Down> <Esc>
noremap  <S-Up> <c-w>+
noremap! <S-Up> <Esc>
noremap  <S-Down> <c-w>-
noremap! <S-Down> <Esc>

" COMMANDS

command! Rts :call RemoveTrailingSpaces()
command! Rf :call RemoveFunction()
command! Cs :call CheckSyntax()
command! -nargs=+ Find :call Find(<f-args>)
command! Commands :call OpenFileAside("~/.vim/commands")
command! Notes :call OpenFileAside("~/.vim/notes")

"---------"
"-PLUGINS-"
"---------"

" NERDTREE
"autocmd VimEnter * NERDTreeVCS
"autocmd VimEnter * wincmd p
noremap <leader>t :NERDTreeVCS<CR>
noremap <leader>T :NERDTreeFind<CR>

" VDEBUG
let g:vdebug_options = {}
let g:vdebug_options["path_maps"] = {} " todo
let g:vdebug_options["break_on_open"] = 0

" AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = ''
let g:airline_section_x = ''

" FZF
nnoremap <leader>f :FZF --preview head\ -100\ {}<CR>
nnoremap <leader>F :FZF --preview head\ -100\ {} ~<CR>

" CHOOSEWIN
nmap - <Plug>(choosewin)

" TLIST
noremap <leader>y :TlistToggle<CR>

" SMOOTH SCROLL
noremap <silent> <PageUp> :call smooth_scroll#up(&scroll, 8, 1)<CR>
noremap <silent> <PageDown> :call smooth_scroll#down(&scroll, 8, 1)<CR>

" SIMPLE WORKSPACE
let g:simplews_short_commands = 1

"-----------"
"-FUNCTIONS-"
"-----------"

function! Enclose()
    exec "normal lbi" . nr2char(getchar())
    exec "normal ea" . nr2char(getchar())
    echom "Enclosed"
endfunction

function! RemoveTrailingSpaces()
    let line = line(".")
    %s/\s\+$//g
    exec ":" . line
    redraw
    echom 'Trailing spaces removed'
endfunction

function! RemoveFunction()
    execute "normal F(bdf(f)x"
    echom 'Function removed'
endfunction

function! Find(...)
    let phrase = a:1
    let ext = a:0 > 1 ? a:2 : ""
    if len(ext) > 0
        let ext = "." . ext
    endif
    execute "vimgrep /" . phrase . "/ **/*" . ext
    execute "cw"
endfunction

function! CheckSyntax()
    let path = expand("%:p")
    if path =~ "\.php$"
        let command = "php -l "
    elseif path =~ "\.p[ml]$"
        let command = "perl -c "
    else
        echom "Unknown file extension"
        return
    endif
    rightbelow new
    resize -10
    call append(0, system(command . path))
    setlocal modifiable! buftype=nofile buflisted! bufhidden=wipe
    map <buffer> q :q<CR>
    map <buffer> <CR> :q<CR>
endfunction

function! RunAsCommand()
    let line = "!" . getline(".")
    execute line
endfunction

function! OpenFileAside(path)
    execute "rightbelow split " . a:path
    resize -10
    setlocal buflisted! bufhidden=wipe
    map <buffer>q :q<CR>
endfunction
