"-------------------
"- GENERAL OPTIONS -
"-------------------

" EDITOR
function! s:setEditorOptions()
	set hidden
	set backupdir=~/.vim/.backup//
	set dir=~/.vim/.swap//
	set undodir=~/.vim/.undo//
	set history=1000
	set autoread
	set nrformats-=octal
	set tags=.ctags;$HOME
	filetype plugin on
	set sessionoptions-=options
endfunction

function! s:setColorSchemeOptions()
	color gruvbox
	set background=dark
	let g:gruvbox_termcolors=16
	let g:gruvbox_invert_selection=0
endfunction

" DISPLAY
function! s:setDisplayOptions()
	syntax on
	set listchars=tab:»\ ,space:·,trail:‼,nbsp:◦
	set nolist
	set scrolloff=2
	set sidescrolloff=5
	set wrap
	set nohlsearch
	set display+=lastline
	set wildmenu
	set ruler
	au VimEnter * set laststatus=0
	au VimEnter * set showtabline=1
endfunction

" INDENTING AND EDITING
function! s:setEditingOptions()
	set ts=3 sw=3 noet
	set autoindent
	set smarttab
	set backspace=indent,eol,start
	set encoding=utf-8
endfunction

" SEARCHING
function! s:setSerachingOptions()
	set rtp+=~/.fzf
	set ignorecase
	set smartcase
	set incsearch
	set complete-=i
endfunction

"------------
"- KEY MAPS -
"------------

" GENERAL KEYBINDINGS
function! s:setGenericKeyMaps()
	noremap <c-c> <Esc>
	inoremap <c-c> <Esc>

	noremap c "_c
	noremap cc "_S
	noremap C "_C
	noremap s "_s
	noremap S "_S
	noremap x "_x
	noremap X "_X

	nnoremap ' `
	nnoremap ` '
	nnoremap Y y$
	nnoremap <silent> J :bprev<CR>
	vnoremap J <nop>
	nnoremap <silent> K :bnext<CR>
	vnoremap K <nop>
	nnoremap + o<Esc>
	nnoremap - O<Esc>
	noremap <silent> <c-u> @='15k'<CR>
	noremap <silent> <c-d> @='15j'<CR>
	noremap <silent> <c-b> @='30kzz'<CR>
	noremap <silent> <c-f> @='30jzz'<CR>
	noremap <c-e> 5<c-e>
	noremap <c-y> 5<c-y>
endfunction

" LEADER KEY BINDINGS
function! s:setLeaderKeyMaps()
	nnoremap <leader>, ,
	nnoremap <silent> <leader>oo :NERDTree ~/.vim/org<CR>
	nnoremap <silent> <leader>x :Bw<CR>
	nnoremap <silent> <leader>X :Bw!<CR>
	nnoremap <leader>j J
	nnoremap <leader>k K
	vnoremap <leader>j J
	vnoremap <leader>k K
	nnoremap <silent> <leader>h :set hlsearch!<CR>
	nnoremap <silent> <leader>\ :call AvoidNerdTree(":e $MYVIMRC")<CR>
	nnoremap <leader>/ yiw:Ag <c-r><c-o>"<CR>
	vnoremap <leader>/ y:Ag <c-r><c-o>"<CR>
	nnoremap <silent> <leader>> :call RunCommand(getline("."))<CR>
	nnoremap <silent> <leader>i :call SwapIdeMode()<CR>
	nnoremap <leader>sn :cd ..<CR>:pwd<CR>
	nnoremap <leader>sl :pwd<CR>
	nnoremap <leader>ss :cd %:p:h<CR>:pwd<CR>
	nnoremap <silent> <leader>v :call PhpDoc()<CR>
	vnoremap <leader>y "+y
	noremap <leader>p "+p
	noremap <leader>P "+P
	nnoremap <silent> <leader>= :call execute("put =" . getline("."))<CR>

endfunction

" COMMAND MODE BINDINGS
function! s:setCommandModeMaps()
	cnoremap &pp <c-r><c-o>"
	cnoremap &ft set filetype=

	cnoremap &s2 set et ts=2 sw=2<CR>
	cnoremap &s4 set et ts=4 sw=4<CR>
	cnoremap &t3 set noet ts=3 sw=3<CR>
endfunction

" INSERT MODE BINDINGS
function! s:setInsertModeMaps()
	inoremap &<Tab> &
	inoremap &{ <c-g>u{<CR>}<Esc>O<Tab>
	inoremap &;{ <c-g>u{<CR>};<Esc>O<Tab>
	inoremap &,{ <c-g>u{<CR>},<Esc>O<Tab>
	inoremap &[ <c-g>u[<CR>]<Esc>O<Tab>
	inoremap &;[ <c-g>u[<CR>];<Esc>O<Tab>
	inoremap &,[ <c-g>u[<CR>],<Esc>O<Tab>
	inoremap &( <c-g>u(<CR>)<Esc>O<Tab>
	inoremap &;( <c-g>u(<CR>);<Esc>O<Tab>
	inoremap &,( <c-g>u(<CR>),<Esc>O<Tab>

	augroup vimrc_snippets
		autocmd!
		autocmd FileType php inoremap <buffer> &th <c-g>u$this->
		autocmd FileType php inoremap <buffer> &prf <c-g>u<Esc>biprotected function <Esc>A() {<CR>}<Esc>k$F)i
		autocmd FileType php inoremap <buffer> &pf <c-g>u<Esc>bipublic function <Esc>A() {<CR>}<Esc>k$F)i
		autocmd FileType php inoremap <buffer> &prsf <c-g>u<Esc>biprotected static function <Esc>A() {<CR>}<Esc>k$F)i
		autocmd FileType php inoremap <buffer> &psf <c-g>u<Esc>bipublic static function <Esc>A() {<CR>}<Esc>k$F)i
		autocmd FileType php inoremap <buffer> &try <c-g>utry {<CR>}<CR>catch() {<CR>}<Esc>k0f(a

		autocmd FileType perl inoremap <buffer> &se <c-g>u$self->
		autocmd FileType perl inoremap <buffer> &my <c-g>umy () = @_;<Esc>F)i
		autocmd FileType perl inoremap <buffer> &moo <c-g>uhas "" => (<CR>);<Esc>O<Tab>is => "rw",<Esc>k$F"i
		autocmd FileType perl inoremap <buffer> &dd <c-g>uuse Data::Dumper; print Dumper();<Esc>hi
		autocmd FileType perl inoremap <buffer> &try <c-g>utry {<CR>} catch {<CR>};<Esc>kO<Tab>
	augroup END

	inoremap <c-p> <c-n>
	inoremap <c-y> <c-p>
endfunction

" SPECIAL KEY BINDINGS
function! s:setSpecialKeyMaps()
	nnoremap <Space> <c-w><c-w>
	nnoremap go i<CR><Esc>

	noremap  <Up> <c-w>>
	noremap! <Up> <Esc>
	noremap  <Down> <c-w><
	noremap! <Down> <Esc>
endfunction

"------------
"- COMMANDS -
"------------

" COMMANDS
function! s:setCommands()
	command! Cs call CheckSyntax()
	command! W w
	command! Wq wq
endfunction

" AUTOCOMMANDS
function! s:setAutocommands()
	augroup vimrc_autocommands
		autocmd!
		autocmd BufWritePre * call FixTrailingWhitespace()
		autocmd BufWritePre * call FixTrailingNewline()

		" save cursor position
		autocmd BufLeave * call AutoSaveWinView()
		autocmd BufEnter * call AutoRestoreWinView()
	augroup END
endfunction

function! s:loadLocalOptions()
	if filereadable(expand("~/.vim/.vimrc"))
		so ~/.vim/.vimrc
	endif
endfunction

"-----------
"- PLUGINS -
"-----------

function! s:setPluginOptions()

	" NERDTREE
	noremap <silent> <leader>t :NERDTreeVCS<CR>
	noremap <silent> <leader>T :NERDTreeFind<CR>
	let g:NERDTreeMinimalUI = 1

	" VDEBUG
	let g:vdebug_options = {}
	let g:vdebug_options["break_on_open"] = 0

	" AIRLINE
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_section_b = '%{strftime("%H:%M")}'
	let g:airline_section_x = '%{gutentags#statusline()}'

	" GUTENTAGS
	let g:gutentags_ctags_tagfile = ".ctags"
	let g:gutentags_enabled = 0

	" FZF
	nnoremap <leader>ff :call AvoidNerdTree(":Files")<CR>
	nnoremap <leader>ft :call AvoidNerdTree(":Tags")<CR>
	nnoremap <leader>a :call AvoidNerdTree(":BTags")<CR>
	nnoremap <leader>l :call AvoidNerdTree(":Lines")<CR>
	nnoremap <Tab> :call AvoidNerdTree(":Buffers")<CR>
	nnoremap <leader>fm :call AvoidNerdTree(":Marks")<CR>
	nnoremap <leader>fc :call AvoidNerdTree(":Commits")<CR>
	nnoremap <leader>fC :call AvoidNerdTree(":BCommits")<CR>
	nnoremap <leader>fhf :call AvoidNerdTree(":History")<CR>
	nnoremap <leader>c :call AvoidNerdTree(":History:")<CR>
	nnoremap <leader>e :call AvoidNerdTree(":History/")<CR>

	nmap <leader><tab> <plug>(fzf-maps-n)
	imap <c-f> <plug>(fzf-complete-line)

	command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, "--skip-vcs-ignores", <bang>0)

	" ESEARCH
	let g:esearch = {
		\"adapter": "ag",
		\"backend": "vim8",
		\"out": "win",
		\"batch_size": 500,
		\"use": ["visual"],
		\"default_mappings": 1,
	\}
	call esearch#map("<leader>fr", "esearch")

	" SMART WORD
	map <leader>w  <Plug>(smartword-w)
	map <leader>b  <Plug>(smartword-b)

	" SIMPLE WORKSPACE
	let g:simplews_short_commands = 0

	" COMMENTARY
	nmap Q gcc
	vmap Q gc

	" JSONVIEWER
	command! Jv call jsonviewer#init()

endfunction

"--------------------
"- HELPER FUNCTIONS -
"--------------------

function! RunCommand(command)
	rightbelow new
	resize -10
	call append(0, split(system(a:command), "\n"))
	setlocal nomodifiable buftype=nofile nobuflisted bufhidden=wipe
	map <silent> <buffer> q :q<CR>
	map <silent> <buffer> <CR> :q<CR>
endfunction

function! CheckSyntax()
	let path = expand("%:p")
	let commands = {
		\"php": "php -l",
		\"perl": "perl -c",
	\}
	let command = get(commands, &filetype, "")
	if !strlen(command)
		echom "Unknown filetype"
		return
	endif
	call RunCommand(command . " " . path)
endfunction

function! FixTrailingWhitespace()
	let view = winsaveview()
	%s/\s\+$//ge
	call winrestview(view)
endfunction

function! FixTrailingNewline()
	let lastline = line("$")
	let curline = lastline
	while curline > 0 && foldlevel(curline) == 0 && getline(curline) =~ '^\s*$'
		let curline -= 1
	endwhile
	let curline += 2
	if curline <= lastline
		let view = winsaveview()
		execute curline . "," . lastline . "delete _"
		call winrestview(view)
	endif
endfunction

function! AvoidNerdTree(comm)
	if exists("b:NERDTree")
		execute "normal \<c-w>w"
	endif
	execute a:comm
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

function! SwapIdeMode()
	if exists("g:ide_mode") && g:ide_mode
		let g:ide_mode = 0
		windo set nonumber
		windo set norelativenumber
		windo set nolist
		set showtabline=1
		set laststatus=0
		let g:gutentags_enabled = 0
	else
		let g:ide_mode = 1
		windo set number
		windo set relativenumber
		windo set list
		set showtabline=1
		set laststatus=2
		let g:gutentags_enabled = 1
	endif
endfunction

"-----------------
"- CONFIGURATION -
"-----------------

execute pathogen#infect()
let mapleader = ","

call s:setEditorOptions()
call s:setColorSchemeOptions()
call s:setDisplayOptions()
call s:setEditingOptions()
call s:setSerachingOptions()

call s:setGenericKeyMaps()
call s:setLeaderKeyMaps()
call s:setCommandModeMaps()
call s:setInsertModeMaps()
call s:setSpecialKeyMaps()

call s:setCommands()
call s:setAutocommands()

call s:setPluginOptions()
call s:loadLocalOptions()

