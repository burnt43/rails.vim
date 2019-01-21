function! rails#YankTextToGrep(type)
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    execute "normal! `[v`]y"
  else
    return 1
  endif
endfunction

function! rails#GrepMethodDefOperator(type)
  let saved_unamed_register = @@

  if rails#YankTextToGrep(a:type) ==# 0
    silent execute "grep! -R -E " . shellescape('^\s*def\s+(\w+\.)?' . @@ . '(\s*\()?\b') . " ./app ./lib"
    copen
    redraw!
  end

  let @@ = saved_unamed_register
endfunction

function! rails#GrepModuleInclude(type)
  let saved_unamed_register = @@

  if rails#YankTextToGrep(a:type) ==# 0
    silent execute "grep! -R -E " . shellescape( '^\s*include\s*(\(\s*)?' . @@ ) . " ./app ./lib"
    copen
    redraw!
  end

  let @@ = saved_unamed_register
endfunction

function! rails#GrepAll(type)
  let saved_unamed_register = @@

  if rails#YankTextToGrep(a:type) ==# 0
    silent execute "grep! -R -E " . shellescape( @@ ) . " ./app ./lib"
    copen
    redraw!
  end

  let @@ = saved_unamed_register
endfunction
