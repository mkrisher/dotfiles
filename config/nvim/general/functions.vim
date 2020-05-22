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

" format JSON
com! FormatJSON %!python -m json.tool

