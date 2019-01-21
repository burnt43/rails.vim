function! s:CheckForRails()
  echom "THIS IS A TEST"
endfunction

autocmd BufNewFile,BufRead * call <SID>CheckForRails()
