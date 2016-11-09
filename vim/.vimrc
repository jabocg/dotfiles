" -----------------------------------------------------------------------------
"  Using vim-plug, plugin definitions
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

" color schemes!
Plug 'flazz/vim-colorschemes'

" color scheme changer
Plug 'felixhummel/setcolors.vim'

" Unicode characters done better
Plug 'chrisbra/unicode.vim'

" Python PEP8
Plug 'nvie/vim-flake8'

" Python indenting
Plug 'hynek/vim-python-pep8-indent'

" python virtual environment 
Plug 'jmcantrell/vim-virtualenv'

" Python auto-completion
Plug 'davidhalter/jedi-vim'

" Peekaboo for seeing registers before accessing
Plug 'junegunn/vim-peekaboo'

" vim-journal note taking stuff
Plug 'junegunn/vim-journal'

" increment and decrement dates
Plug 'tpope/vim-speeddating'

" proper folding for Python
Plug 'tmhedberg/SimpylFold'

" more motions and control
Plug 'easymotion/vim-easymotion'

" javascript support
Plug 'pangloss/vim-javascript'

" syntastic(syntax support)
Plug 'scrooloose/syntastic'

call plug#end()

filetype plugin indent on


" -----------------------------------------------------------------------------
"
" colorscheme stuff
if &term == "builtin_gui" 
    colorscheme morning     " set GUI to morning colorscheme
else
    colorscheme solarized       " set terminal's colorscheme
    set background=dark     " tells vim to use colors better suited for a dark background
endif


" -----------------------------------------------------------------------------
"
" put leader at top of file, can be used by all now
" make space do nothing to use as LEADER
nnoremap <SPACE> <NOP>
let mapleader="\<SPACE>"

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
  set backupdir=~/.vim/backup//	" no longer disabling this, just moving files
  set undodir=~/.vim/undo//
endif

set history=256		" keep 256 lines of command line history
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
setglobal foldmethod=syntax   " use syntactic folding
set foldlevel=99        " unfold everything at default, use 'zM' to fold everything, 'zR' to unfold
set foldcolumn=1        " enables the fold column(shows folds) for width 1
set laststatus=2        " always enable status line
set wildmenu            " enable wildmenu
set wildmode=longest:full,full   " longest match, then wildmenu
set splitright          " create vertical splits to the right
set encoding=utf-8      " setting to UTF-8 encoding
set colorcolumn=80      " set default color column
set t_ut=               " disable background color erase
set cursorline  " show line cursor is on
set smartcase   " use smart case when searching

" Powerline stuff
set rtp+=/usr/local/bin/python3.5/site-packages/powerline/bindings/vim/

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
    " also set colorscheme on not Mac
    " colorscheme railscasts
endif

" things for eclim and ycm
" allow YouCompleteMe to auto complete for eclim
let g:EclimCompletionMethod = 'omnifunc'
" close the autocomplete preview window after leaving insert mode
let g:ycm_autoclose_preview_window_after_insertion = 1
" disable eclim automatic logging
let g:EclimLoggingDisabled = 1

" flake8 settings
" show marks in the gutter
let g:flake8_show_in_gutter=1

" syntastic settings
let g:syntastic_always_populate_loc_list = 1

" settings for filetype detect
augroup filetypedetect
    autocmd BufNew,BufNewFile,BufRead *.txt,*.text,*.md,*.markdown :setfiletype markdown
    autocmd BufNew,BufNewFile,BufRead *.log :setfiletype log
augroup END

" set setting for crontab
au FileType crontab setlocal bkc=yes

" always start on the top of a commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" set default edit option for FZF :Buffers command
let g:EclimBuffersDefaultAction = 'edit'
"
" stuff for SimpylFold
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" add Flake8 call on Python save
autocmd BufWritePost *.py call Flake8()


" user mappings
source ~/.vimkey

" -----------------------------------------------------------------------------
" spelling config

set spell spelllang=en_us

" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
"  Abbreviations (abvr abbr)

ab indead indead
ab instaed instead
ab Indaed Indead
ab Instaed Instead
ab gropu group
ab gorup group
ab cerst certs
ab countires countries
ab downlaod download
ab donwload download
ab donwlaod download
ab downlaods downloads
ab donwloads downloads
ab donwlaods downloads

" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
"  Commands (misc)

" split
command! VSP botright vsp
command! SP topleft sp

" -----------------------------------------------------------------------------
"

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

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

" script that appends to current buffer and demonstrates all the colors

function! VimColorTest() 
    botright new
    let num = 255
    while num >= 0
        exec 'hi col_'.num.' ctermbg='.num.' ctermfg=white'
        exec 'syn match col_'.num.' "ctermbg='.num.':...." containedIn=ALL'
        call append(0, 'ctermbg='.num.':....')
        let num = num - 1
    endwhile
endfunction
command! VimColorTest call VimColorTest()

function! Python(...)
    execute "!python % " . join(a:000, " ")
endfunction

command! -nargs=* Py call Python(<f-args>)

command! Flake8 call Flake8()

" function to flip a written boolean
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
