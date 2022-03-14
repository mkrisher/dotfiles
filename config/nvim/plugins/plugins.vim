set nocompatible
filetype off

" use vim-plug
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-scripts/Align'
Plug 'keith/rspec.vim'
Plug 'SirVer/ultisnips'
Plug 'vim-syntastic/syntastic'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'mkrisher/nord-vim'
Plug 'troydm/zoomwintab.vim'
Plug 'dewyze/vim-ruby-block-helpers'
Plug 'godlygeek/tabular'

call plug#end()
filetype plugin indent on
