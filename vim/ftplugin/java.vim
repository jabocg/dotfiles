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

" mappings to split and join string lines
nnoremap <LEADER>sp a"<CR>+ "<ESC>
nnoremap <LEADER>jo J^2f"5x

setlocal colorcolumn=80
setlocal textwidth=80

" create a catch block for the specified exception, creating a variable for
" the message as well
function! CatchException(exception)
    let exname = substitute(a:exception, "[a-z]", "", "g")
    let exname = tolower(exname)
    " let comm = "normal! o} catch (final " . a:exception . " " . exname . ") {"
    " execute comm
    execute "normal! o} catch (final " . a:exception . " " . exname . ") {\<CR>final String m = " . exname . ".getMessage();\<ESC>"
endfunc
command! -nargs=1 JavaCatch call CatchException(<f-args>)
