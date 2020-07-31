" auto-install vim-plug

call plug#begin('~/.vim/autoload/plugged')

Plug 'timonv/vim-cargo'
Plug 'rust-lang/rust.vim'


Plug 'wellle/targets.vim'
Plug 'vim-scripts/YankRing.vim'
Plug 'mileszs/ack.vim'
nnoremap <leader>a :Ack

Plug 'tpope/vim-abolish'
Plug 'jdelkins/vim-correction'


Plug 'fadeinvvim/FIGlet'

Plug 'phenomenes/ansible-snippets'
Plug 'pearofducks/ansible-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-obsession'
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-titlecase'
Plug 'christoomey/vim-system-copy'
Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 ~/.vim/autoload/plugged/YouCompleteMe/install.py --clang-completer' }
let g:ycm_python_binary_path = '/usr/bin/python3'
" Use default config " let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" Also autocomplete in comments
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" Also select options with Enter
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
" Prevent blocking the view with C-y
let g:ycm_key_list_stop_completion = ['<C-y>']
" Invoke completion manually
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" Use leader-g to go to declaration
nnoremap <leader>g :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>

Plug 'dense-analysis/ale'
Plug 'saltstack/salt-vim'
Plug 'MikeCoder/markdown-preview.vim', { 'for': 'markdown' }
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

" ==================================================================
"  _   _ _____ ____  ____    _____ ____  _____ _____
" | \ | | ____|  _ \|  _ \  |_   _|  _ \| ____| ____|
" |  \| |  _| | |_) | | | |   | | | |_) |  _| |  _|
" | |\  | |___|  _ <| |_| |   | | |  _ <| |___| |___
" |_| \_|_____|_| \_\____/    |_| |_| \_\_____|_____|
" ===================================================================
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" hide *.pyc from nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$', '\.jpg$', '\.png$', '\.o$']
let NERDTreeShowHidden=1
" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open NERDTree with <leader>t
:map <leader>T :NERDTreeToggle<CR>
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
Plug 'vim-latex/vim-latex'
Plug 'neomake/neomake'
Plug 'terryma/vim-multiple-cursors'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'elzr/vim-json'
Plug 'chrisbra/csv.vim'

Plug 'ryanoasis/vim-devicons'
call plug#end()
