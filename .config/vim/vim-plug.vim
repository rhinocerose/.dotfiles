" auto-install vim-plug

call plug#begin('~/.vim/autoload/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-titlecase'
Plug 'christoomey/vim-system-copy'
Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'

if has('python3') && has('timers')
  Plug 'AlphaMycelium/pathfinder.vim'
else
  echoerr 'pathfinder.vim is not supported on this Vim installation'
endif

Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_detect_modified=1
let g:airline_detect_paste=1

Plug 'vim-airline/vim-airline-themes'

" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'

Plug 'preservim/nerdtree'
map <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"Plug 'lervag/vimtex'
"let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
"let g:vimtex_quickfix_mode=0

Plug 'KeitaNakamura/tex-conceal.vim'
set conceallevel=2
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
Plug 'neomake/neomake'
Plug 'terryma/vim-multiple-cursors'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-surround'
Plug 'elzr/vim-json'
Plug 'chrisbra/csv.vim'

"Plug 'fweep/vim-tabber'
"set tabline=%!tabber#TabLine()

Plug 'capitancambio/vim-matnicer'
au BufEnter *.m set conceallevel=2
au BufEnter *.m set concealcursor=
let g:matnicer_greek=1

Plug 'ryanoasis/vim-devicons'
call plug#end()
