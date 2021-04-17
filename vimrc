" 修改leader键
let mapleader = ',' 
" 开启语法高亮
syntax on
" 开启文件类型检测
filetype plugin indent on

let g:vimrcroot        = fnamemodify(resolve(expand('<sfile>:p')), ':h') . "/"
let g:file_vimrc       = g:vimrcroot . 'vimrc'
let g:file_vimrc_plug  = g:vimrcroot . 'vimrc.plug'
let g:file_vimrc_local = $HOME . '/.vimrc.local'
let load_plug = 0

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

noremap <leader>evv :execute 'e ' . g:file_vimrc<cr>
noremap <leader>evl :execute 'e ' . g:file_vimrc_local<cr>
noremap <leader>evp :execute 'e ' . g:file_vimrc_plug<cr>
noremap <leader>config :e $VIMRC<cr>
noremap <leader>so  :execute 'source ' . g:file_vimrc<cr>

" 快速选中
nnoremap <space> viw

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
if filereadable(expand(g:file_vimrc_local))
    execute 'source ' . g:file_vimrc_local
end

" 加载 .vimrc.plug
if load_plug && filereadable(expand(g:file_vimrc_plug))
    execute 'source ' . g:file_vimrc_plug
end


