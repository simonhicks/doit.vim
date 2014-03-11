if exists("g:loaded_do_it_vim")
  finish
endif
let g:loaded_do_it_vim = 1

if !exists("g:do_it_mapping")
  let g:do_it_mapping = "g<CR>"
end

function! s:CreateMapping(str)
  execute "nnoremap <buffer> " . g:do_it_mapping . " " . a:str
  execute "normal " . a:str
endfunction

function! s:CreateDoExMapping(str)
  call s:CreateMapping(":" . a:str . "<CR>")
endfunction

function! s:CreateDoItMapping(str)
  if a:str[0] ==# ":"
    call s:CreateDoExMapping(strpart(a:str, 1, len(a:str)))
  else
    call s:CreateMapping(a:str)
  endif
endfunction

command! -nargs=* -complete=command DoWhat call <SID>CreateDoItMapping(<q-args>)
execute "nnoremap " . g:do_it_mapping . " :DoWhat "
