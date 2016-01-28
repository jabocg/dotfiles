" put into home dir '~'

call plug#begin('~/.vim/plugged')

" smarter substitute
Plug 'tpope/vim-abolish'

" smarter split closing
Plug 'qpkorr/vim-bufkill'

" quick key commenting
Plug 'tpope/vim-commentary'

" git stuff
Plug 'tpope/vim-fugitive'

" smart . commands
Plug 'tpope/vim-repeat'

" surround add/rem/edit
Plug 'tpope/vim-surround'

" auto completion for programming
function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" better tabs?
Plug 'godlygeek/tabular'

" better markdown support
Plug 'plasticboy/vim-markdown'
" disable markdown folding, improve performance
let g:vim_markdown_folding_disabled=1

" parameter and other things movement
Plug 'AndrewRadev/sideways.vim'

" auto-close for brackets, parenthesis, and whatnot
Plug 'rstacruz/vim-closer'

" git diff markers
Plug 'airblade/vim-gitgutter'

" FZF
Plug 'junegunn/fzf.vim'

" enable FZF
set rtp+=~/git/fzf/

call plug#end()

filetype plugin indent on

" put leader at top of file, can be used by all now
" make space do nothing to use as LEADER
nnoremap <SPACE> <NOP>
let mapleader="\<SPACE>"

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
  set backupdir=~/.vim/backup//	" no longer disabling this, just moving files
  set undodir=~/.vim/undo//
endif

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set incsearch		" do incremental searching
set nu			" enable line numbering
set relativenumber	" enable relative line numbers
set expandtab		" uses space characters instead of tab character
set shiftwidth=4	" shift by 4 characters
set tabstop=4           " set tab size to 4
set autoindent      	" Keep indentation from previous line
set smartindent     	" Automatically inserts indentation in some cases
set cindent         	" Like smartindent, but stricter and more customizable
set showcmd		" display incomplete commands
set nohlsearch          " don't highlight search(I think)
set foldmethod=syntax   " use syntactic folding
set foldlevel=99        " unfold everything at default, use 'zM' to fold everything, 'zR' to unfold
set foldcolumn=1        " enables the fold colun(shows folds) for width 1
set laststatus=2        " always enable status line
set wildmenu            " enable wildmenu
set wildmode=longest:full,full   " longest match, then wildmenu
set background=dark	" tells vim to use colors better suited for a dark background

" Powerline stuff
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" if check for setting clipboard
" Mac(Darwin) needs to be unnamed
" Linux(at least Fedora) needs to be unnamedplus
if(system("uname -s") == "Darwin\n")
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif

" things for eclim and ycm
" allow YouCompleteMe to auto complete for eclim
let g:EclimCompletionMethod = 'omnifunc'
" close the autocomplete preview window after leaving insert mode
let g:ycm_autoclose_preview_window_after_insertion = 1

" force .md files to be treated as a markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" set some settings for markdown files
"
" set text wrapping for markdown files
" disable fold column for markdown files
au BufRead,BufNewFile, *.md setlocal textwidth=80
au BufRead,BufNewFile, *.md setlocal foldcolumn=0

" set setting for crontab
au FileType crontab setlocal bkc=yes

" set default edit option for FZF :Buffers command
let g:EclimBuffersDefaultAction = 'edit'

" -----------------------------------------------------------------------------
" User defined mappings

" Create a new line and move to it
nnoremap <LEADER>o o<ESC>

" Create a new line below cursor
nnoremap <LEADER>O O<ESC>

" backspace toggle highlighting search
function Toghls()
    set hls!
    if &hls == 1
        echom "hlsearch"
    else
        echom "nohlsearch"
    endif
endfunction
nnoremap <BS> :call Toghls()<CR>

" wrapping toggle function
function Wraptog()
  set wrap!
  if &wrap
    echom "wrap"
  else
    echom "nowrap"
  endif
endfunction
nnoremap <LEADER><BS> :call Wraptog()<CR>

" ctrl backspace deletes previous word in insert mode
inoremap <C-BS> <C-W>

" tab goes to the next window
nnoremap <TAB> <C-W>w

" shift tab goes to the previous window
nnoremap <S-TAB> <C-W>W

" space tab goes to the next buffer
nnoremap <LEADER><TAB> :bn<CR>

" space shift tab goes to previous buffer
nnoremap <LEADER><S-TAB> :bp<CR>

" space y yanks from cursor line to end of file
nnoremap <LEADER>y :.,$y<CR>

" space Y yanks entire file
nnoremap <LEADER>Y :%y<CR>

" ctrl-j in insert mode goes down one line
inoremap <C-J> <C-O>j

" ctrl-k in insert mode goes up one line
inoremap <C-K> <C-O>k

" ctrl-h in insert mode goes to beginning of line
inoremap <C-H> <C-O>^

" ctrl-l in insert mode goes to end of line 
inoremap <C-L> <C-O>$

" mapping Y to yank till end of line
map Y y$

" sudo write trick
cmap w!! w !sudo tee > /dev/null %

" tell x to use blackhole register
nnoremap x "_x

" map C-e and C-y to scroll by 3 lies
nnoremap <C-E> 3<C-E>
nnoremap <C-Y> 3<C-Y>

" C-j and C-k move lines up or down
nnoremap <C-J> "ldd"lp
nnoremap <C-K> "lddkk"lp

" remapping : to ;
nnoremap ; :

" adding :Q and command to force quit
command Q execute ":q!"
cmap qq q!

" ctrl-h and ctrl-l call sideways commands
nnoremap <C-H> :SidewaysLeft<CR>
nnoremap <C-L> :SidewaysRight<CR>

" mapping for quick lsing
cmap ;ls ls<CR>:b 

" mappings for opening, closing, and clearing quickfix and location list windows
nnoremap <LEADER>lo :lopen<CR>
nnoremap <LEADER>lc :lclose<CR>
nnoremap <LEADER>co :copen<CR>
nnoremap <LEADER>cc :cclose<CR>
" mapping to clear(delete) the quickfix expression
nnoremap <LEADER>cd :cexpr []<CR>

" make n and N more useful
nnoremap n nzz
nnoremap N Nzz

" mapping to delete a character, then place if after the current character
"   essentially switching the two and clearing the register
" will not work on last character in line
nnoremap <LEADER>x "cdl"cpqcq

" mapping for FZF buffers
nnoremap <LEADER>ls :Buffers<CR>

" shamelessly stolen(permission) from Vim video, IBV2013 something

" OR ELSE just the 81st column of wide lines...
highlight ColorColumn ctermbg=8
call matchadd('ColorColumn', '\%81v', 100)

" set spell checking items

setlocal spell spelllang=en_us
highlight SpellBad ctermbg=1 ctermfg=NONE 
highlight SpellCap ctermbg=4 ctermfg=NONE
highlight SpellRare ctermbg=7 ctermfg=3*
highlight SpellLocal ctermbg=6 ctermfg=0

" set gui(gvim) background and foreground
highlight Normal guifg=white guibg=black

" -----------------------------------------------------------------------------

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

