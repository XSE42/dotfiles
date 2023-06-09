""" **************************************************
""" START: Basic Settings ****************************
""" **************************************************

set nocompatible  " 禁用vi兼容模式，可以使用更多属于vim的功能


""" 编码
set encoding=utf-8  " VIM内部的编码方式（buffer、寄存器、脚本中的字符串等）
set fileencoding=utf-8  " 文件编码方式，保存文件时也会将文件保存为这种编码
set termencoding=utf-8  " 终端编码方式，用于在终端的显示


""" 文件
filetype on  " 检测文件类型
filetype plugin on  " 根据文件类型激活相关Plugin
filetype indent on  " 根据文件类型设置缩进格式
set autowrite  " 自动保存
set confirm  " Confirm to save changes before exiting modified buffer
set sessionoptions=buffers,curdir,tabpages,winsize  " 保存会话的内容
" set undofile  " 保存undo文件，使得Vim关闭重开后仍然可以进行动作撤销
set undolevels=10000
set updatetime=200  " Save swap file and trigger CursorHold
set autoread  " 自动载入外部修改
autocmd FocusGained,BufEnter * checktime


""" 编辑
syntax on  " 语法高亮

set number  " 行号
set wrap  " 长行回绕，在下一行显示
set ruler  " 显示光标所在行和列
set cursorline  " 高亮光标所在行
set scrolloff=4  " 光标与屏幕上下边缘的最小距离
set sidescrolloff=8  " 光标与屏幕左右边缘的最小距离
set formatoptions=jcroqlnt  " 自动换行时如何调整格式
set whichwrap+=b,s,<,>,[,],h,l  " 设置水平移动按键可以移动到上一行或下一行
set conceallevel=0  " 正常显示concealed text

" indent: 若用了set indent, set ai等设置，可用backspace将字段缩进删除
" 否则在字段缩进处按backspace无响应
" eol: insert模式下在行开头，通过backspace合并两行
" 否则无法合并两行
" start: 可以删除此次insert之前编辑的内容
" 否则只能删除这次insert编辑的内容
set backspace=indent,eol,start

set autoindent  " 根据上一行决定新行的缩进
set shiftround  " Round indent to multiple of 'shiftwidth'
set shiftwidth=4  " 缩进使用的步进单位，以空格数计
set tabstop=4  " <Tab>在文件中的空格数，只修改<Tab>的显示宽度 (本质上还是'\t')
set softtabstop=4  " 编辑时<Tab>使用的空格数，只修改按<Tab>的行为，不修改<Tab>的显示宽度
set expandtab  " 键入<Tab>时使用空格。如果要插入<Tab>字符，需要按<CTRL-V>键，再按<Tab>键

set showmatch  " 在输入闭括号时，短暂地跳转到与之匹配的开括号
set matchtime=5  " 跳转到匹配的开括号的时间长度 (5表示0.5s)

set list  " <Tab>显示为 ^I ，而 $ 显示在每行的结尾
set listchars=tab:>-,trail:-  " <Tab>显示为 >--- ，空格显示为 -

set clipboard=unnamed  " 系统剪贴板
set mouse=a  " 允许使用鼠标


""" 搜索
set wrapscan  " 搜索在文件尾折回文件头
set ignorecase  " 默认忽略大小写敏感
set smartcase  " 若输入的搜索内容含有大写字母，则切换回大小写敏感
set incsearch  " 在输入搜索内容的同时搜索，按<Esc>取消搜索
set hlsearch  " 高亮搜索内容
set grepformat=%f:%l:%c:%m  " （在VIM中使用:grep进行）跨文件搜索的结果显示格式


""" 状态栏
set showcmd  " 显示目前执行的命令
set showmode  " 显示VIM当前模式 (insert, visual ...)
" 设置状态栏显示的信息
" %c是列号，以字节数计 (比如一个'\t'只会让%c加1)
" %v是虚列号，即在屏幕上是第%v列 (比如一个'\t'会让%v加4)
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v]\ [LEN=%L]
set laststatus=2  " 总是显示状态栏


""" 窗口
set splitbelow  " 水平split时，新窗口在下方
set splitright  " 垂直split时，新窗口在右侧
set winminwidth=5  " Minimum window width


""" 命令
set autochdir  " 自动切换到当前文件的工作目录

set wildmenu  " 命令行补全
set wildmode=longest:full,full  " 命令行补全

""" END: Basic Settings ******************************
""" **************************************************



""" --------------------------------------------------
