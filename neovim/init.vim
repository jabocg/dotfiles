" /--------------\
" |              |
" |    LEADER    |
" |              |
" \--------------/
" #leader

" map leader to space
nnoremap <SPACE> <NOP>
let mapleader="\<SPACE>"


" /-------------------------\
" |                         |
" |    PLUGIN MANAGEMENT    |
" |                         |
" \-------------------------/
" #plugins

call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/sideways.vim'
Plug 'chrisbra/unicode.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'elzr/vim-json'
Plug 'jmcantrell/vim-virtualenv'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'Konfekt/FastFold'
Plug 'mkarmona/materialbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neomake/neomake'
Plug 'nvie/vim-flake8'
Plug 'qpkorr/vim-bufkill'
Plug 'Raimondi/delimitMate'
Plug 'roxma/vim-tmux-clipboard'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemovePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wellle/targets.vim'
Plug 'zchee/deoplete-jedi'
call plug#end()
set rtp+=~/git/fzf/


" /-----------------------\
" |                       |
" |    PLUGIN SETTINGS    |
" |                       |
" \-----------------------/
" #plugin-settings #pluginsettings #settings
"
" # setting python envs based on user's home dir
let g:python_host_prog = $HOME . "/.venv/neovim2/bin/python2"
let g:python3_host_prog = $HOME . "/.venv/neovim3/bin/python3"

" #deoplete
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:deoplete#disable_auto_complete = 1

" #neosnippet
let g:neosnippet#disable_runtime_snippets = {'_': 1}
let g:neosnippet#snippets_directory = "$HOME/.config/nvim/snippets/"

" #peekaboo
let g:peekaboo_prefix  = "<LEADER>"

" #airline
let g:airline_powerline_fonts = 1
let g:airline_detect_spell = 0

let g:airline_section_z = '%{exists("*CapsLockStatusline")?CapsLockStatusline():""}%l%\/%L% (%p%%):%v% '

" #flake8
let g:flake8_show_in_gutter = 1
autocmd BufWritePost *.py call Flake8()
autocmd BufEnter *.py call SetFlake8()
" default to 3
let g:flake8_cmd = $HOME . "/.venv/neovim3/bin/flake8"

highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg

" #fastfold
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']


" #ctrlp #ctrl-p
let g:ctrlp_open_multiple_files = 'i'

" #indent-guides
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" #capslock
imap <C-G><C-U> <Plug>CapsLockToggle


" /-----------------------\
" |                       |
" |    PLUGIN MAPPINGS    |
" |                       |
" \-----------------------/
" #mappings

" #sideways
nnoremap <LEADER>H :SidewaysLeft<CR>
nnoremap <LEADER>L :SidewaysRight<CR>
nnoremap <LEADER>hh :SidewaysJumpLeft<CR>
nnoremap <LEADER>ll :SidewaysJumpRight<CR>

" #vim-commentary
xnoremap gC ygvgcP

" #vim-fzf
nnoremap <LEADER>ls :Buffers<CR>
nnoremap <C-T> :BLines<CR>

" #deoplete?
inoremap <expr><TAB> pumvisible() ? "\<C-N>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-P>" : "\<S-TAB>"

" #neosnippet
inoremap <expr><C-SPACE> pumvisible() ? deoplete#cancel_popup() : "\<C-N>"
imap <expr><C-L> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<C-N>"
imap <expr><C-N> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<C-N>"
smap <expr><C-L> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<C-N>"
smap <expr><C-N> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<C-N>"

" #fastfold
nnoremap zuz <Plug>(FastFoldUpdate)

" #neoterm
tnoremap <C-[> <C-\><C-N>

" #indent-guides
nnoremap =ot :IndentGuidesToggle<CR>
nnoremap [ot :IndentGuidesEnable<CR>
nnoremap ]ot :IndentGuidesDisable<CR>


" /------------------------\
" |                        |
" |    VANILLA SETTINGS    |
" |                        |
" \------------------------/
" #settings

" BACKUP AND UNDO
" ===============
set backup
set backupdir+=$HOME/.config/nvim/backup/
set backupdir-=.
set undofile
set undodir+=$HOME/.config/nvim/undo/

" STATUS INFO
" ===========
set ruler
set showcmd
set laststatus=2
set showtabline=2
set colorcolumn=80
set cursorline
set number
set relativenumber

" HANDLING TABS
" =============
set noexpandtab
set shiftwidth=4
set tabstop=4

" BUFFERS
" =======
set hidden

" SEARCHING
" =========
set ignorecase
set smartcase
set nohlsearch

" SUBSTITUTION
" ============

set gdefault

" HANDLING SPLITS
" ===============
set splitright

" WILDMENU
" ========
set wildmode=longest:full,full

" SPELLING
" ========
set spell
set spelllang=en_us

" FOLDING
" =======
set foldlevel=99
set foldcolumn=1

" CLIPBOARD
" =========
set clipboard+=unnamed,unnamedplus

" COLORSCHEME
" ===========
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set t_Co=256
set bg=dark
colorscheme materialbox

" LIST CHARACTERS
" ===============
set list
set lcs=eol:¬,tab:>-,nbsp:×,trail:·

" TEXT WRAPPING
" =============
set nowrap

" MOUSE OPTIONS
" =============
set mouse=a

" FILE TYPES
" ==========
autocmd BufRead *.md setlocal ft=markdown
autocmd BufRead *.conf setlocal ft=config
autocmd BufRead *.wsgi setlocal ft=python

" INIT.VIM SOURCING
" =================
augroup myinitvim
	au!
	autocmd bufwritepost init.vim source %
augroup END


" /------------------------\
" |                        |
" |    VANILLA MAPPINGS    |
" |                        |
" \------------------------/
" #mappings

" MISCELLANEOUS
" ==============
inoremap <CR> <C-G>u<CR>
nnoremap <C-SPACE> <NOP>

" COMMAND MAPPINGS
" ================
nnoremap ; :
cnoremap w!! w !sudo tee > /dev/null %

" EXITING MAPPINGS
" ================
nnoremap QQ :qa!<CR>

" WINDOW MAPPINGS
" ===============
nnoremap <LEADER>w <C-W>

" TAB MAPPINGS
" ============
nnoremap gH :tabmove -1<CR>
nnoremap gL :tabmove +1<CR>

" TEXT MODIFICATION
" =================
map Y y$
nnoremap <LEADER>y :.,$y<CR>
nnoremap <LEADER>Y :%y<CR>
nnoremap x "_x
nnoremap <LEADER>D :%d<CR>
nnoremap <LEADER>x "cdl"cpqcq
nnoremap <LEADER>J a<CR><ESC>

nnoremap <LEADER><C-R> *Ncgn

" TEXT NAVIGATION
" ===============
nnoremap <C-E> 3<C-E>
nnoremap <C-Y> 3<C-Y>
nnoremap <LEADER>G G$
nnoremap <LEADER>, ,
nnoremap , ;
nnoremap <LEADER>zl 10zl
nnoremap <LEADER>zh 10zh
nnoremap z0 9999zh

" TEXT SEARCH/REPLACE
" ===================
nnoremap <LEADER>/ /\<\><LEFT><LEFT>
nnoremap / /\v
cnoremap %s/ %s/\v
nnoremap ? ?\v

" QUICK-FIX
" =========
nnoremap <LEADER>co :botright copen<CR>
nnoremap <LEADER>cc :cclose<CR>
nnoremap <LEADER>cd :QuickFixClear<CR>

" LOCATION LIST
" =============
nnoremap <LEADER>lo :botright lopen<CR>
nnoremap <LEADER>lc :lclose<CR>
nnoremap <LEADER>ld :LocationListClear<CR>


" /-----------------\
" |                 |
" |    FUNCTIONS    |
" |                 |
" \-----------------/

" DIFF WITH FILE
" ==============
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
endif

" BOOLEAN FLIP-FLOP
" =================
" e.g. "false" -> "true"
" works for lowercase, Titlecase, and ALL CAPS
function! BangBool(boolean)
	if a:boolean ==? "true"
		if a:boolean[0] ==# "T"
			if a:boolean[1] ==# "R"
				let rep = "FALSE"
			else
				let rep = "False"
			endif
		else
			let rep = "false"
		endif
	elseif a:boolean ==? "false"
		if a:boolean[0] ==# "F"
			if a:boolean[1] ==# "A"
				let rep = "TRUE"
			else
				let rep = "True"
			endif
		else
			let rep = "true"
		endif
	endif

	if a:boolean !=? "true" || a:boolean !=? "false"
		execute "normal! ciw" . rep . "\<ESC>"
	else
		echo "invalid boolean detected"
	endif
endfunction
command! -nargs=1 Bang call BangBool(<f-args>)

" QUICKFIX CLOSE
" ==============
function! QuickClose()
	" if the quickfix is the last window, close vim
	if &buftype=='quickfix'
		if winnr('$') < 2
			quitall!
		endif
	endif
endfunction
autocmd BufEnter * call QuickClose()

" LIST TODOS
" =========
function! ShowBufferTodo()
	vimgrep /\<TODO:\?\>\C/j %
	botright copen 5
endfunction
function! ShowWindowTodo()
	cexpr []
	silent! windo vimgrepadd /\<TODO:\?\>\C/j %
	botright copen 5
endfunction
function! ShowBuffersTodo()
	cexpr []
	silent! bufdo vimgrepadd /\<TODO:\?\>\C/j %
	botright copen 5
endfunction
command! Todo call ShowBufferTodo()
command! Todos call ShowWindowTodo()
nnoremap <LEADER>todo :Todos<CR>

" FLAKE8 EXECUTABLE SWAP
" ======================
function! SetFlake8(...)
	if a:0 > 0
		let g:flake8_cmd = $HOME . "/.venv/neovim" . a:1 . "/bin/flake8"
	else
		let shebang=getline(1)
		if shebang[strlen(shebang)-1] ==# '3'
			let g:flake8_cmd = $HOME . "/.venv/neovim3/bin/flake8"
		elseif shebang[strlen(shebang)-1] ==# '2'

			let g:flake8_cmd = $HOME . "/.venv/neovim2/bin/flake8"
		endif
	endif
endfunction
command! -nargs=1 SetFlake8 call SetFlake8(<f-args>)
