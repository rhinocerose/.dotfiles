" auto-install vim-plug

call plug#begin('~/.vim/autoload/plugged')

Plug 'mhinz/vim-startify'
Plug 'amiorin/vim-project'
Plug 'majutsushi/tagbar'

" ____            _
" |  _ \ _   _ ___| |_
" | |_) | | | / __| __|
" |  _ <| |_| \__ \ |_
" |_| \_\\__,_|___/\__|

Plug 'timonv/vim-cargo', { 'for': 'rust' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }


    " _            _       _
   " / \   _ __ __| |_   _(_)_ __   ___
  " / _ \ | '__/ _` | | | | | '_ \ / _ \
 " / ___ \| | | (_| | |_| | | | | | (_) |
" /_/   \_\_|  \__,_|\__,_|_|_| |_|\___/
Plug 'sudar/vim-arduino-snippets'
Plug 'stevearc/vim-arduino'
nnoremap <buffer> <leader>am :ArduinoVerify<CR>
nnoremap <buffer> <leader>au :ArduinoUpload<CR>
nnoremap <buffer> <leader>ad :ArduinoUploadAndSerial<CR>
nnoremap <buffer> <leader>ab :ArduinoChooseBoard<CR>
nnoremap <buffer> <leader>ap :ArduinoChooseProgrammer<CR>

let g:arduino_board = 'arduino:avr:uno'
let g:arduino_programmer = 'avrisp2'

function! MyStatusLine()
  let port = arduino#GetPort()
  let line = '%f [' . g:arduino_board . '] [' . g:arduino_programmer . ']'
  if !empty(port)
    let line = line . ' (' . port . ':' . g:arduino_serial_baud . ')'
  endif
  return line
endfunction
setl statusline=%!MyStatusLine()

" _              _ _     _
"    / \   _ __  ___(_) |__ | | ___
"   / _ \ | '_ \/ __| | '_ \| |/ _ \
"  / ___ \| | | \__ \ | |_) | |  __/
" /_/   \_\_| |_|___/_|_.__/|_|\___|

Plug 'phenomenes/ansible-snippets'
Plug 'pearofducks/ansible-vim'
let g:ansible_name_highlight = 'b'

"  _____ _             ____
" |_   _(_)_ __ ___   |  _ \ ___  _ __   ___
"   | | | | '_ ` _ \  | |_) / _ \| '_ \ / _ \
"   | | | | | | | | | |  __/ (_) | |_) |  __/
"   |_| |_|_| |_| |_| |_|   \___/| .__/ \___|
"                               |_|
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'

  " ____ _ _
 " / ___(_) |_
" | |  _| | __|
" | |_| | | |_
 " \____|_|\__|

Plug 'mhinz/vim-signify'


" _____         _      ___  _     _           _
" |_   _|____  _| |_   / _ \| |__ (_) ___  ___| |_ ___
"  | |/ _ \ \/ / __| | | | | '_ \| |/ _ \/ __| __/ __|
"  | |  __/>  <| |_  | |_| | |_) | |  __/ (__| |_\__ \
"  |_|\___/_/\_\\__|  \___/|_.__// |\___|\___|\__|___/
"                              |__/
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-titlecase'
Plug 'christoomey/vim-system-copy'
Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'


" ____                      _      _   _
" / ___|___  _ __ ___  _ __ | | ___| |_(_) ___  _ __
" | |   / _ \| '_ ` _ \| '_ \| |/ _ \ __| |/ _ \| '_ \
" | |__| (_) | | | | | | |_) | |  __/ |_| | (_) | | | |
" \____\___/|_| |_| |_| .__/|_|\___|\__|_|\___/|_| |_|
"                    |_|
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


" _     _       _   _
" | |   (_)_ __ | |_(_)_ __   __ _
" | |   | | '_ \| __| | '_ \ / _` |
" | |___| | | | | |_| | | | | (_| |
" |_____|_|_| |_|\__|_|_| |_|\__, |
"                           |___/

Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'


"  ____        _ _   ____  _             _
" / ___|  __ _| | |_/ ___|| |_ __ _  ___| | __
" \___ \ / _` | | __\___ \| __/ _` |/ __| |/ /
"  ___) | (_| | | |_ ___) | || (_| | (__|   <
" |____/ \__,_|_|\__|____/ \__\__,_|\___|_|\_\

Plug 'saltstack/salt-vim', { 'for': 'sls' }


"  __  __            _    ____
" |  \/  | __ _ _ __| | _|  _ \  _____      ___ __
" | |\/| |/ _` | '__| |/ / | | |/ _ \ \ /\ / / '_ \
" | |  | | (_| | |  |   <| |_| | (_) \ V  V /| | | |
" |_|  |_|\__,_|_|  |_|\_\____/ \___/ \_/\_/ |_| |_|

" Plug 'MikeCoder/markdown-preview.vim', { 'for': 'markdown' }
" Plug 'JamshedVesuna/vim-markdown-preview'
" let vim_markdown_preview_toggle=1
" let vim_markdown_preview_hotkey='<C-m>'
" let vim_markdown_preview_browser='Mozilla Firefox'
" let vim_markdown_preview_temp_file=1
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
" Plug 'chrisbra/csv.vim', { 'for': 'csv' }

 " ____
" |  _ \  _____  ___   _  __ _  ___ _ __
" | | | |/ _ \ \/ / | | |/ _` |/ _ \ '_ \
" | |_| | (_) >  <| |_| | (_| |  __/ | | |
" |____/ \___/_/\_\\__, |\__, |\___|_| |_|
 "                 |___/ |___/
Plug 'vim-scripts/DoxygenToolkit.vim'

"     _    _      _ _
"    / \  (_)_ __| (_)_ __   ___
"   / _ \ | | '__| | | '_ \ / _ \
"  / ___ \| | |  | | | | | |  __/
" /_/   \_\_|_|  |_|_|_| |_|\___|

Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_detect_modified=1
let g:airline_detect_paste=1

Plug 'vim-airline/vim-airline-themes'


" _   _ _____ ____  ____  _
" | \ | | ____|  _ \|  _ \| |_ _ __ ___  ___
" |  \| |  _| | |_) | | | | __| '__/ _ \/ _ \
" | |\  | |___|  _ <| |_| | |_| | |  __/  __/
" |_| \_|_____|_| \_\____/ \__|_|  \___|\___|

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


" ____        _                  _
" / ___| _ __ (_)_ __  _ __   ___| |_ ___
" \___ \| '_ \| | '_ \| '_ \ / _ \ __/ __|
" ___) | | | | | |_) | |_) |  __/ |_\__ \
" |____/|_| |_|_| .__/| .__/ \___|\__|___/
"              |_|   |_|
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'


" _____                          _   _   _
" |  ___|__  _ __ _ __ ___   __ _| |_| |_(_)_ __   __ _
" | |_ / _ \| '__| '_ ` _ \ / _` | __| __| | '_ \ / _` |
" |  _| (_) | |  | | | | | | (_| | |_| |_| | | | | (_| |
" |_|  \___/|_|  |_| |_| |_|\__,_|\__|\__|_|_| |_|\__, |
"                                                |___/
" Manage whitespace
Plug 'ntpeters/vim-better-whitespace'
let g:strip_whitespace_confirm=0
autocmd BufEnter * EnableStripWhitespaceOnSave

Plug 'kien/rainbow_parentheses.vim'
" Plug 'Yggdroot/indentLine'

Plug 'godlygeek/tabular'
" cucumbertabes script for auto-align tables {{{
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction
"}}}

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
map <c-space> :FZF ~<cr>
map <c-p> :Files .<cr>
map <c-i> :Buffers<cr>

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

"Plug 'ap/vim-css-color', { 'for': 'css' }
"Plug 'chrisbra/colorizer', { 'for': 'css' }
Plug 'lilydjwg/colorizer'

Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
Plug 'lepture/vim-jinja'
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja
Plug 'machakann/vim-highlightedyank'
Plug 'vim-latex/vim-latex', { 'for': 'tex' }
Plug 'neomake/neomake'
Plug 'sickill/vim-pasta'

Plug 'wellle/targets.vim'
Plug 'vim-scripts/YankRing.vim'
Plug 'mileszs/ack.vim'
" nnoremap <leader>a :Ack

Plug 'ervandew/supertab'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'jdelkins/vim-correction'
" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'ryanoasis/vim-devicons'
call plug#end()

set runtimepath^=~/.vim/plugin/Figlet.vim
