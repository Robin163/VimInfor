"General and Font {
    " The following are commented out as they cause vim to behave a lot
    " differently from regular Vi. They are highly recommended though.
    set autowrite " 自动把内容写回文件: 如果文件被修改过，在每个
    "" :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^命令时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令转到别的文件时亦然。

    set cindent " 使用 C/C++ 语言的自动缩进方式
    set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
    " 设置C/C++语言的具体缩进方式
    " set backspace=2 " 设置退格键可用
    " set showmatch " 设置匹配模式，显示匹配的括号
    " set linebreak " 整词换行
    " set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去
    " set hidden " Hide buffers when they are abandoned
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    " set previewwindow " 标识预览窗口
    set history=200 " set command history to 50 历史记录50条
    "set fold method 
    "set fdm=indent
    "
    " "--状态行设置--
    " set laststatus=2 "
    " 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
    set go=
    set guifont=Courier_new:h12:b:cDEFAULT    
    
    "共享剪贴板
    "set clipboard+=unnamed
    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard+=unnamed
        endif
    endif
    "从不备份
    set nobackup
    " setting read code
    set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
    set encoding=utf-8
    set termencoding=utf-8
    set fileencodings=ucs-bom,utf-8,cp936
    set fileencoding=utf-8

"}

" Vim UI {

    set showmode           " Display the current mode
    set cursorline         " Highlight current line
    set ruler              " Show the ruler
    set showcmd            " Show partial commands in status line and
    set linespace=0        " No extra spaces between rows
    set number             " Line numbers on
    set showmatch          " Show matching brackets/parenthesis
    set incsearch          " Find as you type search
    set hlsearch           " Highlight search terms
    set winminheight=0     " Windows can be 0 line high
    set smartcase          " Case sensitive when uc present
    set ignorecase         " Case insensitive search
    set wildmenu           " Show list instead of just completing
    set scrolljump=5       " Lines to scroll when cursor leaves screen
    set scrolloff=3        " Minimum lines to keep above and below cursor
    set foldenable         " Auto fold code

" }

" Formatting {

    set nowrap             " Do not wrap long lines
    set autoindent         " Indent at the same level of the previous line
    set smartindent        " 智能对齐方式
    set shiftwidth=4       " Use indents of 4 spaces
    set expandtab          " Tabs are spaces, not tabs
    set tabstop=4          " An indentation every four columns
    set softtabstop=4      " Let backspace delete indent
    set nosplitright       " Puts new vsplit windows to the left of the current
    set nosplitbelow       " Puts new split windows to the top of the current
"}

"Plugin Manager {
    set nocompatible              " 去除VI一致性,必须要添加
    filetype off                  " 必须要添加

    " 设置包括vundle和初始化相关的runtime path
    set rtp+=$vim/bundle/Vundle
    "set rtp+=\**
    call vundle#begin('$vim/bundle')

    Plugin 'VundleVim/Vundle'

    "Path Tree {
        Plugin 'scrooloose/nerdtree'
        let NERDTreeWinPos='left'
        let NERDTreeWinSize=30
        map <F3> :NERDTreeMirror<CR>
        map <F3> :NERDTreeToggle<CR>
    "}
    
    "Session Infor{
        Plugin 'xolox/vim-misc'
        Plugin 'xolox/vim-session'
    
    "}
    "Theme Style {
        
        set rtp+=$vim/bundle/vim-solarized8
        syntax enable
        " 主题 solarized
        "Plugin 'altercation/vim-colors-solarized'
        Plugin 'lifepillar/vim-solarized8'
        "let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"

        set rtp+=$vim/bundle/molokai
        " 主题 molokai
        Plugin 'tomasr/molokai'
        let g:molokai_original = 1
        " 配色方案
        set background=dark
        "set background=light
        set t_Co=256
        "colorscheme molokai
        colorscheme solarized8

        "if g:isGUI
            "colorscheme solarized
            "colorscheme molokai
            "colorscheme phd
        "else
            "colorscheme solarized
            "colorscheme molokai
            "colorscheme phd
        "endif
    "}

    "Function & Tags {
        "Plugin 'ctags'
        map <F4> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q <CR><CR>
        imap <F4> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<CR><CR>
        set tags=tags;
        "let tags+=./tags;
        "set autochdir

        Plugin 'taglist.vim'
        map <silent> <F6> :TlistToggle<cr> 

        "标签导航，纬度和taglist不同
        Plugin 'majutsushi/tagbar'
        nmap <Leader>tb :TagbarToggle<CR>        "快捷键设置
        map <F5> :TagbarToggle<CR>  "\tb 打开tagbar窗口
        let g:tagbar_autofocus = 1
        let g:tagbar_width = 30  " 设置tagbar的宽度 
        let g:tagbar_sort  = 0   " setting order
    "}
    
    "Find Infor{
        Plugin 'kien/ctrlp.vim'
    
        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_cmd = 'CtrlP'
        " 设置过滤不进行查找的后缀名 
        set wildignore+=*\\tmp\\*,*\\html\\*,*\\latex\\*,*\\obj\\*,*.swp,*.zip,*.exe,*.tmp,*.icf " Windows  
        let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$' 
        "let g:ctrlp_custom_ignore = {
        "  \ 'dir':  '\v[\/]\.(git|hg|svn|pyc|html|latex)$',
        "  \ 'file': '\v\.(exe|so|dll|tmp)$',
        "  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
        "  \ }

        Plugin 'rking/ag.vim'
        "调用ag进行搜索提升速度，同时不使用缓存文件
        if executable('ag')
          " Use Ag over Grep
          set grepprg=ag\ --nogroup\ --nocolor
          " Use ag in CtrlP for listing files.
          let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
          " Ag is fast enough that CtrlP doesn't need to cache
          let g:ctrlp_use_caching = 0
        endif 
    "}   

    "Status Bar {
    
        "Plugin 'vim-airline/vim-airline'

    "}

    "Windows type{

        set rtp+=$vim/bundle/winmanager
        Plugin 'vim-scripts/winmanager'
       let g:winManagerWindowLayout='FileExplorer|TagList'
"        let g:NERDTree_title="[NERDTree]"
"        let g:winManagerWindowLayout="FileExplorer|Tagbar"

"        function! NERDTree_Start()
"        exec 'NERDTree'
"        endfunction
"        function! NERDTree_IsValid()
"        return 1
"        endfunction

        nmap wm :WMToggle<CR>
    "}
    
    "Function & Cscope {

        Plugin 'brookhong/cscope.vim'
        Plugin 'hari-rangarajan/CCTree'
        " s: Find this C symbol
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
        " g: Find this definition
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
        " c: Find functions calling this function
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
        " t: Find this text string
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
        " e: Find this egrep pattern
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
        " f: Find this file
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
        " i: Find files #including this file
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        " d: Find functions called by this function
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
        
    "}
    
    ".c switch .h {
        
        "Plugin 'a.vim'
        map <silent>ch :A<cr>
        map <silent>ih :IH<cr>
        map <silent>ic :IH<cr>:A<cr>

    "}
    "Minibuffexplr {
        "Plugin 'fholgado/minibufexpl'
        "let g:miniBufExplMapWindowNavVim = 1
        "let g:miniBufExplMapWindowNavArrows = 1
        "let g:miniBufExplMapCTabSwitchBufs = 1
        "let g:miniBufExplModSelTarget = 1 
    "} 
    
    "Complete {

        Plugin 'Valloric/YouCompleteMe'
" for ycm
" 寻找全局配置文件
"let g:ycm_global_ycm_extra_conf = '$vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = 'D:/other/avr/chg-pile-test/.ycm_extra_conf.py'

" 禁用syntastic来对python检查
"let g:syntastic_ignore_files=[".*\.py$"] 
" 使用ctags生成的tags文件
"let g:ycm_collect_identifiers_from_tag_files = 1
" 开启语义补全
" 修改对C语言的补全快捷键，默认是CTRL+space，修改为ALT+;未测出效果
"let g:ycm_key_invoke_completion = '<M-;>'
" 设置转到定义处的快捷键为ALT+G，未测出效果
"nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR> 
"关键字补全
"let g:ycm_seed_identifiers_with_syntax = 1
" 在接受补全后不分裂出一个窗口显示接受的项
set completeopt-=preview

  let g:ycm_add_preview_to_completeopt = 1
" 让补全行为与一般的IDE一致
set completeopt=longest,menu
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0
" 每次重新生成匹配项，禁止缓存匹配项
let g:ycm_cache_omnifunc=0
" 在注释中也可以补全
let g:ycm_complete_in_comments=1
" 输入第一个字符就开始补全
let g:ycm_min_num_of_chars_for_completion=1

let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" 错误标识符
"let g:ycm_error_symbol='>>'
" 警告标识符
"let g:ycm_warning_symbol='>*'
" 不查询ultisnips提供的代码模板补全，如果需要，设置成1即可
" let g:ycm_use_ultisnips_completer=0
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F7> :YcmDiags<CR>
    "}

    "C vim {
        
        "Plugin 'WolfgangMehner/c-support'
        let g:C_UseTool_cmake   = 'yes'
        let g:C_UseTool_doxygen = 'yes'
    "}


    call vundle#end()            " 必须
    filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
    " 忽视插件改变缩进,可以使用以下替代:
    filetype plugin on
"}

"Windows Setting {
    "if g:isGUI      " 使用GUI界面时的设置
    "    set guioptions+=c        " 使用字符提示框
    "    set guioptions-=m        " 隐藏菜单栏
    "    "set guioptions-=T        " 隐藏工具栏
    "    set guioptions-=L        " 隐藏左侧滚动条
    "    "set guioptions-=r        " 隐藏右侧滚动条
    "    set guioptions-=b        " 隐藏底部滚动条
    "    "set showtabline=0       " 隐藏Tab栏
    "    set cursorline           " 突出显示当前行
    "endif
    "=========================================
    "窗口最大化
    "=========================================
    if has('win32')    
        au GUIEnter * simalt ~x
    else    
        au GUIEnter * call MaximizeWindow()
    endif 

    function! MaximizeWindow()    
        silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
    endfunction

"}
"Default Path {
    "=========================================
    "add path
    "=========================================
    cd D:\other\ckc10
    "cd D:\other\avr\chg-pile-test
    "cd R:\08 - R&D\02 - Robin Li\SVN\Wuxi\Firmware\F29 - 701604 Charger kit charger -CKC- 1208\CKC10
    set path+=\**
    set path+=$Vim
"}

"Key Map {
    :map <F12> <Esc>:tabe $vim/_vimrc<CR>

    :map <silent>su O<Esc>j
    :map <silent>sd o<Esc>k
    :map <silent>sp O<Esc>jo<Esc>k

"}
"Print setting {
    set printoptions=paper:A4,syntax:y,wrap:y
"}
