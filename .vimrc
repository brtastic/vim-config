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
set scrolloff=1
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
let mapleader = ","
nnoremap J :bprev<CR>
nnoremap K :bnext<CR>
nnoremap + o<Esc>
nnoremap <leader>, ,
nnoremap <leader>Q :Bw<CR>
nnoremap <leader>j J
nnoremap <leader>k K
nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>? :set list!<CR>
nnoremap <leader>\ :e $MYVIMRC<CR>
noremap <c-k> <Esc>
noremap! <c-k> <Esc>
nnoremap <Space> <c-w><c-w>
inoremap <s-Tab> <c-d>
nnoremap <PageUp> :cd ..<CR>:pwd<CR>
nnoremap <PageDown> :pwd<CR>
nnoremap <End> :cd %:p:h<CR>:pwd<CR>
nnoremap <Home> :cd ~<CR>:pwd<CR>
nnoremap <Insert> :call Enclose()<CR>
nnoremap <Delete> F(bdf(f)x:echom 'Function removed'<CR>

inoremap <c-a><c-a> <c-a>
inoremap <c-a>b {<CR><Tab><Esc>o}<Esc><<k$a
inoremap <c-a>c <Esc>O/**<CR><Space>*<Space><CR>*/<Esc>k$a

noremap  <Up> <c-w>+
noremap! <Up> <Esc>
noremap  <Down> <c-w>-
noremap! <Down> <Esc>
noremap  <Left> <c-w><
noremap! <Left> <Esc>
noremap  <Right> <c-w>>
noremap! <Right> <Esc>

" COMMANDS

command! Rts :call RemoveTrailingSpaces()

"---------"
"-PLUGINS-"
"---------"

" NERDTREE
"autocmd VimEnter * NERDTreeVCS
"autocmd VimEnter * wincmd p
noremap <leader>t :NERDTreeVCS<CR>
noremap <leader>T :NERDTreeFind<CR>

" VDEBUG
let g:vdebug_options = {"path_maps": {"/var/www/html": "/home/bartosz/dox/drupal"}}

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
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 3)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 3)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 5)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 5)<CR>

" SIMPLE WORKSPACE
let g:simplews_short_commands = 1

"-----------"
"-FUNCTIONS-"
"-----------"

function! Enclose()
    let char1 = nr2char(getchar())
    exec "normal lbi" . char1
    let char2 = nr2char(getchar())
    exec "normal ea" . char2
    echom "Enclosed!"
endfunction

function! RemoveTrailingSpaces()
    let line = line(".")
    %s/\s\+$//g
    exec ":" . line
    redraw
    echom 'Trailing spaces removed'
endfunction
