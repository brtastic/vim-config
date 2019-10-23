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
endfunction

" DISPLAY
function! s:setDisplayOptions()
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
endfunction

" INDENTING AND EDITING
function! s:setEditingOptions()
	set ts=3 sw=3 noet
	"set ts=4 sw=4 et
	"set ts=2 sw=2 et
	set autoindent
	set backspace=indent,eol,start
	set encoding=utf-8
endfunction

" SEARCHING
function! s:setSerachingOptions()
	set rtp+=~/.fzf
	set ignorecase
	set smartcase
endfunction

"------------
"- KEY MAPS -
"------------

" GENERAL KEYBINDINGS
function! s:setGenericKeyMaps()
	noremap <c-k> <Esc>
	noremap! <c-k> <Esc>
	noremap <c-c> <Esc>
	noremap! <c-c> <Esc>
	noremap! <c-j> <nop>

	noremap c "_c
	noremap cc "_S
	noremap C "_C
	noremap s "_s
	noremap S "_S
	noremap x "_x
	noremap X "_X

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
	noremap <c-e> 5<c-e>
	noremap <c-y> 5<c-y>
endfunction

" LEADER KEY BINDINGS
function! s:setLeaderKeyMaps()
	nnoremap <leader>, ,
	nnoremap <leader>x :Bw<CR>
	nnoremap <leader>X :Bw!<CR>
	nnoremap <leader>j J
	vnoremap <leader>j J
	nnoremap <leader>h :set hlsearch!<CR>
	nnoremap <leader>\ :e $MYVIMRC<CR>
	nnoremap <leader>r :call Enclose()<CR>
	vnoremap <leader>a :'<,'>!column -t<CR>
	nnoremap <leader>/ yiw:Ag <c-r><c-o>"<CR>
	vnoremap <leader>/ y:Ag <c-r><c-o>"<CR>
	nnoremap <leader>c :call RunAsCommand()<CR>
	nnoremap <leader>sn :cd ..<CR>:pwd<CR>
	nnoremap <leader>sl :pwd<CR>
	nnoremap <leader>ss :cd %:p:h<CR>:pwd<CR>
	nnoremap <leader>sh :cd ~<CR>:pwd<CR>
	nnoremap <leader>p :call PhpDoc()<CR>
	nnoremap <leader>? :call LoadLanguageTags()<CR>
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
endfunction

" INSERT MODE BINDINGS
function! s:setInsertModeMaps()
	inoremap &<Tab> &
	inoremap &{ {<CR>}<Esc>O<Tab>
	inoremap &;{ {<CR>};<Esc>O<Tab>
	inoremap &,{ {<CR>},<Esc>O<Tab>
	inoremap &[ [<CR>]<Esc>O<Tab>
	inoremap &;[ [<CR>];<Esc>O<Tab>
	inoremap &,[ [<CR>],<Esc>O<Tab>
	inoremap &( (<CR>)<Esc>O<Tab>
	inoremap &;( (<CR>);<Esc>O<Tab>
	inoremap &,( (<CR>),<Esc>O<Tab>

	" PHP
	inoremap &th $this->
	inoremap &prf <Esc>biprotected function <Esc>A() {<CR>}<Esc>k$F)i
	inoremap &puf <Esc>bipublic function <Esc>A() {<CR>}<Esc>k$F)i
	inoremap &prsf <Esc>biprotected static function <Esc>A() {<CR>}<Esc>k$F)i
	inoremap &pusf <Esc>bipublic static function <Esc>A() {<CR>}<Esc>k$F)i

	" PERL
	inoremap &se $self->
	inoremap &my my () = @_;<Esc>F)i
	inoremap &moo has "" => (<CR>);<Esc>O<Tab>is => "rw",<Esc>k$F"i
	inoremap &dd use Data::Dumper; print Dumper();<Esc>hi
	inoremap &try try {<CR>} catch {<CR>};<Esc>kO<Tab>

	" HTML
	inoremap &tag <Esc>byei<<Esc>ea></<c-o>p><Esc>F<i
	inoremap &tc <Esc>F<ea class=""<Esc>i
	inoremap &ts <Esc>F<f\>i style=""<Esc>i
	
	inoremap <c-p> <c-n>
	inoremap <c-y> <c-p>
	inoremap <s-Tab> <c-d>
endfunction

" SPECIAL KEY BINDINGS
function! s:setSpecialKeyMaps()
	nnoremap <Space> <c-w><c-w>
	nnoremap <CR> i<CR><Esc>
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
endfunction

"------------
"- COMMANDS -
"------------

" COMMANDS
function! s:setCommands()
	command! Rf :call RemoveFunction()
	command! Cs :call CheckSyntax()
	command! Commands :call OpenFileAside("~/.vim/commands")
	command! Notes :call OpenFileAside("~/.vim/notes")
	command! W :w
endfunction

" AUTOCOMMANDS
function! s:setAutocommands()
	" auto fix trailing whitespaces
	let g:fix_trail = 1
	autocmd BufWritePre * :call BeforeSave()

	" save cursor position
	autocmd BufLeave * call AutoSaveWinView()
	autocmd BufEnter * call AutoRestoreWinView()
endfunction

"-----------
"- PLUGINS -
"-----------

function! s:setPluginOptions()
	" NERDTREE
	"autocmd VimEnter * NERDTreeVCS
	"autocmd VimEnter * wincmd p
	noremap <leader>t :NERDTreeVCS<CR>
	noremap <leader>T :NERDTreeFind<CR>
	let g:NERDTreeMinimalUI = 1

	" VDEBUG
	let g:vdebug_options = {}
	let g:vdebug_options["path_maps"] = {} " todo
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
	
	autocmd VimEnter * command! -bang -nargs=* Ag
		\ call fzf#vim#ag(<q-args>, '--skip-vcs-ignores', <bang>0)

	" TAGBAR
	noremap <leader>y :TagbarToggle<CR>
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
	setlocal buftype=nofile buflisted! bufhidden=wipe
	map <buffer>q :set buftype=<CR>:wq<CR>
endfunction

function! BeforeSave()
	if g:fix_trail
		let l:view = winsaveview()
		%s/\s\+$//ge
		call winrestview(l:view)
	endif
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
