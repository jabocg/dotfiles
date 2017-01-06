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
" Plug 'davidhalter/jedi-vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemovePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'chrisbra/unicode.vim'
Plug 'easymotion/vim-easymotion'
Plug 'jmcantrell/vim-virtualenv'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'neomake/neomake'
Plug 'nvie/vim-flake8'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'zchee/deoplete-jedi'
call plug#end()
set rtp+=~/git/fzf/


" /-----------------------\
" |                       |
" |    PLUGIN SETTINGS    |
" |                       |
" \-----------------------/
" #settings

let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:neosnippet#disable_runtime_snippets = {'_': 1}

" let g:python_host_prog = "$HOME/.venv/neomake2/bin/python"
" let g:python3_host_prog = "$HOME/.venv/neomake2/bin/python"

let g:neosnippet#snippets_directory = "$HOME/.config/nvim/snippets/"


" /-----------------------\
" |                       |
" |    PLUGIN MAPPINGS    |
" |                       |
" \-----------------------/
" #mappings

nnoremap <LEADER>H :SidewaysLeft<CR>
nnoremap <LEADER>L :SidewaysRight<CR>
nnoremap <LEADER>hh :SidewaysJumpLeft<CR>
nnoremap <LEADER>ll :SidewaysJumpRight<CR>

xnoremap gC ygvgcP

nnoremap <LEADER>bool :Bang <C-R><C-W><CR>
nnoremap <LEADER>bang :Bang <C-R><C-W><CR>

nnoremap <LEADER>ls :Buffers<CR>

inoremap <expr><TAB> pumvisible() ? "\<C-N>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-P>" : "\<S-TAB>"

inoremap <expr><C-SPACE> pumvisible() ? "\<C-Y>" : deoplete#mappings#manual_complete()
imap <expr><C-L> neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : "\<Plug>(neosnippet_jump)"
smap <expr><C-L> "\<Plug>(neosnippet_jump)"


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

" MISC. STATUS
" ============
set ruler
set showcmd
set laststatus=2
set colorcolumn=80
set cursorline

" HYBRID NUMBERS
" ==============
set number
set relativenumber

" HANDLING TABS
" =============
" set expandtab
set shiftwidth=4
set tabstop=4

" SEARCHING
" =========
set ignorecase
set smartcase
set nohlsearch

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
set foldmethod=syntax
set foldlevel=99
set foldcolumn=1

" CLIPBOARD
" =========
set clipboard+=unnamed,unnamedplus

" COLORSCHEME
" ===========
colorscheme solarized
set bg=dark

" LIST CHARACTERS
" ===============
set list
set lcs=eol:¬,tab:»­,nbsp:×,trail:·


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
