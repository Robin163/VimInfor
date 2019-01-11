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
    " don't display manual
    set go=

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
    set gcr=a:blinkon0 " 禁止光标闪烁
    set showmode           " Display the current mode
    "set laststatus=2       " 总是显示状态栏
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
    "set list
    "set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
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

"Get plugged path{
    " 用户目录变量$VIMFILES
    if GetSystem() == "windows"
        let $PLUG_PATH = $VIM.'/plugged'
        set guifontset=
        set guifont=Consolas:h14
        set guifontwide=YouYuan:h14:b:cGB2312
        "set guifont=Courier_new:h12:b:cDEFAULT
    elseif GetSystem() == "linux"
        let $PLUG_PATH = $HOME.'/.vim/plugged'
        set guifontset=
		set guifont=YaHei\Consolas\Hybrid\ 16
        "set guifont=Courier\new\ 16
    endif
"}

"Plug Manager {
    "packadd! matchit

    syntax enable       " 开启语法高亮功能
    syntax on           " 允许用指定语法高亮配色方案替换默认方案
    set nocompatible    " 去除VI一致性,必须要添加
    filetype off        " 必须要添加
    " 设置包括vundle和初始化相关的runtime path
    "set rtp+=$PLUG_PATH/vundle.vim
    "call vundle#begin('$PLUG_PATH')
    "set rtp+=$PLUG_PATH
    call plug#begin('$PLUG_PATH')
	" 定义插件，默认用法，和 Vundle 的语法差不多
	Plug 'VundleVim/Vundle.vim'
	Plug 'lifepillar/vim-solarized8'
	Plug 'tomasr/molokai'
	Plug 'morhetz/gruvbox'
	" 延迟按需加载，使用到命令的时候再加载或者打开对应文件类型才加载
    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-session'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
    Plug 'bronson/vim-trailing-whitespace'
	Plug 'easymotion/vim-easymotion'
    "Plug 'nathanaelkane/vim-indent-guides'
    Plug 'Raimondi/delimitMate' "auto add another quote
	Plug 'tpope/vim-fugitive'   "git Plug
    Plug 'tpope/vim-surround'   "change delet & add quote
    Plug 'luochen1990/rainbow'  "change color of quotes

	Plug 'ludovicchabant/vim-gutentags'
	Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
    Plug 'majutsushi/tagbar'
    "Plug 'kien/ctrlp.vim'
    Plug 'tpope/vim-abolish'
    Plug 'rking/ag.vim'
    Plug 'yegappan/grep'
    Plug 'beyondgrep/ack2'
    Plug 'dyng/ctrlsf.vim'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'will133/vim-dirdiff'
	Plug '$PLUG_PATH/a.vim'
    Plug 'Valloric/YouCompleteMe'
    "Plug 'WolfgangMehner/c-support'
	Plug 'lilydjwg/fcitx.vim'
	Plug 'gcmt/wildfire.vim'
	Plug 'godlygeek/tabular'
	Plug 'plasticboy/vim-markdown'
	Plug 'vim-scripts/DrawIt'
	"call vundle#end()
    call plug#end()            " 必须
    filetype plugin indent on     "启动自动补全
    au BufNewFile,BufRead *.h  set filetype=c
"}

"Color Theme {
    " Theme solarized
    set rtp+=$PLUG_PATH/vim-solarized8
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    " Theme molokai
    set rtp+=$PLUG_PATH/molokai
    let g:molokai_original = 1
	"Theme gruvbox
    set rtp+=$PLUG_PATH/gruvbox

    if GetSystem() == "windows"
        " Color Setting
        set t_Co=256
        set background=dark
        "set background=light
        "colorscheme solarized8
        "colorscheme molokai
        colorscheme gruvbox
    elseif GetSystem() == "linux"
        " Color Setting
        set t_Co=256
        set background=dark
        "set background=light
		colorscheme solarized8
		"colorscheme molokai
        "colorscheme gruvbox
    endif
"}

"status line {
	let g:airline_theme='luna'
	"let g:airline_theme='molokai'
	"let g:airline_theme='solarized'
	"let g:airline_solarized_bg='dark'
"}

"NerdTree {
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
	let g:session_autoload = 'no'
    " 保存快捷键
    map <leader>ss :SaveSession mysession<CR>
    " 恢复快捷键
    map <leader>rs :OpenSession mysession<CR>

"}

"Space end {
    "for show no user whitespaces
    map <leader><space> :FixWhitespace<CR>
"}

"Easy function {
"}

"indent guides {

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
    let g:rainbow_active = 1

"}

"ctags and tagbar {
    "配置universal ctags
    " 正向遍历同名标签
    nmap <Leader>tn :tnext<CR>
    " 反向遍历同名标签
    nmap <Leader>tp :tprevious<CR>

	" 配置vim-gutentags
	" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
    " pay attention to a.root and .root are different
	let g:gutentags_project_root = ['.root','.svn','.git','.project','.mxproject','*.eww']
	" 所生成的数据文件的名称
	let g:gutentags_ctags_tagfile = '.tags'
	" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
	let s:vim_tags = expand('$HOME/.cache/tags')

	let g:gutentags_cache_dir = s:vim_tags
	" 配置 ctags 的参数
	let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
	let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
	let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

    "配置vim-tagbar
    let g:tagbar_autofocus = 1
    let g:tagbar_width = 30  " 设置tagbar的宽度
    let g:tagbar_sort  = 0   " setting order
"}

"Function & Cscope {

    "if has("cscope")
    "    set csprg=C:/cygwin64/bin/cscope.exe
    "    set csto=0
    "    set cst
    "    set nocsverb
    "    " add any database in current directory
    "    if filereadable("cscope.out")
    "        cs add cscope.out
    "    " else add database pointed to by environment
    "    elseif $CSCOPE_DB != ""
    "        cs add $CSCOPE_DB
    "    endif

    "    set csverb
    "endif

    "nmap <leader>fa :cs add cscope.out <CR>
    "" s: Find this C symbol
    "nmap <leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>
    "" g: Find this definition
    "nmap <leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>
    "" c: Find functions calling this function
    "nmap <leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>
    "" t: Find this text string
    "nmap <leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>
    "" e: Find this egrep pattern
    "nmap <leader>fe :cs find e <C-R>=expand("<cword>")<CR><CR>
    "" f: Find this file
    "nmap <leader>ff :cs find f <C-R>=expand("<cfile>")<CR><CR>
    "" i: Find files #including this file
    "nmap <leader>fi :cs find i <C-R>=expand("<cfile>")<CR><CR>
    "" d: Find functions called by this function
    "nmap <leader>fd :cs find d <C-R>=expand("<cword>")<CR><CR>

"}

"Find Infor{
	let g:Lf_ShortcutF = '<c-p>'
	let g:Lf_ShortcutB = '<m-n>'
	noremap <m-p> :LeaderfFunction!<cr>
	noremap <c-n> :LeaderfMru<cr>
	noremap <m-n> :LeaderfBuffer<cr>
	noremap <m-m> :LeaderfTag<cr>
	let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

	let g:Lf_RootMarkers = ['.root','.svn','.git','.project','.mxproject','*.eww']
	let g:Lf_WorkingDirectoryMode = 'Ac'
	let g:Lf_ReverseOrder = 0
	let g:Lf_WindowHeight = 0.80
	let g:Lf_DefaultMode = 'NameOnly'
	let g:Lf_CacheDirectory = expand('~/.vim/cache')
	let g:Lf_ShowRelativePath = 0
	let g:Lf_HideHelp = 1
	let g:Lf_StlColorscheme = 'powerline'
	let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
    let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg'],
            \ 'file': ['*.swp','*.d','*.lst','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
"}

"search & replace {

    let g:ackprg = 'ag --vimgrep'
    let g:ctrlsf_ignore_dir = ['List', 'build', 'Obj', 'tags']
    " 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。
    " 快捷键速记法：search in files
    nnoremap <Leader>sf :CtrlSF<CR>
"}

"diff files {
"}

".c switch .h {

    set rtp+=$PLUG_PATH/a.vim
	let g:alternateSearchPath =
				\'sfr:../source,
				\sfr:../src,
				\sfr:../Src,
				\sfr:../include,
				\sfr:../inc,
				\sfr:../Inc'

    map <leader>ch :A<CR>
    map <leader>ih :IH<CR>
    map <leader>ic :IH<CR>:A<CR>

"}

"YouCompleteMe {
    " 不显示开启vim时检查ycm_extra_conf文件的信息
    let g:ycm_confirm_extra_conf=0
	" 显示语法错误！
	let g:ycm_show_diagnostics_ui = 1

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }

let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1, 
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ }

    "" 在接受补全后不分裂出一个窗口显示接受的项
    "set completeopt-=preview
    "let g:ycm_add_preview_to_completeopt = 1
    "" 让补全行为与一般的IDE一致
    "set completeopt=menu,menuone
    "" 每次重新生成匹配项，禁止缓存匹配项
    "let g:ycm_cache_omnifunc=0
    "" 在注释中也可以补全
    "let g:ycm_complete_in_comments=1
    "" 输入第一个字符就开始补全
    "let g:ycm_min_num_of_chars_for_completion=2
    ""语法关键字补全
    "let g:ycm_seed_identifiers_with_syntax = 1

    "let g:ycm_collect_identifiers_from_comments_and_strings = 1
    "" 开启 YCM 标签引擎
    "let g:ycm_collect_identifiers_from_tags_files=1
    "" 引入需要的标准库tags
    ""set tags=./tags;
    ""set tags+=C:/WinAVR-20100110/avr/include/tags;
    "inoremap <leader>;     :<C-x><C-o>
    "nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
    "nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
"}

"C vim {

    let g:C_MapLeader = "["
    let g:C_UseTool_make   = 'yes'
    let g:C_UseTool_doxygen = 'yes'
"}

"Markdown {
	let g:vim_markdown_frontmatter=1
"}

"input method {

	" This selects the next closest text object.
	map <SPACE> <Plug>(wildfire-fuel)
	" This selects the previous closest text object.
	vmap <C-SPACE> <Plug>(wildfire-water)
"}

" * and # remap {
    "  * choose the letters in visual mode
    xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
    xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

    function! s:VSetSearch()
        let temp = @s
        norm! gv"sy
        let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
        let @s = temp
    endfunction
" }

"replace function {
    " working with vimgrep
    " =>/Progmatic\ze Vim
    " =>:vimgrep /<C-r>// **/*.txt
    " or =>:grep -r -n 'Progmatic\ze Vim' *
    " =>:Qargs
    " =>:argdo %s//Practical/g
    " =>:argdo update
    command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
    function! QuickfixFilenames()
        let buffer_numbers = {}
        for quickfix_item in getqflist()
            let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
        endfor
        return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
    endfunction
"}

"replace function {
    " should define range before this action
    " for all project just like:
    " :args **/*.c **/*.h
    nnoremap <leader>sr :args bsp/**/*.[ch] hdr/**/*.[ch] iap/**/*.[ch] main/**/*.[ch]<CR>
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
        " 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
        fun! ToggleFullscreen()
            call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
        endf
        " 全屏开/关快捷键
        map <silent> <F11> :call ToggleFullscreen()<CR>
        " 启动 vim 时自动全屏
        autocmd VimEnter * call ToggleFullscreen()
    endif
"}

"hot Key Map {

    "光标上下各加一空行
    nmap    <leader>sp  O<Esc>jo<Esc>k
    "括号内左右各加一个空格
    nmap    <leader>ip  i<Space><Esc>h%i<space><Esc>l%l
    "光标行变成注释行
    nmap    <leader>cc  I/*<Esc>l3x<Esc>A<Space>*/<Esc>
    "注释行变成光标行
    nmap    <leader>co  ^3x$2h3x
	"open markdow
    nmap    <Leader>omd :MarkdownPreview<CR>
    imap    <Leader>omd <Esc>:MarkdownPreview<CR>
	"close markdow
    nmap    <Leader>cmd :MarkdownPreviewStop<CR>
    imap    <Leader>cmd <Esc>:MarkdownPreviewStop<CR>

    " run make all
    nmap    <Leader>ma :make all<CR>:cw<CR><CR>
    " run make clean
    nmap    <Leader>mc :make clean<CR><CR>
    " run make program
    nmap    <Leader>mp :make program<CR><CR><C-o>
    " run make debug
    nmap    <Leader>md :make debug<CR>
    " run make tar
    nmap    <Leader>mt :make tar<CR>
    " run make release
    nmap    <Leader>mr :make release<CR>
    " run make style
    nmap    <Leader>ms :make style<CR>

    map   <silent> <F3>        :NERDTreeMirror<CR>
    map   <silent> <F3>        :NERDTreeToggle<CR>
    map   <silent> <F4>        :!ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
                \                   --fields=+liaS --extra=+q --language-force=c++<CR><CR>
	nnoremap <silent> <F5> :TagbarToggle<CR>
    map   <silent> <F6>        :!cscope -Rbq<CR><CR>
    "map   <silent> <F7>        :cs add cscope.out<CR><CR>

    imap  <silent> <F3>   <ESC>:NERDTreeToggle<CR>
    imap  <silent> <F4>   <ESC>:!ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
                \                   --fields=+liaS --extra=+q --language-force=c++<CR><CR>
    imap  <silent> <F5>   <ESC>:TagbarToggle<CR>    " open tagbar window
    imap  <silent> <F6>   <ESC>:!cscope -Rbq<CR><CR>
    if GetSystem() == "windows"
        map   <silent> <F8>  <ESC>:tabe $VIM/_vimrc<CR>
        imap  <silent> <F8>  <ESC>:tabe $VIM/_vimrc<CR>
    elseif GetSystem() == "linux"
        map   <silent> <F8>  <ESC>:tabe $HOME/.vimrc<CR>
        imap  <silent> <F8>  <ESC>:tabe $HOME/.vimrc<CR>
    endif

    nmap  <Leader>df :vertical diffsplit


"}

"auto working for vimrc {
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
"}

"Print setting {
    set printoptions=paper:A4,syntax:y,wrap:y
"}

