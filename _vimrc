"General setting {
    " define shortcut prefix,is <Leader>
    let mapleader="'"

    set autoread
    set autowrite

    set cindent " 使用 C/C++ 语言的自动缩进方式
    set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    " set previewwindow " 标识预览窗口
    set history=200 " set command history to 200 历史记录50条
    "set fold method
    "set fdm=indent
    "
    " setting read code
    set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
    set encoding=utf-8
    set termencoding=utf-8
    set fileencodings=ucs-bom,utf-8,cp936
    set fileencoding=utf-8
    " "--状态行设置--
    " set laststatus=2 "
    " 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
    set go=
    set guifontset=
    "set guifont=Consolas:h12:b:cDEFAULT
    set guifont=Courier_new:h12:b:cDEFAULT
    "set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
    "set guifontwide=YouYuan:h11:b:cGB2312

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

"}

" Vim UI {
    "set gcr=a:block-blinkon0 " 禁止光标闪烁
    set showmode           " Display the current mode
    set laststatus=2       " 总是显示状态栏
    set cursorline         " Highlight current line
    set cc=85
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
    set nospell              " spell check
"}

"Get systerm info {
    function! GetSystem()
        if (has("win32") || has("win95") || has("win64") || has("win16"))
            return "windows"
        elseif has("unix")
            return "linux"
        elseif has("mac")
            return "mac"
        endif
    endfunction
"}

"Get bundle path{
    " 用户目录变量$VIMFILES
    if GetSystem() == "windows"
        let $VIMBUNDLE = $VIM.'/bundle'
    elseif GetSystem() == "linux"
        let $VIMBUNDLE = $HOME.'/.vim/bundle'
    endif
"}

"Plugin Manager {

    syntax enable       " 开启语法高亮功能
    syntax on           " 允许用指定语法高亮配色方案替换默认方案
    set nocompatible    " 去除VI一致性,必须要添加
    filetype off        " 必须要添加

    " 设置包括vundle和初始化相关的runtime path
    set rtp+=$VIMBUNDLE/Vundle.vim
    call vundle#begin('$VIMBUNDLE')
    Plugin 'VundleVim/Vundle.vim'

    "Color Theme {
        " Theme solarized
        set rtp+=$VIMBUNDLE/vim-solarized8
        Plugin 'lifepillar/vim-solarized8'
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"

        " Theme molokai
        set rtp+=$VIMBUNDLE/molokai
        Plugin 'tomasr/molokai'
        let g:molokai_original = 1

        if GetSystem() == "windows"
            " Color Setting
            set t_Co=256
            set background=dark
            "set background=light
            colorscheme solarized8
            "colorscheme molokai
        elseif GetSystem() == "linux"
            " Color Setting
            set t_Co=256
            set background=dark
            "set background=light
            if has("gui_running")
                "colorscheme solarized8
                colorscheme molokai
            else
                colorscheme solarized8
                "colorscheme molokai
            endif
        endif
    "}

    "NerdTree {
        Plugin 'scrooloose/nerdtree'
        Plugin 'jistr/vim-nerdtree-tabs'
        let NERDTreeWinPos='left'
        " 设置宽度
        let NERDTreeWinSize=25
         " 显示行号
        let NERDTreeShowLineNumbers=1
        let NERDTreeAutoCenter=1
        " 在终端启动vim时，共享NERDTree
        let g:nerdtree_tabs_open_on_console_startup=1
        " 忽略一下文件的显示
        let NERDTreeIgnore=['\.pyc','\~$','\.swp']
        " 显示书签列表
        "let NERDTreeShowBookmarks=1
    "}

    "Session Infor{
        Plugin 'xolox/vim-misc'
        Plugin 'xolox/vim-session'

        " 保存快捷键
        map <leader>ss :SaveSession mysession<CR>
        " 恢复快捷键
        map <leader>rs :OpenSession mysession<CR>

    "}

    "status line {
        Plugin 'Lokaltog/vim-powerline'
        " 设置状态栏主题风格
        let g:Powerline_colorscheme='solarized256'
    "}

    "Space plugin {
        Plugin 'bronson/vim-trailing-whitespace'

        "for show no user whitespaces
        map <leader><space> :FixWhitespace<CR>
    "}

    "Easy function {

        Plugin 'easymotion/vim-easymotion'

    "}

    "indent guides {

        "Plugin 'nathanaelkane/vim-indent-guides'
        " 随 vim 自启动
        let g:indent_guides_enable_on_vim_startup=1
        " 从第二层开始可视化显示缩进
        let g:indent_guides_start_level=2
        " 色块宽度
        let g:indent_guides_guide_size=1
        " 快捷键 i 开/关缩进可视化
        :nmap <silent> <Leader>ig <Plug>IndentGuidesToggle
    "}

    "quotes {
        Plugin 'Raimondi/delimitMate' "auto add another quote
        Plugin 'tpope/vim-surround'   "change delet & add quote
        Plugin 'luochen1990/rainbow'  "change color of quotes
        let g:rainbow_active = 1

    "}

    "Tags and dep {
        "add ctags and dependent files
        "auto create tags but slower the function!
        Plugin 'vim-scripts/indexer.tar.gz'
        Plugin 'vim-scripts/DfrankUtil'
        Plugin 'vim-scripts/vimprj'
        " 设置插件 indexer 调用 ctags 的参数
        " 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
        " 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
        let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
                                    \               --fields=+iaSl --extra=+q"
        "标签导航，纬度和taglist不同
        Plugin 'majutsushi/tagbar'
        let g:tagbar_autofocus = 1
        let g:tagbar_width = 30  " 设置tagbar的宽度
        let g:tagbar_sort  = 0   " setting order
    "}

    "Function & Cscope {

        "set rtp+=$VIMBUNDLE/CCTree
        "Plugin 'brookhong/cscope.vim'
        "Plugin 'hari-rangarajan/CCTree'

        if has("cscope")
            set csprg=C:/cygwin64/bin/cscope.exe
            set csto=0
            set cst
            set nocsverb
            " add any database in current directory
            if filereadable("cscope.out")
                cs add cscope.out
            " else add database pointed to by environment
            elseif $CSCOPE_DB != ""
                cs add $CSCOPE_DB
            endif

            set csverb
        endif

        nmap <leader>fa :cs add cscope.out <CR>
        " s: Find this C symbol
        nmap <leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>
        " g: Find this definition
        nmap <leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>
        " c: Find functions calling this function
        nmap <leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>
        " t: Find this text string
        nmap <leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>
        " e: Find this egrep pattern
        nmap <leader>fe :cs find e <C-R>=expand("<cword>")<CR><CR>
        " f: Find this file
        nmap <leader>ff :cs find f <C-R>=expand("<cfile>")<CR><CR>
        " i: Find files #including this file
        nmap <leader>fi :cs find i <C-R>=expand("<cfile>")<CR><CR>
        " d: Find functions called by this function
        nmap <leader>fd :cs find d <C-R>=expand("<cword>")<CR><CR>

    "}

    "Find Infor{
        Plugin 'kien/ctrlp.vim'

        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_cmd = 'CtrlP'
        " 设置过滤不进行查找的后缀名
        set wildignore+=*\\tmp\\*,*\\obj\\*,*.swp,*.zip,*.exe,*.tmp,*.icf " Windows
        let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

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

    "search & replace {

        Plugin 'yegappan/grep'
        Plugin 'beyondgrep/ack2'
        Plugin 'dyng/ctrlsf.vim'
        Plugin 'terryma/vim-multiple-cursors'

        let g:ackprg = 'ag --vimgrep'
        let g:ctrlsf_ignore_dir = ['List', 'Obj', 'tags']
        " 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。
        " 快捷键速记法：search in files
        nnoremap <Leader>sf :CtrlSF<CR>
    "}

    "diff files {
        Plugin 'will133/vim-dirdiff'
    "}

    ".c switch .h {

        set rtp+=$VIMBUNDLE/a.vim
        Plugin 'a.vim'
        map <leader>ch :A<CR>
        map <leader>ih :IH<CR>
        map <leader>ic :IH<CR>:A<CR>

    "}

    "Complete {

        Plugin 'Valloric/YouCompleteMe'

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
        "let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python':1 }
        "let g:ycm_filetype_whitelist = { '*': 1 }
        " 语法关键字补全
        let g:ycm_seed_identifiers_with_syntax = 1

        let g:ycm_collect_identifiers_from_comments_and_strings = 1
        " 开启 YCM 标签引擎
        let g:ycm_collect_identifiers_from_tags_files=1
        " 引入 C++ 标准库tags
        set tags=./tags;
        "set tags=../../tags;
        "set tags+=../../tags;
        set tags+=C:/WinAVR-20100110/avr/include/tags;

        "let g:UltiSnipsUsePythonVersion = 2

"let g:ycm_global_ycm_extra_conf='$vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:clang_complete_auto = 1
"let g:clang_complete_copen = 1
"let g:clang_user_options='|| exit 0'
"let g:clang_library_path = '$VIM/../LLVM'
"inoremap <leader>;     :<C-x><C-o>
"nnoremap <leader>jc :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
    "}

    "C vim {

        "Plugin 'WolfgangMehner/c-support'
        let g:C_MapLeader = "["
        let g:C_UseTool_make   = 'yes'
        let g:C_UseTool_doxygen = 'yes'
    "}


    call vundle#end()            " 必须

    filetype plugin indent on     "启动自动补全
"}

"replace function {
    " should define range before this action
    " for all project just like:
    " :args **/*.c **/*.h

    " 替换函数。参数说明：
    " confirm：是否替换前逐一确认
    " wholeword：是否整词匹配
    " replace：被替换字符串
    function! Replace(confirm, wholeword, replace)
        wa
        let flag = ''
        if a:confirm
            let flag .= 'gec'
        else
            let flag .= 'ge'
        endif
        let search = ''
        if a:wholeword
            let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
        else
            let search .= expand('<cword>')
        endif
        let replace = escape(a:replace, '/\&~')
        execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
    endfunction
    " 不确认、非整词
    nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
    " 不确认、整词
    nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
    " 确认、非整词
    nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
    " 确认、整词
    nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
    nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

    " 避免更改的相关文件太多,一屏显示不完
    " 需要多次press Enter or Space key
    set nomore

"}

"Windows Setting {
    "=========================================
    "窗口最大化
    "=========================================
    if GetSystem() == "windows"
        au GUIEnter * simalt ~x
    elseif GetSystem() == "linux"
        if has("gui_running")
            " GUI is running or is about to start.
            " Maximize gvim window (for an alternative on Windows, see simalt below).
            set lines=999 columns=999
        else
            " This is console Vim.
            " 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
            fun! ToggleFullscreen()
                call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
            endf
            " 启动 vim 时自动全屏
            autocmd VimEnter * call ToggleFullscreen()
        endif
    endif
"}

"Default Path {
    "=========================================
    "add path
    "=========================================
    if GetSystem() == "windows"
        "cd D:/other/TNWC5/TNWC5 Get Parameter
        "cd D:/other/shell
        "cd D:/program/home/vimfiles/templates
        cd D:/other/ckc10_test
        "cd D:/other/TNWC5/TNWC5
        "cd M:/08 - R&D/02 - Robin Li/Relatied Infor/other/ckc10_new2/CKC10
        "cd D:/other/avr/smartbase
        "cd R:\08 - R&D\02 - Robin Li\SVN\Wuxi\Firmware\F29 - 701604 Charger kit charger -CKC- 1208\CKC10
        set path+=\**
    endif
"}

"hot Key Map {

    " 依次遍历子窗口
    nmap    <C-w>   <C-W><C-W>
    " 跳转至右方的窗口
    nmap    <C-l>   <C-W>l
    " 跳转至左方的窗口
    nmap    <C-h>   <C-W>h
    " 跳转至上方的子窗口
    nmap    <C-k>   <C-W>k
    " 跳转至下方的子窗口
    nmap    <C-j>   <C-W>j
    "光标上下各加一空行
    nmap    <leader>sp  O<Esc>jo<Esc>k
    "光标行变成注释行
    nmap    <leader>cc  I/*<Esc>l3x<Esc>A<Space>*/<Esc>
    "注释行变成光标行
    nmap    <leader>co  ^3x$2h3x

    " run make all
    nmap    <Leader>ma :make all<CR>:cw<CR><CR>
    " run make clean
    nmap    <Leader>mc :make clean<CR>
    " run make program
    nmap    <Leader>mp :make program<CR>
    " run make debug
    nmap    <Leader>md :make debug<CR>

    map   <silent> <F3>        :NERDTreeMirror<CR>
    map   <silent> <F3>        :NERDTreeToggle<CR>
    map   <silent> <F4>        :!ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
                \                   --fields=+liaS --extra=+q --language-force=c++<CR><CR>
    nmap  <Leader>tb           :TagbarToggle<CR>    " shortcut key
    map   <silent> <F5>        :TagbarToggle<CR>    " open tagbar window
    map   <silent> <F6>        :!cscope -Rbq<CR><CR>
    "map   <silent> <F7>        :cs add cscope.out<CR><CR>
    if GetSystem() == "windows"
        map   <silent> <F12>       :tabe $vim/_vimrc<CR>
    elseif GetSystem() == "linux"
        map   <silent> <F12>       :tabe $HOME/.vimrc<CR>
    endif

    imap  <silent> <F3>   <ESC>:NERDTreeToggle<CR>
    imap  <silent> <F4>   <ESC>:!ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
                \                   --fields=+liaS --extra=+q --language-force=c++<CR><CR>
    imap  <silent> <F5>   <ESC>:TagbarToggle<CR>    " open tagbar window
    imap  <silent> <F6>   <ESC>:!cscope -Rbq<CR><CR>
    "imap  <silent> <F7>   <ESC>:cs add cscope.out<CR><CR>
    imap  <silent> <F12>  <ESC>:tabe $vim/_vimrc<CR>
    if GetSystem() == "windows"
        map   <silent> <F12>  <ESC>:tabe $vim/_vimrc<CR>
    elseif GetSystem() == "linux"
        map   <silent> <F12>  <ESC>:tabe $HOME/.vimrc<CR>
    endif

    nmap  <Leader>df :vertical diffsplit 


"}

"auto working for vimrc {
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
"}

"Print setting {
    set printoptions=paper:A4,syntax:y,wrap:y
"}

