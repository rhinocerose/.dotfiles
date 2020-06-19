if &cp || !has('conceal') || get(g:, 'loaded_symbolic', 0)
  finish
endif

com! -bang Symbolic call symbolic#Toggle(<bang>0)

let g:loaded_symbolic = 1
