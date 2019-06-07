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







syntax enable

set showcmd                       " Display incomplete commands.
set noshowmode                    " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set nowrap                        " Turn off line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile

set tabstop=2                     " Global tab width.
set shiftwidth=2
set softtabstop=2
set expandtab

set laststatus=2                  " Show the status line all the time
set showtabline=2
set winwidth=79

set cursorline
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif

set spelllang=en_us

"set colorcolumn=80                " show vertical line at 80 column

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

set timeoutlen=250

" Show invisibles
set list listchars=tab:▸\ ,trail:·

"Directories for swp files
set backupdir=~/tmp/vim//
set directory=~/tmp/vim//

" Sane searching
nnoremap / /\v
vnoremap / /\v
set gdefault
set showmatch
nnoremap <tab> %
vnoremap <tab> %

" JSON syntax highlighting
au BufRead,BufNewFile *.json set filetype=json

"Rspec syntax hightlighting
au BufRead,BufNewFile *_spec.rb set filetype=rspec

" Turn off auto-indention
map ni :set invai<cr>

" Gist setup
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1

" indicate insert mode
:autocmd InsertEnter,InsertLeave * set cul!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" strip whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd FileType ruby,python,html,erb,css,javascript,rspec autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0
nmap <leader>t :CtrlP<cr>
nmap <leader>tm :CtrlP app/models<cr>
nmap <leader>tc :CtrlP app/controllers<cr>
nmap <leader>ts :CtrlP app/services<cr>
nmap <leader>tn :CtrlP app/connectors<cr>
nmap <leader>tv :CtrlP app/views<cr>
nmap <leader>ta :CtrlP app<cr>
nmap <leader>tp :CtrlP spec<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
"set t_Co=256
set background=dark
colorscheme gotham256
highlight Normal ctermbg=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" short cuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>
" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>
" Show netrw explore
nmap <leader>e :Explore<cr>
" clear search highlights:
noremap <silent><Leader>/ :nohls<CR>
" moving lines (alt+j)
nnoremap <leader>j :m+<CR>==
nnoremap <leader>k :m-2<CR>==
inoremap <leader>j <Esc>:m+<CR>==gi
inoremap <leader>k <Esc>:m-2<CR>==gi
vnoremap <leader>j :m'>+<CR>gv=gv
vnoremap <leader>k :m-2<CR>gv=gv
"splits
nnoremap <leader>v :vsplit<cr><C-w>l
nnoremap <leader>s :split<cr><C-w>j
" Clear search results
nnoremap <leader><space> :noh<cr>
" Navigating splits
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" reselect after indent/outdent
vnoremap < <gv
vnoremap > >gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

""""""""""""""""""""""""
" relative line numbers
""""""""""""""""""""""""
function! NumberToggle()
  if(&relativenumber == 1)
    setl rnu!
  else
    setl rnu
  endif
endfunc

nnoremap <Leader>ln :call NumberToggle()<cr>

""""""""""""""""""""""""
" vim-airline
""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='sol'
let g:airline_section_y = '%{strftime("%c")}'

""""""""""""""""""""""""
" silver surfer search
""""""""""""""""""""""""
"function Search(term)
"  Ag a:term 
"  "--ignore-dir vendor --ignore-dir data --ignore-dir mojo --ignore-dir assets
"endfunc

"""""""""""""""""""""""
" formatting
"""""""""""""""""""""""
au FileType xml exe ":silent %!xmllint --format --recover - 2>/dev/null"
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

"""""""""""""""""""""""
" Go
"""""""""""""""""""""""
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go exe ":set nolist"

""""""""""""""""""""""
" Snippets
""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="<c-e>"

""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"""""""""""""""""""""""
" ENSIME
"""""""""""""""""""""""
au FileType scala nnoremap <localleader>df :EnDeclaration<CR>

"""""""""""""""""""""""
" Nerdtree
"""""""""""""""""""""""
" open at launch
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close tree if only remaining tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Show hide NERDTree
nmap <silent> <leader> :NERDTreeToggle<CR>

" open tree at current file
nnoremap <silent> <Leader>f :NERDTreeFind<CR>

" automatically close tree when opening a file
let NERDTreeQuitOnOpen = 1

" automatically rmeove buffer of deleted file
let NERDTreeAutoDeleteBuffer = 1

" cleanup visuals
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" format JSON
com! FormatJSON %!python -m json.tool

