" execute pathogen#infect()

" put into home dir '~'

" put leader at top of file, can be used by all now
" make space do nothing to use as LEADER
nnoremap <SPACE> <NOP>
let mapleader="\<SPACE>"
" vimrc file

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set incsearch		" do incremental searching
set nu			" enable line numbering
set relativenumber	" enable relative line numbers
set clipboard=unnamedplus	" sets clipboard to global
set expandtab		" uses softspacetab instead of tap charcter(?)
set shiftwidth=4	" shift by 4 characters
set softtabstop=4	" set tab size to 4
set autoindent      	" Keep indentation from previous line
set smartindent     	" Automatically inserts indentation in some cases
set cindent         	" Like smartindent, but stricter and more customisable
set background=dark	" tells vim to use colors better suited for a dark background
set showcmd		" display incomplete commands
set nohlsearch          " don't highlight search(I think)
set nobackup            " do not keep backup file
set noundofile          " do not keep undo file
set guioptions=1        " remove/hide topbar items in gVim

" User defined mappings

" Create a new line and move to it
nnoremap <LEADER>o o<ESC>

" Create a new line below cursor
nnoremap <LEADER>O O<ESC>

" Save and delete buffer
command WD write | bdelete

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
nnoremap <Leader><BS> :call Wraptog()<CR>

" ctrl backpsace deletes previous word in insert mode
inoremap <C-BS> <C-W>

" enter in normal mode marks with `
nnoremap <CR> mA

" space enter goes to marked value
nnoremap <LEADER><CR> `A

" tab goes to the next window
nnoremap <TAB> <C-W>w

" shift tab goes to the previous window
nnoremap <S><TAB> <C-W>W

" space tab goes to the next buffer
nnoremap <LEADER><TAB> :bn<CR>

" space y yanks from cursor line to end of file
nnoremap <LEADER>y :.,$y<CR>

" space Y yanks entire file
nnoremap <LEADER>Y :%y<CR>

" ctrl-j in insert mode goes down one line
inoremap <C-j> <C-o>j

" ctrl-k in insert mode goes up one line
inoremap <C-k> <C-o>k

" ctrl-h in insert mode goes to beginning of line
inoremap <C-h> <C-o>0

" ctrl-l in insert mode goes to end of line 
inoremap <C-l> <C-o>$

" mapping Y to yank till end of line
map Y y$

" sudo write trick
cmap w!! w !sudo tee > /dev/null %

" tell x to use blackhole register
nnoremap x "_x

" map I to insert one character
nnoremap I i_<ESC>r

" map A to insert one character
nnoremap A a_<ESC>r

" map C-e and C-y to scroll by 3 lies
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

let g:vim_markdown_frontmatter=1
let g:vim_markdown_folding_disabled=1


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

" set highlight color and background color for GVim
highlight Normal guifg=white guibg=black

