set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/plugged/Vundle.vim
call vundle#begin()            " required

" ===================
" my plugins
" ===================
Plugin 'whatyouhide/vim-gotham'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/Align'
Plugin 'fatih/vim-go'
Plugin 'keith/rspec.vim'
Plugin 'SirVer/ultisnips'
Plugin 'derekwyatt/vim-scala'
Plugin 'ensime/ensime-vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'leafgarland/typescript-vim'

" ===================
" end plugins
" ===================
"
" :PlugList       - lists configured plugins
" :PlugInstall    - installs plugins; append `!` to update or just :PluginUpdate

" Initialize plugin system
call vundle#end()
filetype plugin indent on

