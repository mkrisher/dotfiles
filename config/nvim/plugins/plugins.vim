set nocompatible
filetype off

" use vim-plug
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/Align'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mkrisher/nord-vim'

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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'shaunsingh/nord.nvim'
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

" trial
Plug 'tpope/vim-unimpaired'

" nerdtree
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" ale
Plug 'dense-analysis/ale'

call plug#end()
filetype plugin indent on
