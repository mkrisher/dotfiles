set nocompatible
filetype off

" use vim-plug
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/Align'

Plug 'shaunsingh/nord.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'jlanzarotta/bufexplorer'

Plug 'vim-syntastic/syntastic'
Plug 'keith/rspec.vim'

Plug 'SirVer/ultisnips'

Plug 'troydm/zoomwintab.vim'

Plug 'dewyze/vim-ruby-block-helpers'

Plug 'godlygeek/tabular'

Plug 'nvim-lua/plenary.nvim'

Plug 'kyoh86/vim-ripgrep'

" telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'jremmen/vim-ripgrep'

" aesthetic
Plug 'nvim-telescope/telescope.nvim'
Plug 'stevearc/dressing.nvim'
Plug 'shaunsingh/nord.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/todo-comments.nvim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jlanzarotta/bufexplorer'

" Ruby
Plug 'tpope/vim-rails'
Plug 'keith/rspec.vim'
Plug 'dewyze/vim-ruby-block-helpers'
Plug 'vim-syntastic/syntastic'

" LSP
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" trial
Plug 'tpope/vim-unimpaired'

" nerdtree
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ale
Plug 'dense-analysis/ale'

call plug#end()
filetype plugin indent on
