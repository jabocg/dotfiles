" THESE MAPPINGS ONLY WORK WITH ECLIM
"
" space i will import class under cursor
nnoremap <silent> <buffer> <LEADER>i :JavaImport<cr>
" search javadocs for element under cursor
nnoremap <silent> <buffer> <LEADER>d :JavaDocSearch -x declarations<cr>
" perform context sensitive search for element under cursor
nnoremap <silent> <buffer> <LEADER>s :JavaSearchContext<cr>