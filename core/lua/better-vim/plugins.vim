" This is the configuration file for your neovim plugins.
" We're using vim-plug (https://github.com/junegunn/vim-plug) as our plugins manager.

" Start vim-plug
call plug#begin('~/.config/nvim/plugged')

" We're using coc.nvim for code completion
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm install'}

" Adds support for .editorconfig
Plug 'editorconfig/editorconfig-vim'

" Custom icons for the file explorer, tabs, etc
Plug 'kyazdani42/nvim-web-devicons'

" We're using nvim.tree as our file explorer
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-tree.lua'

" We're using telescope to find files, searching, etc
Plug 'nvim-telescope/telescope.nvim'

" We're using lualine as our custom status line
Plug 'nvim-lualine/lualine.nvim'

" All available themes
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'Mofiqul/dracula.nvim'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'folke/tokyonight.nvim'
Plug 'arcticicestudio/nord-vim'

" We're using bufferline to manage buffers using tabs
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

" A single tool to manage all custom shortcuts
" Check modules/shortcuts. vim to see more.
Plug 'folke/which-key.nvim'

" Snippets plugin + Common snippets 
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Awesome custom dashboard plugin
Plug 'glepnir/dashboard-nvim'

" The best colorizer plugin
Plug 'norcalli/nvim-colorizer.lua'

" Other plugins that add nice defaults to neovim
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'andymass/vim-matchup'
Plug 'windwp/nvim-autopairs'
Plug 'yuttie/comfortable-motion.vim'
" Required by the indent-blankline.nvim
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'

" Comment plugin for neovim
Plug 'numToStr/Comment.nvim'

source $HOME/.config/better-vim/plugins.vim

call plug#end()
