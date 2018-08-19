function! myspacevim#before() abort
  call SpaceVim#logger#info('myspacevim#before called')
  let g:vim_json_syntax_conceal = 0
endfunction
