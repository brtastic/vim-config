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
set tags=.ctags
filetype plugin on
if v:version >= 700
	autocmd BufLeave * call AutoSaveWinView()
	autocmd BufEnter * call AutoRestoreWinView()
endif

" DISPLAY
color gruvbox
set background=dark
syntax on
set listchars=tab:»\ ,space:·,trail:‼
set list
set number
set relativenumber
set scrolloff=2
set sidescrolloff=5
"set wrap!
set display+=lastline
set visualbell
set termsize=10x0

" INDENTING AND EDITING
set ts=3 sw=3 noet
"set ts=4 sw=4 et
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
vnoremap J <nop>
nnoremap K :bnext<CR>
vnoremap K <nop>
nnoremap + o<Esc>
nnoremap - O<Esc>
nnoremap Q :rightbelow term<CR>
noremap <silent> <c-u> @='15k'<CR>
noremap <silent> <c-d> @='15j'<CR>
noremap <silent> <c-b> @='30kzz'<CR>
noremap <silent> <c-f> @='30jzz'<CR>

let mapleader = ","
nnoremap <leader>, ,
nnoremap <leader>x :Bw<CR>
nnoremap <leader>j J
vnoremap <leader>j J
nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>? :set list!<CR>
nnoremap <leader>\ :e $MYVIMRC<CR>
nnoremap <leader>r :call Enclose()<CR>
vnoremap <leader>a :'<,'>!column -t<CR>
nnoremap <leader>/ :cw<CR>
nnoremap <leader>c :call RunAsCommand()<CR>
nnoremap <leader>sw :cd ..<CR>:pwd<CR>
nnoremap <leader>se :pwd<CR>
nnoremap <leader>ss :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>sh :cd ~<CR>:pwd<CR>
nnoremap <leader>p :call PhpDoc()<CR>
nnoremap <leader>] :call LoadLanguageTags()<CR>

inoremap <c-a><c-a> <c-a>
inoremap <c-a>{ {<CR>}<Esc>O<Tab>
inoremap <c-a>[ [<CR>]<Esc>O<Tab>
inoremap <c-a>( (<CR>)<Esc>O<Tab>
inoremap <s-Tab> <c-d>

nnoremap <Space> <c-w><c-w>
tnoremap <c-k> <c-w>N
tnoremap <c-e> <c-w>Niexit<CR><c-w>N:q<CR>
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
command! Commands :call OpenFileAside("~/.vim/commands")
command! Notes :call OpenFileAside("~/.vim/notes")
command! W :w

"---------"
"-PLUGINS-"
"---------"

" NERDTREE
"autocmd VimEnter * NERDTreeVCS
"autocmd VimEnter * wincmd p
noremap <leader>t :NERDTreeVCS<CR>
noremap <leader>T :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1

" VDEBUG
let g:vdebug_options = {}
let g:vdebug_options["path_maps"] = {} " todo
let g:vdebug_options["break_on_open"] = 0

" AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_section_b = ''
let g:airline_section_x = ''

" GUTENTAGS
let g:gutentags_ctags_tagfile = ".ctags"

" FZF
nnoremap <leader>f :FZF --preview head\ -100\ {}<CR>
nnoremap <leader>F :FZF --preview head\ -100\ {} ~<CR>
nnoremap <leader>g :Tags<CR>
nnoremap <leader>G :Lines<CR>

" TAGBAR
noremap <leader>y :TagbarToggle<CR>
let g:tagbar_map_showproto = "r"
let g:tagbar_map_jump = "o"
let g:tagbar_map_togglefold = "za"
let g:tagbar_compact = 1

" ACK
let g:ackprg = 'ag --vimgrep'

" SMART WORD
map <leader>w  <Plug>(smartword-w)
map <leader>b  <Plug>(smartword-b)
map <leader>e  <Plug>(smartword-e)
map <leader>ge  <Plug>(smartword-ge)

" SIMPLE WORKSPACE
let g:simplews_short_commands = 0

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
	execute "normal \"zyi)da)bdw\"zP"
	echom 'Function removed'
endfunction

function! CheckSyntax()
	let path = expand("%:p")
	if &filetype ==# "php"
		let command = "php -l "
	elseif &filetype ==# "perl"
		let command = "perl -c "
	else
		echom "Unknown filetype"
		return
	endif
	rightbelow new
	resize -10
	call append(0, system(command . path))
	setlocal modifiable! buftype=nofile buflisted! bufhidden=wipe
	map <buffer> q :q<CR>
	map <buffer> <CR> :q<CR>
endfunction

function! LoadLanguageTags()
	let file_location = "~/.vim/tags/" . &filetype
	execute "set tags+=" . file_location
endfunction

function! RunAsCommand()
	let line = "!" . getline(".")
	execute line
endfunction

function! OpenFileAside(path)
	execute "rightbelow split " . a:path
	resize -10
	set buftype=nofile
	setlocal buflisted! bufhidden=wipe
	map <buffer>q :set buftype=<CR>:wq<CR>
endfunction

function! AutoSaveWinView()
	if !exists("w:SavedBufView")
		let w:SavedBufView = {}
	endif
	let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

function! AutoRestoreWinView()
	let buf = bufnr("%")
	if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
		let v = winsaveview()
		let atStartOfFile = v.lnum == 1 && v.col == 0
		if atStartOfFile && !&diff
			call winrestview(w:SavedBufView[buf])
		endif
		unlet w:SavedBufView[buf]
	endif
endfunction
