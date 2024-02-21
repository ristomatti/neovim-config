" vim: sw=4 ts=4 sts=4 noexpandtab et foldmarker={,} foldlevel=6 foldmethod=marker :

" Load plugins {
    call plug#begin()
    Plug 'terryma/vim-multiple-cursors'
    call plug#end()
"}

" Set options {
    " set whichwrap=b,s,h,l,<,>,[,]        " Backspace and cursor keys wrap too
    " set backspace=indent,eol,start       " backspace for dummies
    " set encoding=utf-8 nobomb            " Use UTF-8 without BOM
" }

" vim-multiple-cursors {
    let g:multi_cursor_use_default_mapping = 0

    let g:multi_cursor_start_word_key = '<C-d>'
    let g:multi_cursor_next_key = '<C-d>'
    let g:multi_cursor_prev_key = '<C-p>'
    let g:multi_cursor_skip_key = '<C-x>'
    let g:multi_cursor_quit_key = '<Esc>'
" }

" Misc remaps {
    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Map <Esc>+l> (redraw screen) to also turn off search highlighting until the next search
    nnoremap <Esc>l :nohl<CR><C-L>
" }

" Command remaps {
    " Change Working Directory to that of the current file
    cnoremap cwd lcd %:p:h
    cnoremap cd. lcd %:p:h

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Reload ~/.vimrc with :Refresh
    command! Reload :so ~/.config/nvim/init.vim
" }

lua require('settings')
lua require('remaps')
lua require('autocmd')
lua require('plugins')

