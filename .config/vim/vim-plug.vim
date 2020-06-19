" auto-install vim-plug

call plug#begin('~/.vim/autoload/plugged')

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

"Plug 'lervag/vimtex'
"let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
"let g:vimtex_quickfix_mode=0

Plug 'KeitaNakamura/tex-conceal.vim'
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

"Plug 'ap/vim-css-color'
"Plug 'chrisbra/colorizer'
Plug 'lilydjwg/colorizer'

Plug 'dag/vim-fish'
Plug 'kien/rainbow_parentheses.vim'

Plug 'Yggdroot/indentLine'

Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
Plug 'machakann/vim-highlightedyank'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'vim-latex/vim-latex'


Plug 'ryanoasis/vim-devicons'
call plug#end()
