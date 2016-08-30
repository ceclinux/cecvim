"number of colors set to 256
set t_Co=256
"
set t_ut=
let g:solarized_termcolors=256
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
" rtp = runtimepath
set rtp+=~/.vim/bundle/Vundle.vim
" Lines with equal indent form a fold
set fdm=indent

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"colorscheme
"Plugin 'morhetz/gruvbox'
Plugin 'Lokaltog/vim-easymotion'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'tpope/vim-rails.git'
" vim-scripts repos
Plugin 'L9'
Plugin 'vim-scripts/FuzzyFinder'

filetype plugin indent on     " required!
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..


"Bundle 'tomasr/molokai'
"Plugin 'taglist.vim'
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
"type rw to refactor script map <expr> rw Replace_Current_Word()
map <expr> <Leader>rw Search_Current_Word()
func Search_Current_Word()
    "<cword>    is replaced with the word under the cursor (like |star|)
    let w = expand("<cword>")
    "string连接用.即可"
    return "\<ESC>:Ag ".w.""
endfun

" use ag to search
":Ag keyword
" NOTE: require install ag in your mathine
Plugin 'rking/ag.vim'

" Turn backup on
set backup
" Set backup directory
set backupdir=$HOME/.vim/backup
" Keep more backups for one file

autocmd BufWritePre * let &backupext = strftime(".%m-%d-%H-%M")
"<leader> cs comment a block"
"<leader>cspace to comment out and reverse comment
Plugin 'scrooloose/nerdcommenter'

"Show the undo tree"
Plugin 'Gundo'
map <leader>gg :GundoToggle<CR>

Plugin 'msanders/snipmate.vim'


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
Plugin 'mattn/emmet-vim'

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


let g:user_emmet_leader_key = '<C-A>'
autocmd FileType html imap <tab> <plug>(EmmetExpandAbbr)

Plugin 'othree/html5.vim'
Plugin 'vim-scripts/c.vim'
Plugin 'pangloss/vim-javascript'


autocmd FileType mkd inoremap ` ``<Left>
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=markdown syntax=markdown

map <F10> :set spell! <CR>

Plugin 'nono/jquery.vim'

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile  *.ejs set filetype=html syntax=html

"Plugin 'Lokaltog/vim-powerline'
"let g:Powerline_symbols = 'fancy'

Plugin 'vim-scripts/awk.vim'


Plugin 'vim-misc'

Plugin 'maksimr/vim-jsbeautify'

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
"call ctrld to toggle filepath search
Plugin 'kien/ctrlp.vim'
"ctrlp忽略node_modules"
let g:ctrlp_custom_ignore = {
            \ 'dir':  'node_modules/',
            \ }

Plugin 'lilydjwg/fcitx.vim'

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
Plugin 'Raimondi/delimitMate'


""Plugin 'junegunn/goyo.vim'

"After doing all the startup stuff, including
"loading .vimrc files, executing the "-c cmd"
"arguments, creating all windows and loading
"the buffers in them.
""autocmd VimEnter * Goyo 100

"delete surroundings in pair, ds' deletes a pair of '
Plugin 'tpope/vim-surround'

"gq拆行
"set textwidth=78

"Tabularize plugin
" :Tabularize /,按照逗号对齐


"Plugin 'scrooloose/syntastic'


"语法提示
"Plugin 'walm/jshint.vim'
"保存之前自动quickfix"
"autocmd BufWritePre *.js JSHint
""quickfix映射
""下一个错误
nmap <leader>cd :cn<cr>
""上一个错误
nmap <leader>cp :cp<cr>

"Tools and environment to make Vim superb for developing with Node.js. Like
"Rails.vim for Node.
"Use gf on paths or requires to open the same file Node.js would.
"Use :Nedit to quickly edit any module, file in a module or your project file.
Plugin 'moll/vim-node'


Plugin 'myhere/vim-nodejs-complete'

autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"自动补全，替代acp"
"Plugin 'Shougo/neocomplcache.vim'
"let g:neocomplcache_enable_at_startup = 1


"自动产生session插件
Plugin 'tpope/vim-obsession'
au BufWritePost * Obsession ~/.vimsession

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

"statusline插件"
"h airline
Plugin 'bling/vim-airline'

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
Plugin 'gregsexton/MatchTag'


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
Plugin 'nathanaelkane/vim-indent-guides'
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
Plugin 'terryma/vim-multiple-cursors'
set complete+=kspell

"Plugin 'davidhalter/jedi-vim'
"let g:jedi#auto_initialization = 0
"let g:jedi#popup_select_first=0
"let g:jedi#popup_on_dot = 0

Plugin 'mattn/webapi-vim'
"a gist wrapper"
Plugin 'mattn/gist-vim'
let g:gist_list_vsplit = 1

Plugin 'kchmck/vim-coffee-script'

Plugin 'scrooloose/nerdtree'
"f2 to open nerdtree
nmap <leader>f :NERDTreeToggle<cr>
"在insert模式下向右移动一格
inoremap <leader><F3> <Esc><right>a
autocmd FileType javascript map <leader><F5> <Esc>:w<CR>:!node %<CR>
autocmd FileType html map <leader><F5> <Esc>:w<CR>:!google-chrome  %<CR>
autocmd fileType sh map <leader><F5> <Esc>:w<CR>:!zsh %<CR>
autocmd FileType perl map <leader><F5> <Esc>:w<CR>:!perl %<CR>
autocmd FileType python map <leader><F5> <Esc>:w<CR>:!python %<CR>
"按K翻译当前单词
autocmd FileType mkd set keywordprg=fanyi
autocmd BufReadPost * if &filetype == "" | setlocal ft=text | endif
autocmd FileType text set keywordprg=fanyi

map <leader>p "+p
"在单词外圈加成对符号
nmap <leader>v :vsp ~/.vimrc<CR>
"按, + t开一个新的tab
nmap <leader>t :tabnew<CR><C-P>

"自动整理代码代码
Plugin 'Chiel92/vim-autoformat'
"autocmd QuitPre *.py,*.js Autoformat redraw!
Plugin 'mhinz/vim-startify'

set hidden
" tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=/home/ceclinux/.vim/vimundo/
"When a file has been detected to have been changed outside of Vim and
"it has not been changed inside of Vim, automatically read it again.
set autoread

"run shell in vim
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimshell.vim'
"press <,-s> to open vimshell
"in insert mode, <C-L> to list history
nmap <leader>s :VimShellPop<CR>
Plugin 'tpope/vim-fugitive'
nmap <leader>i :Gstatus<CR>
nmap <leader>c :Gcommit<CR>

"set textwidth of the gitcommit
set background=dark
autocmd Filetype gitcommit setlocal spell textwidth=72

"colorscheme molokai
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
call vundle#end()

"colorscheme gruvbox
"s             Toggle sort order between name and file order.
"x             Toggle zooming the window.
"p             Jump to the tag under the cursor, but stay in the Tagbar window.
"P             Toggle the Preview Window

Plugin 'majutsushi/tagbar'
autocmd BufEnter * nested :call tagbar#autoopen(0)
"auto preview tagbar
let g:tagbar_autopreview = 1
"Plugin 'klen/python-mode'
"
Plugin 'Valloric/YouCompleteMe'
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

nnoremap <leader>gd :YcmCompleter GoTo<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gp :YcmCompleter GetParent<CR>
let g:ycm_confirm_extra_conf = 0

if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    let g:tagbar_ctags_bin='/usr/local/bin/ctags'
  else
    let g:tagbar_ctags_bin='/usr/bin/ctags'
  endif
endif

Plugin 'nanotech/jellybeans.vim'

"always put cursor at the middle of the screen
nnoremap j jzz
nnoremap k kzz

"A plugin to toggle, display and navigate marks
Plugin 'kshenoy/vim-signature'
Plugin 'godlygeek/tabular'
autocmd BufWritePre *.json Tab /:
Plugin 'plasticboy/vim-markdown'
"Plugin 'suan/vim-instant-markdown'
let g:vim_markdown_math = 1


"Plugin 'scrooloose/syntastic'
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

Plugin 'altercation/vim-colors-solarized'
syntax enable
set background=dark
colorscheme solarized

"When set to "dark", Vim will try to use colors that look good on a
"	dark background.  When set to "light", Vim will try to use colors that
"	look good on a light background.

"set colorcolumn=78
set tw=78
set showbreak=↪

Plugin 'mhinz/vim-signify'
Plugin 'rhysd/vim-grammarous'

command Makepdf execute "!pandoc -f markdown_github+tex_math_dollars -V fontsize=12pt % -o out.pdf"
command Ohmyzsh execute '!sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"'

Plugin 'kien/rainbow_parentheses.vim'

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

map <leader>b :ls<CR>
