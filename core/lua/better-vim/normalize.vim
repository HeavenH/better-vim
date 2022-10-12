set t_Co=256
set termguicolors
" We're setting dark as the default background.
set background=dark

" Improving cursor appearence
set cursorline
au InsertEnter * highlight CursorLine ctermfg=none ctermbg=none cterm=none guifg=none guibg=none gui=none

syntax on
set nowrap
set clipboard+=unnamedplus
set completeopt=longest,menuone
set expandtab
set tabstop=2
set softtabstop=2
set ignorecase
set encoding=utf8
set nocompatible
set norelativenumber
set number

" Enable mouse
set mouse=a

set wildignore+=*/node_modules/*

" Updating the split config for UtilSnips
let g:UltiSnipsEditSplit="vertical"

" We're using autopairs for inserting/deleting parens, brackets, etc in pairs.
lua << EOF
require('nvim-autopairs').setup{}
EOF

" coc.nvim
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
