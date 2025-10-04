local opt = vim.opt


-- 编码
opt.encoding = "utf-8" -- VIM内部的编码方式（buffer、寄存器、脚本中的字符串等）
opt.fileencoding = "utf-8" -- 当前编辑文件的编码方式，保存文件时也会将文件保存为这种编码


-- 文件
opt.autowrite = true -- 自动保存
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" } -- 保存会话的内容
opt.undofile = true -- 保存undo文件，使得Vim关闭重开后仍然可以进行动作撤销
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold


-- 编辑
opt.number = true -- 行号
opt.relativenumber = true -- 相对行号
opt.wrap = true -- 长行回绕，在下一行显示
opt.ruler = true -- 显示光标所在行和列
opt.cursorline = true -- 高亮当前行
opt.scrolloff = 4 -- 光标与屏幕上下边缘的最小距离
opt.sidescrolloff = 8 -- 光标与屏幕左右边缘的最小距离
opt.formatoptions = "jcroqlnt" -- 自动换行时如何调整格式
opt.whichwrap = "bs<>[]hl" -- 设置水平移动按键可以移动到上一行或下一行
opt.conceallevel = 0 -- 正常显示concealed text

opt.autoindent = true -- 根据上一行决定新行的缩进
opt.shiftround = true -- Round indent to multiple of 'shiftwidth'
opt.shiftwidth = 4 -- 缩进使用的步进单位，以空格数计
opt.tabstop = 4 -- <Tab>在文件中的空格数，只修改<Tab>的显示宽度 (本质上还是'\t')
opt.softtabstop = 4 -- 编辑时<Tab>使用的空格数，只修改按<Tab>的行为，不修改<Tab>的显示宽度
opt.expandtab = true -- 键入<Tab>时使用空格。如果要插入<Tab>字符，需要按<CTRL-V>键，再按<Tab>键
-- opt.backspace = indent,eol,start

opt.showmatch = true -- 在输入闭括号时，短暂地跳转到与之匹配的开括号
opt.matchtime = 5 -- 跳转到匹配的开括号的时间长度 (5表示0.5s)

opt.list = true -- <Tab>显示为 ^I ，而 $ 显示在每行的结尾
opt.listchars = { tab = ">-", trail = "-" } -- <Tab>显示为 >--- ，空格显示为 -

-- In X11, There are three documented selections: PRIMARY, SECONDARY, CLIPBOARD
-- PRIMARY is used for last selected text, and CLIPBOARD is used for copy/paste operations
-- In X11, register `*` is mapped to PRIMARY and register `+` is mapped to CLIPBOARD
-- In Win/MacOS, `unnamed` and `unnamedplus` both use clipboard register `*` and `+`, which are mapped to CLIPBOARD

-- opt.clipboard = "unnamedplus" -- In X11, use clipboard register `+` instead of `*` for all operations
opt.clipboard = { "unnamed", "unnamedplus" } -- In X11, use clipboard register `+` instead of `*` for all operations
                                             -- except yank and delete. When `unnamed` is also included, yank and delete
                                             -- operations will additionally copy the text into register `*`
opt.mouse = "a" -- 允许使用鼠标


-- 搜索
opt.wrapscan = true -- 搜索在文件尾折回文件头
opt.ignorecase = true -- 默认忽略大小写敏感
opt.smartcase = true -- 若输入的搜索内容含有大写字母，则切换回大小写敏感
opt.incsearch = true -- 在输入搜索内容的同时搜索，按<Esc>取消搜索
opt.hlsearch = true -- 高亮搜索内容
opt.grepformat = "%f:%l:%c:%m" -- （在VIM中使用:grep进行）跨文件搜索的结果显示格式
-- opt.grepprg = "rg --vimgrep" -- 在VIM中使用:grep实际调用的shell工具


-- 状态栏
opt.showcmd = true -- 显示目前执行的命令
opt.showmode = false -- 不显示VIM当前模式，因为已有状态栏 (insert, visual ...)
opt.laststatus = 0 -- 0: 从不 2: 总是 （显示状态栏）
opt.cmdheight = 2 -- 用于命令行的屏幕行数


-- 窗口
opt.splitbelow = true -- 水平split时，新窗口在下方
opt.splitright = true -- 垂直split时，新窗口在右侧
opt.winminwidth = 5 -- Minimum window width


-- 命令
opt.inccommand = "nosplit" -- Shows the effects of a command incrementally in the buffer
opt.wildmode = "longest:full,full" -- 命令行补全


-- 补全
opt.completeopt = { "menu", "menuone", "noselect" } -- 补全时选项，不自动选择
opt.pumblend = 10 -- 弹出菜单的不透明度
opt.pumheight = 10 -- 弹出菜单的高度


-- 外观
opt.signcolumn = "yes" -- 总是显示sign column，否则每次diagnostics appear/become resolved都会移动文本
opt.termguicolors = true -- 允许使用自定义主题
