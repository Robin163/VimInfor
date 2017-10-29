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
    set ignorecase         " Case insensitive search
    set smartcase          " Case sensitive when uc present
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

        "autocmd vimenter * NERDTree
        map <F3> :NERDTreeMirror<CR>
        map <F3> :NERDTreeToggle<CR>
        "nerdtree end
    "}
    
    "Motion {
        Plugin 'Lokaltog/vim-easymotion'
        let g:EasyMotion_smartcase = 1
        "let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
        map <Leader><leader>h <Plug>(easymotion-linebackward)
        map <Leader><Leader>j <Plug>(easymotion-j)
        map <Leader><Leader>k <Plug>(easymotion-k)
        map <Leader><leader>l <Plug>(easymotion-lineforward)
        " 重复上一次操作, 类似repeat插件, 很强大
        map <Leader><leader>. <Plug>(easymotion-repeat)
    "}

    "Plugin 'vim-scripts/ShowTrailingWhitespace' "高亮显示行尾的多余空白字符
    "let g:ShowTrailingWhitespace = 1 
    
    "Tab infor{
        Plugin 'ervandew/supertab'

    "}

    "Session Infor{
        Plugin 'xolox/vim-misc'
        Plugin 'xolox/vim-session'
    
    "}

    "Find Infor{
        Plugin 'kien/ctrlp.vim'
    
        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_cmd = 'CtrlP'
    "}
    "Theme Style {
        
        set rtp+=$vim/bundle/vim-colors-solarized
        syntax enable
        " 主题 solarized
        Plugin 'altercation/vim-colors-solarized'
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
        colorscheme solarized

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
        set tags=tags;
        set autochdir

        "标签导航，纬度和taglist不同
        Plugin 'majutsushi/tagbar'
        map <F5> :TagbarToggle<CR>  "\tb 打开tagbar窗口
        let g:tagbar_autofocus = 1
        let g:tagbar_width = 30  " 设置tagbar的宽度 
        let g:tagbar_sort  = 0   " setting order
        " 在某些情况下自动打开tagbar
        "autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx :call tagbar#autoopen()
    "}


    "Complete {
        "Plugin 'xolox/vim-lua-ftplugin'
        "Plugin 'Shougo/neocomplete'
        "Plugin 'Shougo/neosnippet'
        "Plugin 'Shougo/neosnippet-snippets'
        "let g:neocomplete#enable_at_startup = 1

        "Plugin 'Valloric/YouCompleteMe'

    "}

    Plugin 'WolfgangMehner/c-support'

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
    "cd R:\08 - R&D\02 - Robin Li\SVN\Wuxi\Firmware\F29 - 701604 Charger kit charger -CKC- 1208\CKC10
    set path+=\**
    "set path+=$Vim
"}

"Key Map {
    :map <F12> <Esc>:tabe $vim/_vimrc<CR>
"}

