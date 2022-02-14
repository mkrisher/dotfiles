" Sane searching
nnoremap / /\v
vnoremap / /\v
set gdefault
set showmatch
nnoremap <tab> %
vnoremap <tab> %

" JSON syntax highlighting
au BufRead,BufNewFile *.json set filetype=json

" Rspec syntax hightlighting
au BufRead,BufNewFile *_spec.rb set filetype=rspec

" Markdown formatting
au BufRead,BufNewFile *.md setlocal textwidth=80

" Turn off auto-indention
"map ni :set invai<cr>

" indicate insert mode
:autocmd InsertEnter,InsertLeave * set cul!

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
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
" reselect after indent/outdent
vnoremap < <gv
vnoremap > >gv
" reselect after paste
nnoremap gp `[v`]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable Arrow Keys
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

""""""""""""""""""""""""
" vim-airline
""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='nord'
let g:airline_solarized_bg='light'
"let g:airline_section_y = '%{strftime("%c")}'

let g:airline_section_b = '' " hide
let g:airline_section_x = '' " hide
let g:airline_section_y = '' " hide

"""""""""""""""""""""""
" formatting
"""""""""""""""""""""""
au FileType xml exe ":silent %!xmllint --format --recover - 2>/dev/null"
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

""""""""""""""""""""""
" Snippets
""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="<c-e>"

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

" automatically remove buffer of deleted file
let NERDTreeAutoDeleteBuffer = 2

" cleanup visuals
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"""""""""""""""""""""
" deoplete
"""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""
" line highlights
"""""""""""""""""""""
" define line highlight color
highlight LineHighlight ctermbg=darkgray guibg=darkgray

" highlight the current line
nnoremap <Leader>l :call matchadd('LineHighlight', '\%'.line('.').'l')<CR>

" clear all the highlighted lines
nnoremap <Leader>c :call clearmatches()<CR>

"""""""""""""""""""""
" abbreviations
"""""""""""""""""""""
iabbrev teh the
iabbrev destory destroy
iabbrev <expr> ddd strftime('%c')
iabbrev rdsc describe "" do<CR>end<CR>

