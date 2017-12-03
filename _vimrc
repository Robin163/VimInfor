"General and Font {

    " 定义快捷键的前缀，即<Leader>
    let mapleader="'"
    set autoread
    " The following are commented out as they cause vim to behave a lot
    " differently from regular Vi. They are highly recommended though.
    set autowrite " 自动把内容写回文件: 如果文件被修改过，在每个
    "" :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^命令时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令转到别的文件时亦然。

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
    set guifontwide=YouYuan:h11:b:cGB2312

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
    "set cc=80
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

"Plugin Manager {

    " 开启语法高亮功能
    syntax enable
    " 允许用指定语法高亮配色方案替换默认方案
    syntax on

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
        let NERDTreeWinSize=25
    "}

    "Session Infor{
        "Plugin 'xolox/vim-misc'
        "Plugin 'xolox/vim-session'

        " 保存快捷键
        "map <leader>ss :SaveSession mysession<CR>
        " 恢复快捷键
        "map <leader>rs :OpenSession mysession<CR>

        set rtp+=$vim/bundle/sessionman.vim
        Plugin 'sessionman.vim'
        " 保存快捷键
        map <leader>ss :SessionSave mysession<CR>
        " 恢复快捷键
        map <leader>rs :SessionOpen mysession<CR>
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

        set rtp+=$vim/bundle/vim-colors
        " 主题 phd
        Plugin 'spf13/vim-colors'
        " 配色方案
        set background=dark
        "set background=light
        set t_Co=256
        "colorscheme fruity
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

    "status line {

        Plugin 'Lokaltog/vim-powerline'
        " 设置状态栏主题风格
        let g:Powerline_colorscheme='solarized256'
    "}

    "Space plugin {
        Plugin 'bronson/vim-trailing-whitespace'

        "for show no user whitespaces
        map <leader><space> :FixWhitespace<CR>	" \+space去掉末尾空格
    "}

    "Easy function {

        Plugin 'b3niup/numbers.vim'
        Plugin 'scrooloose/syntastic'
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*

        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
        let g:syntastic_cpp_checkers = ['gcc']
        let g:syntastic_cpp_compiler = 'gcc'
        let g:syntastic_cpp_compiler_options = '-std=c++11'
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

    "Function & Tags {
        Plugin 'ctags/ctags58'
        set tags=./tags;
        "let tags+=./tags;
        "set autochdir

        "Plugin 'taglist.vim'

        "标签导航，纬度和taglist不同
        Plugin 'majutsushi/tagbar'
        let g:tagbar_autofocus = 1
        let g:tagbar_width = 30  " 设置tagbar的宽度
        let g:tagbar_sort  = 0   " setting order
    "}

    "search & replace {

        Plugin 'yegappan/grep'
        Plugin 'beyondgrep/ack2'
        Plugin 'dyng/ctrlsf.vim'
        Plugin 'terryma/vim-multiple-cursors'

        " 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
        nnoremap <Leader>sf :CtrlSF<CR>
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

    "Function & Cscope {

        "set rtp+=$vim/bundle/CCTree
        "Plugin 'brookhong/cscope.vim'
        "Plugin 'hari-rangarajan/CCTree'

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

    ".c switch .h {

        "Plugin 'a.vim'
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
        let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1 }
        " 语法关键字补全
        let g:ycm_seed_identifiers_with_syntax = 1
        " 开启 YCM 标签补全引擎
        let g:ycm_collect_identifiers_from_tags_files = 1
        " 引入 本工程文件的tags
        set tags+=./tags
        let g:ycm_collect_identifiers_from_comments_and_strings = 1

        nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
        " 只能是 #include 或已打开的文件
        nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
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
"}

"Windows Setting {
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
    cd D:\other\smartbase\pir
    "cd D:\other\ckc10
    "cd D:\other\avr\chg-pile-test
    "cd R:\08 - R&D\02 - Robin Li\SVN\Wuxi\Firmware\F29 - 701604 Charger kit charger -CKC- 1208\CKC10
    set path+=\**
    set path+=$Vim
"}

"Key Map {

    " 定义快捷键关闭当前分割窗口
    nmap <Leader>q :q<CR>
    " 定义快捷键保存当前窗口内容
    nmap <Leader>w :w<CR>
    " 定义快捷键保存所有窗口内容并退出 vim
    nmap <Leader>wa :wa<CR>
    " 不做任何保存，直接退出 vim
    nmap <Leader>qa :qa!<CR>
    " 依次遍历子窗口
    nnoremap <Leader>ww  <C-W><C-W>
    " 跳转至右方的窗口
    nnoremap <Leader>lw <C-W>l
    " 跳转至左方的窗口
    nnoremap <Leader>hw <C-W>h
    " 跳转至上方的子窗口
    nnoremap <Leader>kw <C-W>k
    " 跳转至下方的子窗口
    nnoremap <Leader>jw <C-W>j

    "光标上下各加一空行
    :map <leader>sp O<Esc>jo<Esc>k

    :map <F3> :NERDTreeMirror<CR>
    :map <F3> :NERDTreeToggle<CR>
    :imap <F3> <ESC>:NERDTreeToggle<CR>

"    :map <F4> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q <CR><CR>
"    :imap <F4> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<CR><CR>
    :map<F4> :!ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c++<CR><CR>
    :imap<F4> <ESC>:!ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c++<CR><CR>

    :nmap <Leader>tb :TagbarToggle<CR>        "快捷键设置
    :map <F5> :TagbarToggle<CR>  "\tb 打开tagbar窗口
    :imap <F5> <Esc>:TagbarToggle<CR>  "\tb 打开tagbar窗口

    :map <F6> :!cscope -Rbq<CR><CR>
    :imap <F6> <Esc>:!cscope -Rbq<CR><CR>
    :map <F7> :cs add cscope.out<CR><CR>
    :imap <F7> <Esc>:cs add cscope.out<CR><CR>

    :map <F11> :so $myvimrc<CR>
    :imap <F11> <Esc>:so $myvimrc<CR>
    :map <F12> :tabe $vim/_vimrc<CR>
    :imap <F12> <Esc>:tabe $vim/_vimrc<CR>


"}

"auto working for vimrc {
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
"}

"Print setting {
    set printoptions=paper:A4,syntax:y,wrap:y
"}
