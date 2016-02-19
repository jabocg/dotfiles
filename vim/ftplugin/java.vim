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
