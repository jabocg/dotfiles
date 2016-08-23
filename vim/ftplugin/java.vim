" THESE MAPPINGS ONLY WORK WITH ECLIM
"
" space i will import class under cursor
nnoremap <silent> <buffer> <LEADER>i :JavaImport<cr>
" search javadocs for element under cursor
nnoremap <silent> <buffer> <LEADER>d :JavaDocSearch -x declarations<cr>
" perform context sensitive search for element under cursor
nnoremap <silent> <buffer> <LEADER>s :JavaSearchContext<cr>
" user command for :ProjectTodo
nnoremap <LEADER>todo :ProjectTodo<CR>
" mapping to correct current issue
nnoremap <LEADER><CR> :JavaCorrect<CR>


" THESE MAPPINGS WORK WITHOUT ECLIM
"

" mappings to split and join string lines
nnoremap <LEADER>sp a"<CR>+ "<ESC>
nnoremap <LEADER>jo J^2f"5x

" duplicate and comment current line
nnoremap <LEADER>gcc yygccp

" mapping to selectively add fail() blocks to caught exceptions
nnoremap <LEADER>fail :%s/^\(\s*\)\(e.printStackTrace();\)\(\n\s*fail()\)\@!/\1\2\r\1fail();/gc<CR>

" java settings
setlocal colorcolumn=80
setlocal textwidth=80

" java abbvr
" ab sout System.out.println(
ab sout System.out.println(
ab fout System.out.format(

" create a catch block for the specified exception, creating a variable for
" the message as well
function! CatchException(exception)
    let exname = substitute(a:exception, "[a-z]", "", "g")
    let exname = tolower(exname)
    execute "normal! o} catch (final " . a:exception . " " . exname . ") {\<CR>final String m = " . exname . ".getMessage();\<CR>System.out.println(m);\<ESC>"
endfunc
command! -nargs=1 JavaCatch call CatchException(<f-args>)
