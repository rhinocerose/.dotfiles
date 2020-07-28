" auto-install vim-plug

call plug#begin('~/.vim/autoload/plugged')

Plug 'phenomenes/ansible-snippetc'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-titlecase'
Plug 'christoomey/vim-system-copy'
Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'ervandew/supertab'
Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 ~/.vim/autoload/plugged/YouCompleteMe/install.py --clang-completer' }
let g:ycm_python_binary_path = '/usr/bin/python3'
" Use default config
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" Also autocomplete in comments
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" Also select options with Enter
" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
" Prevent blocking the view with C-y
let g:ycm_key_list_stop_completion = ['<C-y>']
" Invoke completion manually
" let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" Use leader-g to go to declaration
nnoremap <leader>g :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>

Plug 'dense-analysis/ale'
Plug 'saltstack/salt-vim'
Plug 'lepture/vim-jinja'
  au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja

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

Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
" hide *.pyc from nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$', '\.jpg$', '\.png$', '\.o$']
let NERDTreeShowHidden=1
" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open NERDTree with <leader>t
:map <leader>t :NERDTreeToggle<CR>
" Open nerdtree if no file was specified
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()

Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Manage whitespace
Plug 'ntpeters/vim-better-whitespace'
let g:strip_whitespace_confirm=0
autocmd BufEnter * EnableStripWhitespaceOnSave

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
map <c-space> :FZF ~<cr>
map <c-p> :Files .<cr>
map <c-i> :Buffers<cr>

Plug 'jistr/vim-nerdtree-tabs', { 'on':  'NERDTreeToggle' }

" Ansible
Plug 'pearofducks/ansible-vim'

" Easy commenting
Plug 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims            = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs        = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign           = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines                 = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace            = 1

"Plug 'lervag/vimtex'
"let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
"let g:vimtex_quickfix_mode=0

"Plug 'KeitaNakamura/tex-conceal.vim'
"set conceallevel=0
"let g:tex_conceal='abdmg'
"hi Conceal ctermbg=none

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
au BufEnter *.m set conceallevel=0
au BufEnter *.m set concealcursor=
let g:matnicer_greek=1

Plug 'ryanoasis/vim-devicons'
call plug#end()
