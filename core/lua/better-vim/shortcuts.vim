" Custom shortcuts for coc.nvim
nmap <leader>cd :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Custom which key config
lua << EOF
  local wk = require("which-key")
  local home = os.getenv("HOME")
  local helpers = require("better-vim.helpers")

  vim.g.mapleader = helpers.get_config_item {"mappings", "leader"}

  wk.register({
    -- General
    ["<c-s>"] = { "<cmd>w<cr>", "Save changes" },

    -- Telescope shortcuts
    ["<c-p>"] = { "<cmd>Telescope find_files<cr>", "Find file" },
    ["<c-f>"] = { "<cmd>Telescope live_grep<cr>", "Find word" },
    ["<c-o>"] = { "<cmd>Telescope buffers<cr>", "Show buffers" },

    -- File explorer shortcuts
    ["<c-n>"] = { "<cmd>NvimTreeToggle<cr>", "Open file explorer", noremap = true },

    -- Line navigation
    ["<s-k>"] = { "5k", "Jump 5 lines above"},
    ["<s-j>"] = { "5j", "Jump 5 lines below"},

    -- Custom coc.nvim shortcuts
    ["<leader>"] = {
      -- Custom coc.nvim shortcuts
      cd = { "Show documentation" },
      gd = { "<Plug>(coc-definition)", "Go to definition" },
      cy = { "<Plug>(coc-type-definition)", "Type definition" },
      ci = { "<Plug>(coc-implementation)", "Show implementation" },
      cr = { "<Plug>(coc-references)", "Show references" },
      rn = { "<Plug>(coc-rename)", "Rename symbol" },
      dp = { "<Plug>(coc-diagnostic-prev)", "Go to the previous coc diagnostic" },
      dn = { "<Plug>(coc-diagnostic-next)", "Go to the next coc diagnostic" },
      cl = { "<cmd>nohl<cr>", "Clear search highlights" },

       -- Open nvim config
      ev = { "<cmd>e $MYVIMRC<cr>", "Open init.vim"},
      sv = { "<cmd>source $MYVIMRC<cr>", "Reload neovim config"},
    },

    -- Navigate between buffers
    ["<C-H>"] = { "<C-W>h", "Navigate to the buffer (left)"},
    ["<C-L>"] = { "<C-W>l", "Navigate to the buffer (right)"},
    ["<C-J>"] = { "<C-W>j", "Navigate to the buffer (down)"},
    ["<C-K>"] = { "<C-W>k", "Navigate to the buffer (top)"},
  })

  wk.setup({
    spelling = {
      enabled = true, 
      suggestions = 20, 
    },
  })
EOF

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

lua << EOF
require('Comment').setup()
EOF
