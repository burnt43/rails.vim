function! s:CheckForRails()
  echom "THIS IS A TEST"
endfunction

autocmd BufNewFile,BufRead *.rb,*.haml,*.yaml call <SID>CheckForRails()
