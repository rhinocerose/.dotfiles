let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
imap <C-G>S <Plug>ISurround
imap <C-G>s <Plug>Isurround
imap <C-S> <Plug>Isurround
imap <C-J> <Plug>IMAP_JumpForward
inoremap <silent> <Plug>IMAP_JumpBack :call IMAP_Jumpfunc('b', 0)
inoremap <silent> <Plug>IMAP_JumpForward :call IMAP_Jumpfunc('', 0)
inoremap <silent> <C-Tab> =UltiSnips#ListSnippets()
inoremap <silent> <SNR>37_AutoPairsReturn =AutoPairsReturn()
inoremap <C-L> u[s1z=`]au
nnoremap <silent>  :call ToggleConcealLevel()
snoremap <silent>  "_c
xnoremap <silent> 	 :call UltiSnips#SaveLastVisualSelection()gvs
snoremap <silent> 	 :call UltiSnips#ExpandSnippetOrJump()
vmap <NL> <Plug>IMAP_JumpForward
nmap <NL> <Plug>IMAP_JumpForward
xnoremap <silent>  :call multiple_cursors#new("v", 0)
nnoremap <silent>  :call multiple_cursors#new("n", 1)
snoremap  "_c
map  :NERDTreeToggle
xmap S <Plug>VSurround
nmap \tc <Plug>Colorizer
omap al <Plug>(textobj-line-a)
xmap al <Plug>(textobj-line-a)
nmap cS <Plug>CSurround
nmap cs <Plug>Csurround
nmap cV <Plug>SystemPasteLine
xmap cv <Plug>SystemPaste
nmap cv <Plug>SystemPaste
nmap cP <Plug>SystemCopyLine
xmap cp <Plug>SystemCopy
nmap cp <Plug>SystemCopy
nmap ds <Plug>Dsurround
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
xmap gS <Plug>VgSurround
xnoremap <silent> g<M-n> :call multiple_cursors#select_all("v", 0)
xnoremap <silent> gî :call multiple_cursors#select_all("v", 0)
nnoremap <silent> g<M-n> :call multiple_cursors#select_all("n", 0)
nnoremap <silent> gî :call multiple_cursors#select_all("n", 0)
xnoremap <silent> g<C-N> :call multiple_cursors#new("v", 0)
xnoremap <silent> g :call multiple_cursors#new("v", 0)
nnoremap <silent> g<C-N> :call multiple_cursors#new("n", 0)
nnoremap <silent> g :call multiple_cursors#new("n", 0)
nmap gT <Plug>TitlecaseLine
vmap gt <Plug>Titlecase
nmap gt <Plug>Titlecase
vmap gs <Plug>SortMotionVisual
nmap gss <Plug>SortLines
nmap gs <Plug>SortMotion
xmap gr <Plug>ReplaceWithRegisterVisual
nmap grr <Plug>ReplaceWithRegisterLine
nmap gr <Plug>ReplaceWithRegisterOperator
nmap gcu <Plug>Commentary<Plug>Commentary
nmap gcc <Plug>CommentaryLine
omap gc <Plug>Commentary
nmap gc <Plug>Commentary
xmap gc <Plug>Commentary
omap il <Plug>(textobj-line-i)
xmap il <Plug>(textobj-line-i)
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
nnoremap <silent> <Plug>SurroundRepeat .
xnoremap <silent> <M-n> :call multiple_cursors#select_all("v", 0)
nnoremap <silent> <M-n> :call multiple_cursors#select_all("n", 1)
xnoremap <silent> <C-N> :call multiple_cursors#new("v", 0)
nnoremap <silent> <C-N> :call multiple_cursors#new("n", 1)
vmap <C-J> <Plug>IMAP_JumpForward
nmap <C-J> <Plug>IMAP_JumpForward
vnoremap <silent> <Plug>IMAP_JumpBack `<:call IMAP_Jumpfunc('b', 0)
vnoremap <silent> <Plug>IMAP_JumpForward :call IMAP_Jumpfunc('', 0)
vnoremap <silent> <Plug>IMAP_DeleteAndJumpBack "_<Del>:call IMAP_Jumpfunc('b', 0)
vnoremap <silent> <Plug>IMAP_DeleteAndJumpForward "_<Del>:call IMAP_Jumpfunc('', 0)
nnoremap <silent> <Plug>IMAP_JumpBack :call IMAP_Jumpfunc('b', 0)
nnoremap <silent> <Plug>IMAP_JumpForward :call IMAP_Jumpfunc('', 0)
nnoremap <silent> <Plug>Colorizer :ColorToggle
snoremap <C-R> "_c
snoremap <silent> <C-H> "_c
snoremap <silent> <Del> "_c
snoremap <silent> <BS> "_c
snoremap <silent> <C-Tab> :call UltiSnips#ListSnippets()
nnoremap <silent> <Plug>ReplaceWithRegisterVisual :call setline('.', getline('.'))|execute 'silent! call repeat#setreg("\<Plug>ReplaceWithRegisterVisual", v:register)'|call ReplaceWithRegister#SetRegister()|if ReplaceWithRegister#IsExprReg()|    let g:ReplaceWithRegister#expr = getreg('=')|endif|execute 'normal!' ReplaceWithRegister#VisualMode()|call ReplaceWithRegister#Operator('visual', "\<Plug>ReplaceWithRegisterVisual")
vnoremap <silent> <Plug>ReplaceWithRegisterVisual :call setline('.', getline('.'))|execute 'silent! call repeat#setreg("\<Plug>ReplaceWithRegisterVisual", v:register)'|call ReplaceWithRegister#SetRegister()|if ReplaceWithRegister#IsExprReg()|    let g:ReplaceWithRegister#expr = getreg('=')|endif|call ReplaceWithRegister#Operator('visual', "\<Plug>ReplaceWithRegisterVisual")
nnoremap <silent> <Plug>ReplaceWithRegisterLine :call setline('.', getline('.'))|execute 'silent! call repeat#setreg("\<Plug>ReplaceWithRegisterLine", v:register)'|call ReplaceWithRegister#SetRegister()|if ReplaceWithRegister#IsExprReg()|    let g:ReplaceWithRegister#expr = getreg('=')|endif|call ReplaceWithRegister#SetCount()|execute 'normal! V' . v:count1 . "_\<Esc>"|call ReplaceWithRegister#Operator('visual', "\<Plug>ReplaceWithRegisterLine", 1)
nnoremap <silent> <Plug>ReplaceWithRegisterExpressionSpecial :let g:ReplaceWithRegister#expr = getreg('=')|execute 'normal!' v:count1 . '.'
nnoremap <expr> <Plug>ReplaceWithRegisterOperator ReplaceWithRegister#OperatorExpression()
nmap <silent> <Plug>CommentaryUndo :echoerr "Change your <Plug>CommentaryUndo map to <Plug>Commentary<Plug>Commentary"
nnoremap <silent> <C-C><C-Y> :call ToggleConcealLevel()
map <C-T> :NERDTreeToggle
imap S <Plug>ISurround
imap s <Plug>Isurround
inoremap <silent> 	 =UltiSnips#ExpandSnippetOrJump()
imap <NL> <Plug>IMAP_JumpForward
inoremap  u[s1z=`]au
imap  <Plug>Isurround
xnoremap <silent> î :call multiple_cursors#select_all("v", 0)
nnoremap <silent> î :call multiple_cursors#select_all("n", 1)
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
set backspace=indent,eol,start
set backupdir=~/.cache/vim/backup//
set directory=~/.cache/vim/swap//
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set laststatus=2
set ruler
set runtimepath=~/.vim,~/.vim/autoload/plugged/vim-commentary,~/.vim/autoload/plugged/vim-ReplaceWithRegister,~/.vim/autoload/plugged/vim-sort-motion,~/.vim/autoload/plugged/vim-titlecase,~/.vim/autoload/plugged/vim-system-copy,~/.vim/autoload/plugged/vim-indent-object,~/.vim/autoload/plugged/vim-textobj-user,~/.vim/autoload/plugged/vim-textobj-line,~/.vim/autoload/plugged/vim-airline,~/.vim/autoload/plugged/vim-airline-themes,~/.vim/autoload/plugged/auto-pairs,~/.vim/autoload/plugged/nerdtree,~/.vim/autoload/plugged/ultisnips,~/.vim/autoload/plugged/tex-conceal.vim,~/.vim/autoload/plugged/colorizer,~/.vim/autoload/plugged/vim-fish,~/.vim/autoload/plugged/rainbow_parentheses.vim,~/.vim/autoload/plugged/indentLine,~/.vim/autoload/plugged/vim-pandoc-syntax,~/.vim/autoload/plugged/vim-pandoc,~/.vim/autoload/plugged/vim-highlightedyank,~/.vim/autoload/plugged/vim-nerdtree-syntax-highlight,~/.vim/autoload/plugged/vim-latex,~/.vim/autoload/plugged/neomake,~/.vim/autoload/plugged/vim-multiple-cursors,~/.vim/autoload/plugged/vim-pasta,~/.vim/autoload/plugged/vim-surround,~/.vim/autoload/plugged/vim-json,~/.vim/autoload/plugged/csv.vim,~/.vim/autoload/plugged/vim-matnicer,~/.vim/autoload/plugged/vim-devicons,/usr/share/vim/vimfiles,/usr/share/vim/vim82,/usr/share/vim/vimfiles/after,~/.vim/autoload/plugged/ultisnips/after,~/.vim/autoload/plugged/tex-conceal.vim/after,~/.vim/autoload/plugged/indentLine/after,~/.vim/autoload/plugged/vim-nerdtree-syntax-highlight/after,~/.vim/autoload/plugged/vim-matnicer/after,~/.vim/after
set showtabline=2
set suffixes=.bak,~,.o,.info,.swp,.aux,.bbl,.blg,.brf,.cb,.dvi,.idx,.ilg,.ind,.inx,.jpg,.log,.out,.png,.toc
set tabline=%!airline#extensions#tabline#get()
set undodir=~/.cache/vim/undo//
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.dotfiles/.config/vim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd vim-plug.vim
edit ~/.vim/vimrc
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 134 + 134) / 268)
exe 'vert 2resize ' . ((&columns * 133 + 134) / 268)
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <M-n> :call AutoPairsJump()a
inoremap <buffer> <silent> <expr> <M-p> AutoPairsToggle()
inoremap <buffer> <silent> <M-b> =AutoPairsBackInsert()
inoremap <buffer> <silent> <M-e> =AutoPairsFastWrap()
inoremap <buffer> <silent> <C-H> =AutoPairsDelete()
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <silent> <M-'> =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> <M-"> =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> <M-}> =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> <M-{> =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> <M-]> =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> <M-[> =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> <M-)> =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> <M-(> =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> § =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> ¢ =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> © =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> ¨ =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> î :call AutoPairsJump()a
inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
inoremap <buffer> <silent> ý =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> û =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> Ý =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
xmap <buffer> P <Plug>VisualPasta
nmap <buffer> P <Plug>BeforePasta
vnoremap <buffer> <silent> [" :exe "normal! gv"|call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
nnoremap <buffer> <silent> [" :call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
vnoremap <buffer> <silent> [] m':exe "normal! gv"|call search('^\s*endf\%[unction]\>', "bW")
nnoremap <buffer> <silent> [] m':call search('^\s*endf\%[unction]\>', "bW")
vnoremap <buffer> <silent> [[ m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "bW")
nnoremap <buffer> <silent> [[ m':call search('^\s*fu\%[nction]\>', "bW")
vnoremap <buffer> <silent> ]" :exe "normal! gv"|call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
nnoremap <buffer> <silent> ]" :call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
vnoremap <buffer> <silent> ][ m':exe "normal! gv"|call search('^\s*endf\%[unction]\>', "W")
nnoremap <buffer> <silent> ][ m':call search('^\s*endf\%[unction]\>', "W")
vnoremap <buffer> <silent> ]] m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "W")
nnoremap <buffer> <silent> ]] m':call search('^\s*fu\%[nction]\>', "W")
xmap <buffer> p <Plug>VisualPasta
nmap <buffer> p <Plug>AfterPasta
noremap <buffer> <silent> <M-n> :call AutoPairsJump()
noremap <buffer> <silent> <M-p> :call AutoPairsToggle()
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
noremap <buffer> <silent> î :call AutoPairsJump()
noremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",:\"
setlocal commentstring=\"%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=inc
set conceallevel=2
setlocal conceallevel=2
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'vim'
setlocal filetype=vim
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetVimIndent()
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e,=end,=},=else,=cat,=fina,=END,0\\,0=\"\\\ 
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,#
setlocal keywordprg=:help
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=8
setlocal noshortname
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!airline#statusline(1)
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'vim'
setlocal syntax=vim
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tagfunc=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=78
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal wincolor=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
if bufexists("vim-plug.vim") | buffer vim-plug.vim | else | edit vim-plug.vim | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <M-n> :call AutoPairsJump()a
inoremap <buffer> <silent> <expr> <M-p> AutoPairsToggle()
inoremap <buffer> <silent> <M-b> =AutoPairsBackInsert()
inoremap <buffer> <silent> <M-e> =AutoPairsFastWrap()
inoremap <buffer> <silent> <C-H> =AutoPairsDelete()
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <silent> <M-'> =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> <M-"> =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> <M-}> =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> <M-{> =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> <M-]> =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> <M-[> =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> <M-)> =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> <M-(> =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> § =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> ¢ =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> © =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> ¨ =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> î :call AutoPairsJump()a
inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
inoremap <buffer> <silent> ý =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> û =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> Ý =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
xmap <buffer> P <Plug>VisualPasta
nmap <buffer> P <Plug>BeforePasta
vnoremap <buffer> <silent> [" :exe "normal! gv"|call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
nnoremap <buffer> <silent> [" :call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
vnoremap <buffer> <silent> [] m':exe "normal! gv"|call search('^\s*endf\%[unction]\>', "bW")
nnoremap <buffer> <silent> [] m':call search('^\s*endf\%[unction]\>', "bW")
vnoremap <buffer> <silent> [[ m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "bW")
nnoremap <buffer> <silent> [[ m':call search('^\s*fu\%[nction]\>', "bW")
vnoremap <buffer> <silent> ]" :exe "normal! gv"|call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
nnoremap <buffer> <silent> ]" :call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
vnoremap <buffer> <silent> ][ m':exe "normal! gv"|call search('^\s*endf\%[unction]\>', "W")
nnoremap <buffer> <silent> ][ m':call search('^\s*endf\%[unction]\>', "W")
vnoremap <buffer> <silent> ]] m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "W")
nnoremap <buffer> <silent> ]] m':call search('^\s*fu\%[nction]\>', "W")
xmap <buffer> p <Plug>VisualPasta
nmap <buffer> p <Plug>AfterPasta
noremap <buffer> <silent> <M-n> :call AutoPairsJump()
noremap <buffer> <silent> <M-p> :call AutoPairsToggle()
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
noremap <buffer> <silent> î :call AutoPairsJump()
noremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",:\"
setlocal commentstring=\"%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=inc
set conceallevel=2
setlocal conceallevel=2
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'vim'
setlocal filetype=vim
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetVimIndent()
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e,=end,=},=else,=cat,=fina,=END,0\\,0=\"\\\ 
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,#
setlocal keywordprg=:help
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=8
setlocal noshortname
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!airline#statusline(2)
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'vim'
setlocal syntax=vim
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tagfunc=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=78
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal wincolor=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 134 + 134) / 268)
exe 'vert 2resize ' . ((&columns * 133 + 134) / 268)
tabnext 1
badd +0 vim-plug.vim
badd +0 ~/.vim/vimrc
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOS
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
