set nocompatible
filetype off

" use vim-plug
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
" Plug 'bling/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-scripts/Align'
Plug 'keith/rspec.vim'
Plug 'vim-syntastic/syntastic'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'troydm/zoomwintab.vim'
Plug 'dewyze/vim-ruby-block-helpers'
Plug 'godlygeek/tabular'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'jremmen/vim-ripgrep'
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'shaunsingh/nord.nvim'
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()
filetype plugin indent on
