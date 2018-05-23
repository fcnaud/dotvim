" 修改leader键
let mapleader = ',' 
" 开启语法高亮
syntax on
" 开启文件类型检测
filetype plugin indent on


"================================
" 基础设置
"================================

" 开启关于文件检测相关
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" 文件修改后自动载入
set autoread

" 取消备份
set nobackup
" 取消swap
set noswapfile

" 高亮当前行列
set cursorcolumn
set cursorline

" 禁用鼠标
set mouse-=a

" 大概是和title相关的一些东西
set title

" 设置gui相关的东西
" 设置字体
set guifont=DejaVu\ Sans\ Mono\ 24
" set guifont=Courier\ 10\ Pitch\ 20
set guioptions-=m
set guioptions-=T

" 编码
set encoding=utf-8

" 不过这些东西好像在vim中是默认打开的
" 显示正在输入的命令
set showcmd
" 显示当前的行号列号
set ruler
" 右下角显示当前vim模式
set showmode
" 在移动光标的时候，上下的保留行数
set scrolloff=7
" 状态栏的行数
set laststatus=2
" 开启行号显示
set number
" 取消换行
set nowrap
" 括号配对情况
set showmatch

" 搜索
" 高亮搜索结果
set hlsearch
" 增量搜索模式，输入的时候即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 搜索文本中有大写时仍然大小写敏感
set smartcase

" 代码折叠
set foldenable
" 折叠方法
" manual 手工
" indent 使用缩进
" expr 表达式
" syntax 使用语法
" diff 对没有更改的文本
" marker 使用标记进行折叠 默认标记是 {{{ }}}
set foldmethod=indent
set foldlevel=99

" 缩进配置
set smartindent
" 打开自动缩进
set autoindent

" tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
" 使用空格替换tab
set expandtab


" 行号
set relativenumber number
" 插入模式使用绝对行号
autocmd InsertEnter * :set norelativenumber number
" 普通模式使用相对行号
autocmd InsertLeave * :set relativenumber number


" 不可见字符
set listchars=tab:>-,trail:∙
highlight SpecialKey ctermfg=6
set list

" highlight
hi Normal  ctermbg=NONE guibg=NONE
hi LineNr  ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

"================================
" 插件 PLUG
"================================
call plug#begin('~/.vim/plugged')

" 增强功能
Plug 'itchyny/lightline.vim'            " 状态栏
" Plug 'vim-airline/vim-airline'        " 状态栏增强
" Plug 'vim-airline/vim-airline-themes' " 状态栏主题
Plug 'Yggdroot/LeaderF'                 " 模糊查找
Plug 'Yggdroot/indentLine'              " 显示缩进层级
Plug 'raimondi/delimitmate'             " 括号补全
Plug 'luochen1990/rainbow'              " 括号高亮
Plug 'scrooloose/nerdtree'              " 树状目录
Plug 'w0rp/ale'                         " 动态检查
Plug 'ludovicchabant/vim-gutentags'     " 自动生成tags
"Plug 'mhinz/vim-signify'               " 显示 diff 支持多种版本库
Plug 'airblade/vim-gitgutter'           " 只支持 git
Plug 'ryanoasis/vim-devicons'           " vim dev icons
Plug 'valloric/youcompleteme'           " 自动补全
Plug 'tpope/vim-fugitive'               " git

" colorscheme
Plug 'soft-aesthetic/soft-era-vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'logico-dev/typewriter'
Plug 'rakr/vim-one'

" c/c++
Plug 'octol/vim-cpp-enhanced-highlight' " 高亮 cpp 


call plug#end()

"================================
" 插件设置
"================================
"----------------
" delimitmate
"----------------
" '┆'
let g:indentLine_char = '┆'
map <leader>tt :NERDTreeToggle<cr>

"----------------
" tags
"----------------
" 设置 tags 查找路径
set tags=./.tags;,.tags

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"----------------
"- rainbow
"----------------
let g:rainbow_active=1

"----------------
"- ale
"----------------
"let g:ale_linters = {
"\  'c':['cppcheck'],
"\}
" 始终显示提示侧栏
let g:ale_sign_column_always=1
" 高亮错误地点
let g:ale_set_highlights=1
" 自定义error和warning图标
" 😢😡
let g:ale_sign_error='✗'
let g:ale_sign_warning='?'
let g:ale_lint_on_text_changed='normal'
let g:ale_lint_on_insert_leave=1
let g:ale_c_gcc_options='-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options='-Wall -O2 -std=c++11'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
nnoremap sp <Plug>(ale_previous_wrap)
nnoremap sn <Plug>(ale_next_wrap)

"----------------
"- git gutter
"----------------
nnoremap <leader>ggl :GitGutterLineHighlightsToggle<cr>
nnoremap <leader>ggs :GitGutterSignsToggle<cr>
nnoremap <leader>gg  :GitGutterToggle<cr>
" 默认的快捷键
" nmap ]c <Plug>GitGutterNextHunk
" nmap [c <Plug>GitGutterPrevHunk
" nmap <leader>hs <Plug>GitGutterStageHunk
" nmap <leader>hu <Plug>GitGutterUndoHunk
" nmap <leader>hp <Plug>GitGutterPreviewHunk

"----------------
"- leaderf
"----------------
nnoremap <leader>fu :LeaderfFunction<cr>

"----------------
"- youcompleteme
"----------------
let g:ycm_semantic_triggers = {
            \ "c,cpp,python,java,go,erlang,perl":['re!\w{2}'],
            \ "cs,lua,javascript":['re!\w{2}'],
            \ }

"================================
" 主题
"================================
syntax enable
"colorscheme soft-era
"colorscheme space-vim-dark
"colorscheme typewriter
"colorscheme one


"================================
" key map
"================================

" F1 
noremap <F1> <nop>

" split
" 分屏跳转
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" 改变大小
nnoremap = :vertical resize +1<cr>
nnoremap - :vertical resize -1<cr>
nnoremap + :resize +1<cr>
nnoremap _ :resize -1<cr>

" 自动加载vimrc
autocmd! bufwritepost vimrc source $MYVIMRC

noremap <leader>config :e! $MYVIMRC<cr>
noremap <leader>so :source $MYVIMRC<cr>

" 快速选中
nnoremap <space> viwg~

" 
nnoremap <silent> n  nzz
nnoremap <silent> N  Nzz
nnoremap <silent> *  *zz
nnoremap <silent> #  #zz
nnoremap <silent> g* g*zz

" 取消搜索结果高亮
nnoremap <silent><leader>/ :nohls<cr>

" gv 是上一次选中操作
vnoremap < <gv
vnoremap > >gv

" 快速退出和保存
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>

" tab 
noremap  <left>              :tabn<cr>
noremap  <right>             :tabp<cr>
nnoremap <silent> <leader>m  :tabnew<cr>
nnoremap <silent> <leader>e  :tabclose<cr>
nnoremap <silent> <leader>n  :tabn<cr>
nnoremap <silent> <leader>p  :tabp<cr>
nnoremap <silent> <leader>1  :tabn 1<cr>
nnoremap <silent> <leader>2  :tabn 2<cr>
nnoremap <silent> <leader>3  :tabn 3<cr>
nnoremap <silent> <leader>4  :tabn 4<cr>
nnoremap <silent> <leader>5  :tabn 5<cr>
nnoremap <silent> <leader>6  :tabn 6<cr>
nnoremap <silent> <leader>7  :tabn 7<cr>
nnoremap <silent> <leader>8  :tabn 8<cr>
nnoremap <silent> <leader>9  :tabn 9<cr>



" 加载 .vimrc.local 
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
end


