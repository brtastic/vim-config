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

" DISPLAY
function! s:setDisplayOptions()
	color gruvbox
	set background=dark
	syntax on
	set listchars=tab:»\ ,space:·,trail:‼,nbsp:◦
	set list
	set number
	set relativenumber
	set scrolloff=2
	set sidescrolloff=5
	"set wrap!
	set display+=lastline
	set visualbell
	set termsize=20x0
	set wildmenu
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
	noremap! <c-c> <Esc>

	noremap c "_c
	noremap cc "_S
	noremap C "_C
	noremap s "_s
	noremap S "_S
	noremap x "_x
	noremap X "_X

	nnoremap Y y$
	nnoremap <silent> J :bprev<CR>
	vnoremap J <nop>
	nnoremap <silent> K :bnext<CR>
	vnoremap K <nop>
	nnoremap + o<Esc>
	nnoremap - O<Esc>
	nnoremap Q :put =
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
	nnoremap <silent> <leader>op :call OpenFileAside("~/.vim/notes.vorg")<CR>
	nnoremap <silent> <leader>q :rightbelow term<CR>
	nnoremap <silent> <leader>x :Bw<CR>
	nnoremap <silent> <leader>X :Bw!<CR>
	nnoremap <leader>j J
	nnoremap <leader>k K
	vnoremap <leader>j J
	vnoremap <leader>k K
	nnoremap <silent> <leader>h :set hlsearch!<CR>
	nnoremap <silent> <leader>\ :e $MYVIMRC<CR>
	nnoremap <leader>r :call Enclose()<CR>
	nnoremap <silent> <leader>= :call TabularizeCursor()<CR>
	nnoremap <leader>/ yiw:Ag <c-r><c-o>"<CR>
	vnoremap <leader>/ y:Ag <c-r><c-o>"<CR>
	nnoremap <silent> <leader>c :call RunCommand(getline("."))<CR>
	nnoremap <leader>sn :cd ..<CR>:pwd<CR>
	nnoremap <leader>sl :pwd<CR>
	nnoremap <leader>ss :cd %:p:h<CR>:pwd<CR>
	nnoremap <leader>sh :cd ~<CR>:pwd<CR>
	nnoremap <silent> <leader>p :call PhpDoc()<CR>
	nnoremap <silent> <leader>? :call LoadLanguageTags()<CR>
	vnoremap <leader>vz "+y
	noremap <leader>vv "+p
	noremap <leader>vV "+P
endfunction

" COMMAND MODE BINDINGS
function! s:setCommandModeMaps()
	cnoremap &br BreakpointR *<CR>
	cnoremap &pp <c-r><c-o>"
	cnoremap &ft set filetype=
	cnoremap &/ Ack! ""<left>

	cnoremap &s2 set et ts=2 sw=2<CR>
	cnoremap &s4 set et ts=4 sw=4<CR>
	cnoremap &t3 set et ts=3 sw=3<CR>
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

		autocmd FileType html inoremap <buffer> &tag <c-g>u<Esc>byei<<Esc>ea></<c-o>p><Esc>F<i
		autocmd FileType html inoremap <buffer> &tc <c-g>u<Esc>F<ea class=""<Esc>i
		autocmd FileType html inoremap <buffer> &ts <c-g>u<Esc>F<f\>i style=""<Esc>i
		autocmd FileType html.twig inoremap <buffer> &tag <c-g>u<Esc>byei<<Esc>ea></<c-o>p><Esc>F<i
		autocmd FileType html.twig inoremap <buffer> &tc <c-g>u<Esc>F<ea class=""<Esc>i
		autocmd FileType html.twig inoremap <buffer> &ts <c-g>u<Esc>F<f\>i style=""<Esc>i
	augroup END

	inoremap <c-p> <c-n>
	inoremap <c-y> <c-p>
endfunction

" SPECIAL KEY BINDINGS
function! s:setSpecialKeyMaps()
	nnoremap <Space> <c-w><c-w>
	nnoremap go i<CR><Esc>
	tnoremap <c-k> <c-w>N
	tnoremap <c-e> <c-w>Niexit<CR><c-w>N:q<CR>

	noremap  <Up> <c-w>>
	noremap! <Up> <Esc>
	noremap  <Down> <c-w><
	noremap! <Down> <Esc>
	noremap  <S-Up> <c-w>+
	noremap! <S-Up> <Esc>
	noremap  <S-Down> <c-w>-
	noremap! <S-Down> <Esc>
endfunction

"------------
"- COMMANDS -
"------------

" COMMANDS
function! s:setCommands()
	command! Rf call RemoveFunction()
	command! Cs call CheckSyntax()
	command! W w
	command! Wq wq
endfunction

" AUTOCOMMANDS
function! s:setAutocommands()
	augroup vimrc_autocommands
		autocmd!
		autocmd BufWritePre * call FixTrailingWhitespace()

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
	"autocmd VimEnter * NERDTreeVCS
	"autocmd VimEnter * wincmd p
	noremap <silent> <leader>t :NERDTreeVCS<CR>
	noremap <silent> <leader>T :NERDTreeFind<CR>
	let g:NERDTreeMinimalUI = 1

	" VDEBUG
	let g:vdebug_options = {}
	let g:vdebug_options["break_on_open"] = 0

	" AIRLINE
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tagbar#enabled = 1
	let g:airline_section_b = '%{strftime("%H:%M")}'
	let g:airline_section_x = ''

	" GUTENTAGS
	let g:gutentags_ctags_tagfile = ".ctags"

	" FZF
	nnoremap <leader>ff :Files<CR>
	nnoremap <leader>ft :Tags<CR>
	nnoremap <leader>fl :Lines<CR>
	nnoremap <leader>fb :Buffers<CR>
	nnoremap <leader>fm :Marks<CR>
	nnoremap <leader>fc :Commits<CR>
	nnoremap <leader>fC :BCommits<CR>
	nnoremap <leader>fhf :History<CR>
	nnoremap <leader>fhc :History:<CR>
	nnoremap <leader>fhe :History/<CR>

	command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--skip-vcs-ignores', <bang>0)

	" TAGBAR
	noremap <silent> <leader>y :TagbarToggle<CR>
	let g:tagbar_map_showproto = "r"
	let g:tagbar_map_jump = "o"
	let g:tagbar_map_togglefold = "za"
	let g:tagbar_compact = 1

	" ACK
	let g:ackprg = 'ag -U --vimgrep'

	" SMART WORD
	map <leader>w  <Plug>(smartword-w)
	map <leader>b  <Plug>(smartword-b)
	map <leader>e  <Plug>(smartword-e)
	map <leader>ge  <Plug>(smartword-ge)

	" SIMPLE WORKSPACE
	let g:simplews_short_commands = 0
endfunction

"--------------------
"- HELPER FUNCTIONS -
"--------------------

function! Enclose()
	exec "normal lbi" . nr2char(getchar())
	exec "normal ea" . nr2char(getchar())
	echom "Enclosed"
endfunction

function! RemoveFunction()
	execute "normal \"zyi)da)bdw\"zP"
	echom 'Function removed'
endfunction

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
	if &filetype ==# "php"
		let command = "php -l "
	elseif &filetype ==# "perl"
		let command = "perl -c "
	else
		echom "Unknown filetype"
		return
	endif
	call RunCommand(command . path)
endfunction

function! LoadLanguageTags()
	let file_location = "~/.vim/tags/" . &filetype
	execute "set tags+=" . file_location
endfunction

function! TabularizeCursor()
	let character = matchstr(getline('.'), '\%' . col('.') . 'c.')
	exec ":Tab /" . character
endfunction

function! OpenFileAside(path)
	execute "rightbelow split " . a:path
	resize -10
	setlocal buftype=nofile nobuflisted bufhidden=wipe
	map <silent> <buffer>q :set buftype=<CR>:wq<CR>
endfunction

function! FixTrailingWhitespace()
	let l:view = winsaveview()
	%s/\s\+$//ge
	call winrestview(l:view)
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

"-----------------
"- CONFIGURATION -
"-----------------

execute pathogen#infect()
let mapleader = ","

call s:setEditorOptions()
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
