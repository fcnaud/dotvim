
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
" set nowrap
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



"================================
" 插件
"================================
call plug#begin('~/.vim/plugged')

" 增强功能
Plug 'vim-airline/vim-airline'          " 状态栏增强
Plug 'vim-airline/vim-airline-themes'   " 状态栏主题
Plug 'Yggdroot/LeaderF'                 " 模糊查找
Plug 'Yggdroot/indentLine'              " 显示缩进层级
Plug 'raimondi/delimitmate'             " 括号补全
Plug 'octol/vim-cpp-enhanced-highlight' " 高亮 cpp 
Plug 'scrooloose/nerdtree'              " 树状目录

" colorscheme
Plug 'soft-aesthetic/soft-era-vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'logico-dev/typewriter'
Plug 'rakr/vim-one'


call plug#end()

"================================
" 插件设置
"================================
map <leader>tt :NERDTreeToggle<cr>

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

" 分屏跳转
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" 自动加载vimrc
autocmd! bufwritepost vimrc source $MYVIMRC

map <leader>config :e! $MYVIMRC<cr>
map <leader>so :source $MYVIMRC<cr>

" 
nmap <space> viwg~

" 加载 .vimrc.local 
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
end
