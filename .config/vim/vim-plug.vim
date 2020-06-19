" auto-install vim-plug

call plug#begin('~/.vim/autoload/plugged')

" Better Syntax Support
"Plug 'itchyny/lightline.vim'
"let g:lightline = {
" \ 'colorscheme': 'loudpastel',
" \ 'active': {
" \ 	'left': [ [ 'mode', 'paste' ],
" \           	[ 'readonly', 'filename', 'modified', 'charvaluehex' ] ]
" \  },
" \ 'component': {
" \   'charvaluehex': '0x%B'
" \  },
" \}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Auto pairs for '(' '[' '{'

Plug 'jiangmiao/auto-pairs'

Plug 'preservim/nerdtree'
map <C-n> :NERDTreeToggle<CR>

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

Plug 'KeitaNakamura/tex-conceal.vim'
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

call plug#end()
