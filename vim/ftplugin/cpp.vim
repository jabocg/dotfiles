" c++ file settings
if (&filetype == 'cpp')

    setlocal colorcolumn=80
    setlocal textwidth=80

    " duplicate and comment current line
    nnoremap <LEADER>gcc yygccp
endif
