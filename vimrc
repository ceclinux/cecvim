set t_Co=256
"g:valuename 变量为全局变量
let g:solarized_termcolors=256
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
"Detail: The ":filetype on" command will load one of these files: "		Amiga	    $VIMRUNTIME/filetype.vim
"		Mac	    $VIMRUNTIME:filetype.vim
"		MS-DOS	    $VIMRUNTIME\filetype.vim
"		RiscOS	    Vim:Filetype
"		Unix	    $VIMRUNTIME/filetype.vim
"		VMS	    $VIMRUNTIME/filetype.vim
"	This file is a Vim script that defines autocommands for the
"	BufNewFile and BufRead events.  If the file type is not found by the
"	name, the file $VIMRUNTIME/scripts.vim is used to detect it from the
"	contents of the file.
"	When the GUI is running or will start soon, the menu.vim script is
"	also sourced.  See |'go-M'| about avoiding that.
"
"
filetype off                   " required!
" This is a list of directories which will be searched for runtime files:
set rtp+=~/.vim/bundle/Vundle.vim
" Lines with equal indent form a fold
set fdm=indent

call vundle#rc() " let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" My Bundles here: "
" original repos on github
"a git wrapper"
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'vim-scripts/FuzzyFinder'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..



Bundle 'taglist.vim'
"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File = 1
"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1
"在右侧窗口中显示taglist窗口
let Tlist_Use_Right_Window = 1
"自动代开taglist窗口
let Tlist_Auto_Open = 1		
"Close tag folds for inactive buffers.
let Tlist_File_Fold_Auto_Close = 1

"precede each line with its line number"
set nu
"type rw to refactor script map <expr> rw Replace_Current_Word()
map <expr> rw Replace_Current_Word()
func Replace_Current_Word()
    "<cword>    is replaced with the word under the cursor (like |star|)
    let w = expand("<cword>")
    "string连接用.即可"
    return "\<ESC>:%s/\\<".w."\\>/".w."/g\<Left>\<Left>"
endfun

"基于ag的文件内搜索的插件"
":Ag 输入关键字
Bundle 'rking/ag.vim'
Bundle 'dyng/ctrlsf.vim'

" vim备份脚本
" Turn backup on
set backup
" Set backup directory
set backupdir=$HOME/.vim/backup
" Keep more backups for one file
" String wich is appended to a file name to make the name of the backup file"
"Examples: >
"	echo "tabstop is " . &tabstop
"	if &insertmode
"
autocmd BufWritePre * let &backupext = strftime(".%m-%d-%H-%M")
autocmd BufWritePre * Autoformat
"<leader> cs comment a block"
"<leader>cspace to comment out and reverse comment
Bundle 'scrooloose/nerdcommenter'

"Show the undo tree"
Bundle 'Gundo'
map <leader>g :GundoToggle<CR>

Bundle 'msanders/snipmate.vim'


"When jumping on a tag, automatically split the window if the current buffer has been modified
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

"polish complete problem"
set completeopt=longest,menuone

"handle the chinese problem"
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

Bundle 'morhetz/gruvbox'

set conceallevel=1

map <F8> :w<CR>:qa!<CR>

Bundle 'mattn/emmet-vim'

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

Bundle 'othree/html5.vim'

let g:user_emmet_leader_key = '<C-A>'

Bundle 'vim-scripts/c.vim'
Bundle 'pangloss/vim-javascript'

au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd syntax=markdown

autocmd FileType mkd inoremap <F4> ![]()<Left>
autocmd FileType mkd inoremap ` ``<Left>

map <F10> :set spell! <CR>

Bundle 'nono/jquery.vim'

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile  *.ejs set filetype=html syntax=html

Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols = 'fancy'

Bundle 'vim-scripts/awk.vim'

Bundle 'altercation/vim-colors-solarized'
"When set to "dark", Vim will try to use colors that look good on a
"	dark background.  When set to "light", Vim will try to use colors that
"	look good on a light background.
syntax enable
set background=dark
colorscheme solarized

Bundle 'vim-misc'

Bundle 'maksimr/vim-jsbeautify'

set ts=4
"scrollbarwidth"
set sw=4
set expandtab
set autoindent
set smartindent

au BufWritePost *.tex call UpdateTex()

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

"神级插件,ctrlp呼出"
Bundle 'kien/ctrlp.vim'
"ctrlp忽略node_modules"
let g:ctrlp_custom_ignore = {
            \ 'dir':  'node_modules/',
            \ }

Bundle 'lilydjwg/fcitx.vim'

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

Bundle 'vim-scripts/EasyGrep'

"括号{}等成对删除添加
"If you type <S-BS> (shift + backspace) instead, only the closing delimiter
"will be deleted.
Bundle 'Raimondi/delimitMate'



""Bundle 'junegunn/goyo.vim'

"After doing all the startup stuff, including
"loading .vimrc files, executing the "-c cmd"
"arguments, creating all windows and loading
"the buffers in them.
""autocmd VimEnter * Goyo 100

"can post gist in vim

Bundle 'tpope/vim-surround'


"gq拆行"
"set textwidth=78


"对齐插件"
Bundle 'godlygeek/tabular'
autocmd BufWritePre *.json Tab /:


"Bundle 'scrooloose/syntastic'


"语法提示
"Bundle 'walm/jshint.vim'
"保存之前自动quickfix"
"autocmd BufWritePre *.js JSHint
""quickfix映射
""下一个错误
nmap <leader>cd :cn<cr>
""上一个错误
nmap <leader>cp :cp<cr>

""Tools and environment to make Vim superb for developing with Node.js. Like Rails.vim for Node.
""Use gf on paths or requires to open the same file Node.js would.
""Use :Nedit to quickly edit any module, file in a module or your project file.
Bundle 'moll/vim-node'


Bundle 'myhere/vim-nodejs-complete'

autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"自动补全，替代acp"
Bundle 'Shougo/neocomplcache.vim'
let g:neocomplcache_enable_at_startup = 1


"自动产生session插件
Bundle 'tpope/vim-obsession'
au BufWritePost * Obsession .vimsession

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

"statusline插件"
"h airline
Bundle 'bling/vim-airline'
let g:airline_theme='hybrid'

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
Bundle 'gregsexton/MatchTag'


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
Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=Grey
hi IndentGuidesEven ctermbg=LightCyan
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

set hlsearch

inoremap , ,<space>

"按C-N就选择一个单词，连续按就连续选择同样的单词
"CTRL-P in Visual mode will remove the current virtual cursor and go back to
"the previous virtual cursor location. This is useful if you are trigger happy
"with Ctrl-n and accidentally went too far.

"CTRL-X in Visual mode will remove the current virtual cursor and skip to the
"next virtual cursor location. This is useful if you don't want the current
"selection to be a candidate to operate on later.
Bundle 'terryma/vim-multiple-cursors'
set complete+=kspell

Bundle 'davidhalter/jedi-vim'
"let g:jedi#auto_initialization = 0
let g:jedi#popup_select_first=0
let g:jedi#popup_on_dot = 0

Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'

Bundle 'kchmck/vim-coffee-script'

Bundle 'scrooloose/nerdtree'
"f2 to open nerdtree
nmap <F2> :NERDTreeToggle<cr>
"在insert模式下向右移动一格
inoremap <F3> <Esc><right>a
"打印当前行数，方便于调试
imap <F4> <C-R>=line(".")<CR>
autocmd FileType javascript map <F5> <Esc>:w<CR>:!node %<CR>
autocmd FileType html map <F5> <Esc>:w<CR>:!google-chrome  %<CR>
autocmd fileType sh map <F5> <Esc>:w<CR>:!zsh %<CR>
autocmd FileType perl map <F5> <Esc>:w<CR>:!perl %<CR>
autocmd FileType python map <F5> <Esc>:w<CR>:!python %<CR>
map <F6> "+p
"在单词外圈加成对符号
map <F7> ysiw
"在nautilus打开当前目录
map <F8> :!nautilus $(pwd)<CR>
nmap <F9> :vsp ~/.vimrc<CR>

"自动整理代码代码
Bundle 'Chiel92/vim-autoformat'
Bundle 'mhinz/vim-startify'

set hidden
" tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=/home/ceclinux/.vim/vimundo/
