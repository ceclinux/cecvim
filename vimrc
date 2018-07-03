"number of colors set to 256
set t_Co=256
"
if &term =~ '256color'
    set t_ut=
endif
" let g:solarized_termcolors=256
"The leader key is mapped to ,
let g:mapleader=','
"This option has the effect of making Vim either more Vi-compatible, or
"make Vim behave in a more useful way.
"This is a special kind of option, because when it's set or reset,
"other options are also changed as a side effect.  CAREFUL: Setting or
"resetting this option can have a lot of unexpected effects: Mappings
"are interpreted in another way, undo behaves differently, etc.  If you
"set this option in your vimrc file, you should probably put it at the
"very start.
"By default this option is on and the Vi defaults are used for the
"options.  This default was chosen for those people who want to use Vim
"just like Vi, and don't even (want to) know about the 'compatible'
"option.
"When a |vimrc| or |gvimrc| file is found while Vim is starting up,
"this option is switched off, and all options that have not been
"modified will be set to the Vim defaults.  Effectively, this means
"that when a |vimrc| or |gvimrc| file exists, Vim will use the Vim
"defaults, otherwise it will use the Vi defaults.  (Note: This doesn't
"happen for the system-wide vimrc or gvimrc file, nor for a file given
"with the |-u| argument).  Also see |compatible-default| and
"|posix-compliance|.
"You can also set this option with the "-C" argument, and reset it with
""-N".  See |-C| and |-N|.
"Switching this option off makes the Vim defaults be used for options
"that have a different Vi and Vim default value.  See the options
"marked with a '+' below.  Other options are not modified.
"At the moment this option is set, several other options will be set
"or reset to make Vim as Vi-compatible as possible.  See the table
"below.  This can be used if you want to revert to Vi compatible
"editing.
"See also 'cpoptions'.

" be iMproved
set nocompatible
"Detail: The ":filetype on" command will load one of these files: "     Amiga       $VIMRUNTIME/filetype.vim
"       Mac     $VIMRUNTIME:filetype.vim
"       MS-DOS      $VIMRUNTIME\filetype.vim
"       RiscOS      Vim:Filetype
"       Unix        $VIMRUNTIME/filetype.vim
"       VMS     $VIMRUNTIME/filetype.vim
"   This file is a Vim script that defines autocommands for the
"   BufNewFile and BufRead events.  If the file type is not found by the
"   name, the file $VIMRUNTIME/scripts.vim is used to detect it from the
"   contents of the file.
"   When the GUI is running or will start soon, the menu.vim script is
"   also sourced.  See |'go-M'| about avoiding that.
"
"
" This is a list of directories which will be searched for runtime files:
" rtp = runtimepath
call plug#begin('~/.vim/plugged')
" Lines with equal indent form a fold
set fdm=indent

"Plug 'morhetz/gruvbox'
Plug 'easymotion/vim-easymotion'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'rhysd/vim-crystal'
"Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

"
" Brief help
" :PlugList          - list configured bundles
" :PlugInstall(!)    - install(update) bundles
" :PlugSearch(!) foo - search(or refresh cache first) for foo
" :PlugClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plug command are not allowed..


"Bundle 'tomasr/molokai'
"Plug 'taglist.vim'
""不同时显示多个文件的tag，只显示当前文件的
"let Tlist_Show_One_File = 1
""如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Exit_OnlyWindow = 1
""在右侧窗口中显示taglist窗口
"let Tlist_Use_Right_Window = 1
""自动代开taglist窗口
"let Tlist_Auto_Open = 1
""Close tag folds for inactive buffers.
"let Tlist_File_Fold_Auto_Close = 1

"precede each line with its line number"
set nu


" use ag to search
":Ag keyword
" NOTE: require install ag in your mathine
"Plug 'rking/ag.vim'

" Turn backup on
set backup
" Set backup directory
set backupdir=$HOME/.vim/backup
" Keep more backups for one file

autocmd BufWritePre * let &backupext = strftime(".%m-%d-%H-%M")
"<leader> cs comment a block"
"<leader>cspace to comment out and reverse comment
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1

"Show the undo tree"
Plug 'sjl/gundo.vim'
map <leader>gg :GundoToggle<CR>

"Plug 'msanders/snipmate.vim'
Plug 'SirVer/ultisnips'


"When jumping on a tag, automatically split the window if the current buffer
"has been modified
fun! SPLITAG() range
    let oldfile=expand("%:p")
    if &modified
        split
    endif
    exe "tag ". expand("<cword>")
    let curfile=expand("%:p")
    if curfile == oldfile
        let pos=getpos(".")
        if &modified
            " if we have split before:
            quit
        endif
        call setpos('.', pos)
    endif
endfun
nmap <C-]> :call SPLITAG()<CR>z.

"polish complete problem
set completeopt=longest,menuone

"handle the chinese problem
set encoding=utf-8
set fileencodings=utf8,cp936,gb18030,big5

autocmd FileType python setlocal et sta sw=4 sts=4
set tabstop=4
set softtabstop=4
set linebreak "单词换行
set incsearch " 查询时非常方便，如要查找book单词，当输入到/b时，会自动找到
" 第一个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的
" " 找要匹配的单词时，别忘记回车

"auto generate ctags"
"au BufWritePost *.sh,*.c,*.py,*.js silent! !ctags -R &> /dev/null &

"config code fold"
set foldmethod=indent
set foldlevel=99

set conceallevel=1

"C-A + key to activate emmet
Plug 'mattn/emmet-vim'

let g:user_emmet_settings = {
            \  'php' : {
            \    'extends' : 'html',
            \    'filters' : 'c',
            \  },
            \  'xml' : {
            \    'extends' : 'html',
            \  },
            \  'haml' : {
            \       'extends' : 'html',
            \  },
            \}


autocmd FileType html imap <tab> <plug>(EmmetExpandAbbr)

Plug 'othree/html5.vim'
Plug 'vim-scripts/c.vim'
Plug 'pangloss/vim-javascript'


autocmd FileType mkd inoremap ` ``<Left>
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=markdown syntax=markdown

map <F10> :set spell! <CR>

Plug 'nono/jquery.vim'
"required by jquery.vim
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile  *.ejs set filetype=html syntax=html

"Plug 'Lokaltog/vim-powerline'
"let g:Powerline_symbols = 'fancy'

Plug 'vim-scripts/awk.vim'


Plug 'xolox/vim-misc'

set ts=4
"scrollbarwidth"
set sw=4
set expandtab
set autoindent
set smartindent

" <alt>键的映射~
" Author:       lilydjwg <lilydjwg@gmail.com>
" ---------------------------------------------------------------------
" Load Once:
if &cp || exists("g:loaded_escalt") || has("gui_running") || has("win32") || has("win64")
    finish
endif
let s:keepcpo = &cpo
let g:loaded_escalt = 1
set cpo&vim
" ---------------------------------------------------------------------
" Functions:
function Escalt_console()
    for i in range(48, 57) + range(65, 90) + range(97, 122)
        exe "set <M-".nr2char(i).">=\<Esc>".nr2char(i)
    endfor
    " 10, 22, 34, 62, 124 can't be set
    set <M-,>=,
    set <M-.>=.
    set ttimeoutlen=1
    " xterm keys, may also work in tmux with xterm-keys on
    set <F1>=OP
    set <F2>=OQ
    set <F3>=OR
    set <F4>=OS
    set <Home>=OH
    set <End>=OF
    set <S-Delete>=[3;2~
    if exists("$TMUX")
        set <S-F1>=[1;2P
        set <S-F2>=[1;2Q
        set <S-F3>=[1;2R
        set <S-F4>=[1;2S
        set <S-F5>=[15;2~
        set <S-F6>=[17;2~
        set <S-F7>=[18;2~
        set <S-F8>=[19;2~
        set <S-F9>=[20;2~
        set <S-F10>=[21;2~
        set <S-F11>=[23;2~
        set <S-F12>=[24;2~
        set <Home>=[1~
        set <End>=[4~
        " In xterm and tmux
        " 2 & 3 are Ins and Del, 5 & 6 are PgUp and PgDn
    elseif &term == 'linux'
        " Linux console keys, only S-F3 & S-F5 actually works
        " set <S-F1>=[25~
        " set <S-F2>=[26~
        set <S-F3>=[28~
        " set <S-F4>=[29~
        set <S-F5>=[31~
        " set <S-F6>=[32~
        " set <S-F7>=[33~
        " set <S-F8>=[34~
    else
        set <S-F1>=O1;2P
        set <S-F2>=O1;2Q
        set <S-F3>=O1;2R
        set <S-F4>=O1;2S
    endif
endfunction
" ---------------------------------------------------------------------
" Call Functions:
call Escalt_console()
" ---------------------------------------------------------------------
" Restoration And Modelines:
let &cpo= s:keepcpo
unlet s:keepcpo
" vim:fdm=expr:fde=getline(v\:lnum-1)=~'\\v"\\s*-{20,}'?'>1'\:1

for i in range(1, 9)
    exec 'nnoremap <silent> <M-' . i . '> '. i .'gt'
endfor

"call ctrlp using <c-p>
Plug 'ctrlpvim/ctrlp.vim'
"call ctrld to toggle filepath search
"ctrlp忽略node_modules"
let g:ctrlp_custom_ignore = {
            \ 'dir':  'node_modules/',
            \ }

Plug 'lilydjwg/fcitx.vim'

set runtimepath^=~/.vim/bundle/ctrlp.vim

nnoremap <silent> <M-x> f)
nnoremap <silent> <M-b> f(a
nnoremap <silent> <M-f> $
nnoremap <silent> <M-g> %
nnoremap <silent> <M-k> K
nnoremap <silent> <M-h> H
nnoremap <silent> <M-l> L
nnoremap <silent> <M-p> "+p
nnoremap <silent> <M-a> A
nnoremap <silent> <M-o> O
nnoremap <silent> <M-d> bdw
nnoremap <silent> <M-v> <C-V>
nnoremap <silent> <M-r> <C-r>
nnoremap <silent> <M-c> C
nnoremap <silent> <M-e> d%
nnoremap <silent> <M-q> G
nnoremap <silent> <M-w> <C-W><C-W>
nnoremap <silent> <M-z> ZZ
nnoremap <silent> <M-s> :w<CR>
nnoremap <silent> <M-u> <C-x><C-]>

"括号{}等成对删除添加
"If you type <S-BS> (shift + backspace) instead, only the closing delimiter
"will be deleted.
Plug 'Raimondi/delimitMate'


""Plug 'junegunn/goyo.vim'

"After doing all the startup stuff, including
"loading .vimrc files, executing the "-c cmd"
"arguments, creating all windows and loading
"the buffers in them.
""autocmd VimEnter * Goyo 100

"delete surroundings in pair, ds' deletes a pair of '
Plug 'tpope/vim-surround'

"gq拆行
"set textwidth=78

"Tabularize plugin
" :Tabularize /,按照逗号对齐


"Plug 'scrooloose/syntastic'


"语法提示
"Plug 'walm/jshint.vim'
"保存之前自动quickfix"
"autocmd BufWritePre *.js JSHint
""quickfix映射
""下一个错误
nmap <leader>cd :cn<cr>
""上一个错误
nmap <leader>cp :cp<cr>

"自动产生session插件
Plug 'tpope/vim-obsession'
au BufWritePost * Obsession ~/.vim/session/vimsession

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

"statusline插件"
"h airline
Plug 'bling/vim-airline'

" 显示tab和空格
set list
" 设置tab和空格样式
set lcs=tab:\|\ ,nbsp:%,trail:-
" 设定行首tab为灰色
highlight LeaderTab guifg=#666666
" 匹配行首tab
match LeaderTab /^\t/

"tricks
"diw delete the current word
"dib delete inner '(' ')' block
"diB delelte inner '{' '}' paragraph
".! external command and dump the output of the command into your current
"window

"自动配对html tag
Plug 'gregsexton/MatchTag'


" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <S-Insert> "+gP

cmap <C-V> <C-R>+
cmap <S-Insert> <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert> <C-V>
vmap <S-Insert> <C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q> <C-V>

"高亮indent"
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=Grey
hi IndentGuidesEven ctermbg=LightCyan
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

set hlsearch

"按C-N就选择一个单词，连续按就连续选择同样的单词
"CTRL-P in Visual mode will remove the current virtual cursor and go back to
"the previous virtual cursor location. This is useful if you are trigger happy
"with Ctrl-n and accidentally went too far.

"CTRL-X in Visual mode will remove the current virtual cursor and skip to the
"next virtual cursor location. This is useful if you don't want the current
"selection to be a candidate to operate on later.
Plug 'terryma/vim-multiple-cursors'
set complete+=kspell

"Plug 'davidhalter/jedi-vim'
"let g:jedi#auto_initialization = 0
"let g:jedi#popup_select_first=0
"let g:jedi#popup_on_dot = 0

Plug 'mattn/webapi-vim'
"a gist wrapper"
Plug 'mattn/gist-vim'
let g:gist_list_vsplit = 1

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
nmap <leader>f :NERDTreeToggle<cr>
"在insert模式下向右移动一格
inoremap <leader><F3> <Esc><right>a
autocmd FileType javascript map <leader>5 <Esc>:w<CR>:!node %:p<CR>
autocmd FileType html map <leader>5 <Esc>:w<CR>:!google-chrome  %:p<CR>
autocmd fileType sh map <leader>5 <Esc>:w<CR>:!zsh %:p<CR>
autocmd FileType perl map <leader>5 <Esc>:w<CR>:!perl %:p<CR>
autocmd FileType python map <leader>5 <Esc>:w<CR>:!python %:p<CR>
autocmd FileType ruby map <leader>5 <Esc>:w<CR>:rubyf %:p<CR>
"按K翻译当前单词
autocmd FileType mkd set keywordprg=fanyi
autocmd FileType text set keywordprg=fanyi

map <leader>p "+p
"在单词外圈加成对符号
nmap <leader>v :vsp ~/.vimrc<CR>
"按, + t开一个新的tab
nmap <leader>t :tabnew<CR><C-P>

"自动整理代码代码
Plug 'Chiel92/vim-autoformat'
"autocmd QuitPre *.py,*.js Autoformat redraw!
Plug 'mhinz/vim-startify'

set hidden
"When a file has been detected to have been changed outside of Vim and
"it has not been changed inside of Vim, automatically read it again.
set autoread

nmap <leader>s :ter ++rows=10<CR>
Plug 'tpope/vim-fugitive'
nmap <leader>g :Gstatus<CR>
nmap <leader>c :Gcommit<CR>

"set textwidth of the gitcommit
set background=dark
autocmd Filetype gitcommit setlocal spell textwidth=72

let g:molokai_original = 1
let g:rehash256 = 1

autocmd BufNewFile,Bufread *.asm set ft=masm
autocmd BufWritePre *.js redraw!
autocmd FileType masm call AssemblyConfig()

function AssemblyConfig()
    setlocal softtabstop=8
    setlocal tabstop=8
    setlocal noexpandtab
    retab
endfunction

"s             Toggle sort order between name and file order.
"x             Toggle zooming the window.
"p             Jump to the tag under the cursor, but stay in the Tagbar window.
"P             Toggle the Preview Window

"Plug 'klen/python-mode'
"
Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

nnoremap <leader>gd :YcmCompleter GoTo<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gp :YcmCompleter GetParent<CR>
let g:ycm_confirm_extra_conf = 0

let g:tagbar_ctags_bin='/usr/bin/ctags'

Plug 'nanotech/jellybeans.vim'

"A plugin to toggle, display and navigate marks
Plug 'kshenoy/vim-signature'
"required by vim-markdown
Plug 'godlygeek/tabular'
autocmd BufWritePre *.json Tab /:
Plug 'plasticboy/vim-markdown'
"Plug 'suan/vim-instant-markdown'
let g:vim_markdown_math = 1


"Plug 'scrooloose/syntastic'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_full_redraws= 1
"let g:syntastic_error_symbol = "✗"
"let g:syntastic_warning_symbol = "⚠"

Plug 'altercation/vim-colors-solarized'
set background=dark

"When set to "dark", Vim will try to use colors that look good on a
"   dark background.  When set to "light", Vim will try to use colors that
"   look good on a light background.

"set colorcolumn=78
set tw=78
set showbreak=↪

Plug 'mhinz/vim-signify'
Plug 'rhysd/vim-grammarous'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/vim-easy-align'

"install oh-my-zsh
command Ohmyzsh execute '!sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"'

Plug 'kien/rainbow_parentheses.vim'

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

map <leader>b :ls<CR>
map <leader>n :bn<CR>
map <leader>p :bp<CR>

set wildmenu

"indent ocaml code
Plug 'let-def/ocp-indent-vim'

"https://github.com/majutsushi/tagbar/wiki#ruby
let g:tagbar_type_ruby = {
            \ 'kinds' : [
            \ 'm:modules',
            \ 'c:classes',
            \ 'd:describes',
            \ 'C:contexts',
            \ 'f:methods',
            \ 'F:singleton methods'
            \ ]
            \ }

nmap <leader>u :pu<CR>

autocmd Filetype scss setlocal ts=2 sw=2 expandtab

Plug 'tpope/vim-rails'
Plug 'honza/vim-snippets'
Plug 'w0rp/ale'
Plug 'IN3D/vim-raml'
Plug 'cocopon/iceberg.vim'

"let g:snippets_dir = '~/.vim/.plugged/vim-snippets/snippets'

nnoremap <leader>o :CtrlPMRU<CR>
nnoremap  <leader>l :CtrlPLine %<CR>
map <leader>w :CtrlPLine<CR><C-\>w
let g:startify_files_number = 30
command S Startify
command T TagbarToggle

"open comline window by default
nnoremap : :<C-F>a
"startify look the session at ~/.vim
let g:startify_session_dir = '~/.vim/session'
highlight StartifyBracket ctermfg=240
highlight StartifyFooter  ctermfg=240
highlight StartifyHeader  ctermfg=114
highlight StartifyNumber  ctermfg=215
highlight StartifyPath    ctermfg=245
highlight StartifySlash   ctermfg=240
highlight StartifySpecial ctermfg=240

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'sheerun/vim-polyglot'

set undofile                " Save undo's after file closes
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

"add icon for file types
Plug 'ryanoasis/vim-devicons'
Plug 'gregsexton/gitv'

"when doing incsearch, all the words are highlighed when searching
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-rhubarb'

Plug 'tacahiroy/ctrlp-funky'
Plug 'majutsushi/tagbar'
Plug 'metakirby5/codi.vim'
Plug 'whatyouhide/vim-gotham'

Plug 'tpope/vim-endwise'
call plug#end()
" colorscheme gotham256
" colorscheme solarized
"colorscheme gruvbox
colorscheme nord
let g:formatterpath = ['/usr/bin/ruby-beautify']

autocmd FileType ruby set expandtab
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType ruby set autoindent
autocmd FileType ruby map <leader>; abinding.pry

let g:airline_section_c = airline#section#create(['%{getcwd()}  %F'])

let g:airline_powerline_fonts = 1

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


let delimitMate_jump_expansion = 1
au FileType tcl let b:delimitMate_jump_expansion = 1

autocmd BufReadPost * if &filetype == "" | setlocal ft=text | endif

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
runtime macros/matchit.vim

let g:ruby_indent_assignment_style = 'hanging'
let test#strategy = "dispatch"
autocmd QuickFixCmdPost *grep* cwindow

" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" center startify
function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction
let g:startify_custom_header = s:filter_header(startify#fortune#cowsay())
<

let g:ale_fixers = {
\   'ruby': ['rubocop'],
\}
" let g:ale_fix_on_save = 1
command W w !sudo tee % > /dev/null

" open snip list
map <leader>fs :Snip<CR>
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--no-hscroll'},'up:60%')
  \           : fzf#vim#with_preview({'options': '--no-hscroll'},'right:50%'),
  \   <bang>0)

map <leader>k :Gcd<CR>:GGrep<CR>
map <leader>z :term byobu<CR>
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_cursor_line_number_background = 1
hi Comment cterm=italic
hi Italic cterm=italic
hi IncSearchMatch ctermfg=0 ctermbg=9 guifg=#000000 guibg=#FF0000
hi rubyClassName gui=underline cterm=underline
set cursorline

let g:incsearch#magic = '\v' " very magic

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
