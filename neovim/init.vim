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
Plug 'altercation/vim-colors-solarized'
Plug 'AndrewRadev/sideways.vim'
Plug 'chrisbra/unicode.vim'
Plug 'easymotion/vim-easymotion'
Plug 'jmcantrell/vim-virtualenv'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'kassio/neoterm'
Plug 'Konfekt/FastFold'
Plug 'mkarmona/materialbox'
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
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'zchee/deoplete-jedi'
call plug#end()
set rtp+=~/git/fzf/


" /-----------------------\
" |                       |
" |    PLUGIN SETTINGS    |
" |                       |
" \-----------------------/
" #settings
"
" # setting python envs based on user's home dir
let g:python_host_prog = "/home/" . $USER . "/.venv/neovim2/bin/python2"
let g:python3_host_prog = "/home/" . $USER . "/.venv/neovim3/bin/python3"

" #deoplete
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" let g:deoplete#disable_auto_complete = 1

" #neosnippet
let g:neosnippet#disable_runtime_snippets = {'_': 1}
let g:neosnippet#snippets_directory = "$HOME/.config/nvim/snippets/"

" #peekaboo
let g:peekaboo_prefix  = "<LEADER>"

" #airline
let g:airline_powerline_fonts = 1
let g:airline_detect_spell = 0

let g:airline_section_z = '%4l% ,%3v% '

" #flake8
let g:flake8_show_in_gutter = 1
autocmd BufWritePost *.py call Flake8()

highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg

" #fastfold
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']


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

nnoremap <LEADER>ls :Buffers<CR>
" #vim-fzf

" #deoplete?
inoremap <expr><TAB> pumvisible() ? "\<C-N>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-P>" : "\<S-TAB>"

" #neosnippet
inoremap <expr><C-SPACE> pumvisible() ? deoplete#cancel_popup() : "\<C-N>"
imap <expr><C-L> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<C-N>"
smap <expr><C-L> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<C-N>"

" #fastfold
nnoremap zuz <Plug>(FastFoldUpdate)

" #neoterm
tnoremap <C-[> <C-\><C-N>


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

" HYBRID NUMBERS
" ==============
set number
set relativenumber

" HANDLING TABS
" =============
set noexpandtab
set shiftwidth=4
set tabstop=4

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
" colorscheme solarized
" colorscheme default
colorscheme materialbox

" LIST CHARACTERS
" ===============
set list
set lcs=eol:¬,tab:»­,nbsp:×,trail:·

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

" TEXT NAVIGATION
" ===============
nnoremap <C-E> 3<C-E>
nnoremap <C-Y> 3<C-Y>
nnoremap <LEADER>G G$
nnoremap <LEADER>, ,
nnoremap , ;
nnoremap <LEADER>/ /\<\><LEFT><LEFT>
nnoremap <LEADER>zl 10zl
nnoremap <LEADER>zh 10zh

" QUICK-FIX
" =========
nnoremap <LEADER>co :botright copen<CR>
nnoremap <LEADER>cc :cclose<CR>
nnoremap <LEADER>cd :QuickFixClear<CR>
" DON'T NEED NEXT AND PREV MAPPINGS
" USE THE tpope/vim-unimpaired mappings [q and ]q instead

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
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" BOOLEAN FLIP-FLOP
" =================
" e.g. "false" -> "true"
" works for lowercase, capitol, and ALL CAPS
function! BangBool(boolean)
	if a:boolean ==? "true"
		if a:boolean[0] ==# "T"
			if a:boolean[1] ==# "R"
				echo "all caps"
				let rep = "FALSE"
			else
				echo "capitol"
				let rep = "False"
			endif
		else
			echo "lowercase"
			let rep = "false"
		endif
	elseif a:boolean ==? "false"
		if a:boolean[0] ==# "F"
			if a:boolean[1] ==# "A"
				echo "all caps"
				let rep = "TRUE"
			else
				echo "capitol"
				let rep = "True"
			endif
		else
			echo "lowercase"
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
