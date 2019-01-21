function! s:CheckForRails()
  let current_directory = fnamemodify(bufname("%"), ":p:h")

  while current_directory !=# '/'
    if !empty(glob(current_directory . '/bin/rails'))
      let b:rails_root = current_directory
      doautocmd User RailsLoaded
      return b:rails_root
    else
      let current_directory = fnamemodify(current_directory, ":h")
    endif
  endwhile

  return -1
endfunction

autocmd BufNewFile,BufRead *.rb,*.haml,*.yaml call <SID>CheckForRails()
