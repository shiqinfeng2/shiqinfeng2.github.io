""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Be IMproved
set nocompatible

" Set backspace
set backspace=eol,start,indent

" Lines folding
set foldenable
set foldnestmax=2
set foldmethod=syntax

" Enable filetypes
filetype plugin indent on

" Set fileencodings
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 "chinese,latin-1,
let $LANG="zh_CN.UTF-8"
set termencoding=utf-8
set encoding=utf-8

" Set complete options
set completeopt=longest,menu

" Set wild menu & mode
set wildmenu
set wildmode=longest:full,full

" Set key codes timeout
set ttimeoutlen=100

" Auto change current directory
set autochdir

" Use absolute paths in sessions
set sessionoptions-=curdir

" Keep more backups for one file
autocmd BufWritePre * let &backupext = strftime(".%m-%d-%H-%M")

" keep 512 lines of command line history
set history=512		

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal g`\"" |
	\ endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable backup
set backup

" Set backup directory
set backupdir=~/.vim/backup

" Set swap file directory
set directory=~/.vim/swap,/tmp

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
" Set colorscheme
colorscheme molokai  "jellybeans " desert

" Enable syntax highlight
syntax on

"Use black background 
"set background=dark 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show ruler
set ruler

" display incomplete commands
set showcmd		

" Dynamic title
set title

" Display line number
set number

" Always have a status line
set laststatus=2

" Allow to display incomplete line
set display=lastline

"当vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响�?
"set vb t_vb= 

"设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号 
set showmatch 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable magic matching
set magic

" Show matching bracets
set showmatch

" Highlight search things
set hlsearch

" Ignore case when searching
set smartcase
set ignorecase

" Incremental match when searching
set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto indent
set autoindent

" Smart indet
set smartindent

" Use hard tabs
"set tabstop=8
"set noexpandtab
"set shiftwidth=8

" expand tabs
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

" Break long lines
"set textwidth=80 " wrap text for 78 letters

" Set auto-formating
set formatoptions+=mM

" Config C-indenting
set cinoptions=:0,l1,t0,g0

" set textwidth for mail
autocmd FileType mail set textwidth=72

" Use soft tabs for python
autocmd FileType python set expandtab shiftwidth=4 softtabstop=4

autocmd FileType ruby set shiftwidth=2 softtabstop=2

autocmd FileType javascript set shiftwidth=4 softtabstop=4 foldmethod=indent foldnestmax=4 textwidth=120

" Use extension to set filetype
autocmd BufNewFile,BufRead *.md set filetype=markdown

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctags & Cscope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto finding
set tags=tags;

" Use both cscope and ctag
set cscopetag

" Show msg when cscope db added
set cscopeverbose

" Use tags for definition search first
set cscopetagorder=1

" Use quickfix window to show cscope results
set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i-

"添加ctags自动搜索路径，以支持STL
"set tags+=$HOME/.vim/stl_ctags
set tags+=~/.vim/stl_ctags

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tab navigation
nnoremap tp :tabprevious<CR>
nnoremap tn :tabnext<CR>
nnoremap to :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap gf <C-W>gf

" Move among windows
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l

" Cscope mappings
nnoremap <C-w>\ :scs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>d :scs find d <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-\>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

"映射cscope命令�?cs find c|d|e|f|g|i|s|t name
"nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR> "0或s:查找本C符号(可以跳过注释)
"nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR> "1或g:查找本定�
"nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR> "3或c:查找调用本函数的函数
"nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR> "4或t:查找本字符串
"nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR> "6或e: 查找�?egrep 模式
"nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR> "7或f: 查找本文�
"nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR> "8或i:查找包含本文件的文件
"nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR> "2或d:查找本函数调用的函数

"ctag 配置
"nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
"nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
"nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>

" Set Up and Down non-linewise
noremap <Up> gk
noremap <Down> gj

" Toggle Tagbar
nnoremap <silent> <F2> :TagbarToggle<CR>

" Grep search tools
nnoremap <F3> :Rgrep<CR>

" Paste toggle
set pastetoggle=<F4>

" Save & Make 
nnoremap <F5> :w<CR>:make!<CR>
nnoremap <F6> :w<CR>:make! %< CC=gcc CFLAGS="-g -Wall"<CR>:!./%<<CR>

" Quickfix window
nnoremap <silent> <F7> :botright copen<CR>
nnoremap <silent> <F8> :cclose<CR>

" NERDTreeToggle
nnoremap <silent> <F9> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree  "启动vim的时候自动打开目录�
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Toggle display line number
nnoremap <silent> <F10> :set number!<CR>

" Use <space> to toggle fold
nnoremap <silent> <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" Use xsel to access the X clipboard
if $DISPLAY != '' && executable('xsel')
    nnoremap <silent> "*y :'[,']w !xsel -i -p -l /dev/null<CR>
    nnoremap <silent> "*p :r!xsel -p<CR>
    nnoremap <silent> "+y :'[,']w !xsel -i -b -l /dev/null<CR>
    nnoremap <silent> "+p :r!xsel -b<CR>
endif

map <F11> :silent! Tlist<CR>
map <F12> :call Do_CsTag()<CR>
"map <F4> :call TitleDet()<cr>'s
map <leader>P :BlogPreview<CR>
map fg : Dox<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set Tagbar width
let tagbar_width = 32

" Use my own cscope mappings
let autocscope_menus = 0

" Use context to decide completion type
let g:SuperTabDefaultCompletionType = "context"



"vim-pathogen plugin 该插件可以将每个github的vim plugin工程单独放到bundle目录�
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

"vim-repress插件 see https://github.com/vim-scripts/VimRepress
let VIMPRESS = [{'username':'cherrot',
                \'blog_url':'http://www.cherrot.com/'
                \}]
"map <leader>P :BlogPreview<CR> �?Mapping 一�

"同时搜索ctags和cscope的标签，并且cscope优先
if has("cscope")
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    set csto=0
    set cst
    set csverb
endif

"taglist插件，进行Tlist的设�
"TlistUpdate可以更新tags
"map <F3> :silent! Tlist<CR> //见Mapping一�
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执�
let Tlist_Use_Right_Window=1 "让窗口显示在右边�?的话就是显示在左�
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表，如果想只�?个，设置�?
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Process_File_Always=0 "是否一直处理tags.1:处理;0:不处理。不是一直实时更新tags，因为没有必�
let Tlist_Inc_Winwidth=0

"OmniCppComplete Plugin 目前用neocomplcache

"对NERD_commenter的设�?在光标所在行上，按ctrl+h变换注释,cm是多行注�?cu是取消注�
let NERDShutUp=1

"DoxygenToolkit插件配置
"map fg : Dox<cr> //见Mapping一�
let g:DoxygenToolkit_authorName="Cherrot Luo"
let g:DoxygenToolkit_licenseTag="GPLv3\<enter>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre = "@brief\t"
let g:DoxygenToolkit_paramTag_pre = "@param\t"
let g:DoxygenToolkit_returnTag = "@return\t"
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 30

"a.vim插件 :A，打开.cpp�?h对应的文件，:AV，分屏显�?cpp�?h对应的文�?无需配置)

"neocomplcache 代码补全插件
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1


"此方法见http://xwz.me/blog/2010/11/29/01-23/
"if(executable('ctags'))
"    silent! execute "!g++ -E % -o tmpcpp -I./include"
"    silent! execute "!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q --language-force=C++ ."
"    silent! execute "!unlink tmpcpp"
"endif

"cscope 函数定义  用cscope生成数据库，并添加到vim�
"function Do_CsTag()
"    if(executable('cscope') && has("cscope") )
"        if(g:iswindows!=1)
"            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
"        else
"            silent! execute "!dir /b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
"        endif
"        silent! execute "!cscope -b"
"        if filereadable("cscope.out")
"            execute "cs add cscope.out"
"        endif
"    endif
"endf

"ctags 函数定义
function Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(g:iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(g:iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        "silent! execute "!ctags -R --c-types=+p --fields=+S *"
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        if(g:iswindows!=1)
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        else
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction


"进行版权声明的设�
"添加或更新头
"function AddTitle()
"    call append(0,"/*=============================================================================")
"    call append(1,"#")
"    call append(2,"# Author: Cherrot Luo - cherrot+vim@cherrot.com")
"    call append(3,"#")
"    call append(4,"#")
"    call append(5,"# Last modified:	2012-08-31 17:02
"    call append(6,"#")
"    call append(7,"# Filename:		.vimrc
"    call append(8,"#")
"    call append(9,"# Description: ")
"    call append(10,"#")
"    call append(11,"=============================================================================*")
"    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
"endf

"更新最近修改时间和文件�
"function UpdateTitle()
"    normal m'
"    execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
"    normal ''
"    normal mk
"    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
"    execute "noh"
"    normal 'k
"    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
"endfunction

""
"" defaults:
"let otl_install_menu=1
"let no_otl_maps=0
"let no_otl_insert_maps=0
"
"" overrides:
"let otl_bold_headers=0
"let otl_use_thlnk=0
"
"" au BufWinLeave *.otl mkview
"" au BufWinEnter *.otl silent loadview
"let maplocalleader = ","

" vimwiki
let g:vimwiki_list = [{'path': '~/syzfeng.github.io/',
\ 'path_html': '~/syzfeng.github.io/html/',
\ 'syntax': 'markdown',
\ 'ext': '.mkd',
\ 'template_path': '~/syzfeng.github.io/',
\ 'template_default': 'template',
\ 'template_ext': '.html'}]
let g:vimwiki_camel_case = 0 "?ص??շ?ƥ??
"let g:vimwiki_file_exts = 'c, cpp,  txt, h, hpp, sh, awk'  "������.wiki��refer��һ����Ϊmy.cpp���ļ����ᱻĬ����չΪmy.cpp.html�����ѡ�����Vimwiki���������˵��ļ����Ͳ�������չ��
let g:vimwiki_ext2syntax = {'.md':'markdown','.markdown':'markdown','.mdown':'markdown','.mkd':'markdown'}

map <F4> <Plug>Vimwiki2HTML
map <S-F4> <Plug>VimwikiAll2HTML
"insert date
nmap <F3> a<C-R>=strftime("%Y-%m-%d %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %I:%M %p")<CR>

autocmd filetype go set dictionary=~/.vim/bundle/VimForGo/go.dict

"判断�?0行代码里面，是否有Last modified这个单词�
"如果没有的话，代表没有添加过作者信息，需要新添加�
"如果有的话，那么只需要更新即�
"function TitleDet()
"    let n=1
"    "默认为添�
"    while n < 10
"        let line = getline(n)
"        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
"            call UpdateTitle()
"            return
"        endif
"        let n = n + 1
"    endwhile
"    call AddTitle()
"endfunction
