" vim: sw=4 ts=4 sts=4 noexpandtab et foldmarker={,} foldlevel=6 foldmethod=marker :

" Load plugins {
    call plug#begin()

    " User interface
    Plug 'tpope/vim-sensible'
    Plug 'terryma/vim-multiple-cursors'

    " Syntax checking
    Plug 'bronson/vim-trailing-whitespace'

    call plug#end()
"}

" Syntax highlighting and code auto indent {
    filetype on
    filetype indent on
    filetype plugin indent on
    syntax on
" }

" Set options {
    set nocompatible                     " Disable vi compatibility
    set mouse=a                          " Enable mouse always when possible
    set shiftwidth=4                     " Code indent width
    set tabstop=4                        " Spaces to insert with tab
    set softtabstop=4                    " Spaces to se for tab when editing
    set title                            " Add filename to window title
    set hidden                           " Allow buffer switching without saving
    set number                           " Enable line numbers
    set timeoutlen=300                   " Set faster timeout when leaving insert mode
    set dir=~/tmp,/tmp                   " Swap file dirs
    set guioptions-=T                    " GUI display options
    set scrolloff=3                      " Keep 3 lines when scrolling
    "set wildmode=list:longest,full       " Command <Tab> completion, list matches, then   longest common part, then all.
    "set wildmenu                         " Enhance command-line completion
    set whichwrap=b,s,h,l,<,>,[,]        " Backspace and cursor keys wrap too
    set scrolljump=5                     " Lines to scroll when cursor leaves screen
    set backspace=indent,eol,start       " backspace for dummies
    set showmatch                        " Show matching brackets/parenthesis
    set nowrap                           " Do not wrap long lines
    set t_Co=256                         " 256 color mode in
    set background=dark                  " Higlight color background
    set splitbelow                       " Create horizontal split below
    set splitright                       " Create vertical split on the right
    "set omnifunc=syntaxcomplete#Complete " Enable omni completion
    "set clipboard=unnamedplus            " Use the system clipboard
    set ttyfast                          " Optimize for fast terminal connections
    set gdefault                         " Global search/replace by default
    set encoding=utf-8 nobomb            " Use UTF-8 without BOM
    set cursorline                       " Highlight current line

    " Centralize backups, swapfiles and undo history
    if exists("&undodir")
        set undodir=~/.vim/undo
    endif
" }

" vim-multiple-cursors {
    let g:multi_cursor_use_default_mapping = 0

    let g:multi_cursor_start_word_key = '<C-d>'
    let g:multi_cursor_next_key = '<C-d>'
    let g:multi_cursor_prev_key = '<C-p>'
    let g:multi_cursor_skip_key = '<C-x>'
    let g:multi_cursor_quit_key = '<Esc>'
" }

" emmet-vim {
    " Use Emmet only in defined filetypes
    let g:user_emmet_install_global = 0

    " Emmet leader key
    let g:user_emmet_leader_key = "<C-e>"

    " Configure Emmet for only specified filetypes
    autocmd FileType html,css,less,xml,tag,jsp call EmmetConfigure()

    function! EmmetConfigure()
        " Activate Emmet
        EmmetInstall

        " Expand Emmet abbreviation with tab if no autocomplete visible
        "imap <silent><expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)" : pumvisible() ? "\<C-n>" : emmet#isExpandable() ? "\<Plug>(emmet-expand-abbr)" : "\<TAB>"

        " Move to next fill point
        imap <silent><expr><C-n> pumvisible() ? "\<C-n>" : "\<Plug>(emmet-move-next)"
    endfunction
" }

" Function key remaps {
    " Toggle menu ALT+F11
    nnoremap <M-F11> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

    " Fullscreen mode for GVIM and Terminal, need 'wmctrl' in you PATH
    map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
" }

" Leader remaps {
    " Search with leader s
    " map <Leader>s <Plug>(easymotion-sn)
" }

" Misc remaps {
    " Wrapped lines goes down/up to next row, rather than next line in file.{}
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

