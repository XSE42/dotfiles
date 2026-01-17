local opt = vim.opt
local state_dir = vim.fn.stdpath("state")  -- $XDG_STATE_HOME/nvim


-- 编码
opt.encoding = "utf-8" -- VIM内部的编码方式（buffer、寄存器、脚本中的字符串等）
opt.fileencoding = "utf-8" -- 文件编码方式，保存文件时使用的编码
opt.fileencodings = { "ucs-bom", "utf-8" } -- 读取文件时尝试的编码方式列表


-- 文件
opt.confirm = true -- 在关闭有未保存修改的buffer时，弹出确认提示
opt.hidden = true -- 允许在有未保存修改的buffer间切换
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" } -- 保存会话的内容

opt.undofile = true
opt.undodir = state_dir .. "/undo//"
opt.undolevels = 10000

opt.directory = state_dir .. "/swap//"

opt.backup = false
opt.writebackup = false

opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.autoread = true -- 自动载入外部修改
-- autoread checktime
local autoread_checktime = vim.api.nvim_create_augroup("autoread_checktime", { clear = true })
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  group = autoread_checktime,
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})


-- 编辑
opt.number = true -- 行号
opt.relativenumber = true -- 相对行号
local numbertoggle = vim.api.nvim_create_augroup("numbertoggle", { clear = true })
local function set_relativenumber(enable)
  if vim.wo.number then
    vim.wo.relativenumber = enable
  end
end
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  group = numbertoggle,
  callback = function()
    set_relativenumber(false) -- 只保留绝对行号
  end,
})
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  group = numbertoggle,
  callback = function()
    set_relativenumber(true) -- 同时使用绝对行号和相对行号
  end,
})

opt.wrap = true -- 长行回绕，在下一行显示
opt.linebreak = true -- 单词换行，而不是字符换行
opt.breakindent = true -- 保持缩进对齐
opt.showbreak = "↪ " -- 换行时在行首显示的符号

opt.ruler = true -- 显示光标所在行和列
opt.cursorline = true -- 高亮当前行
opt.scrolloff = 4 -- 光标与屏幕上下边缘的最小距离
opt.sidescrolloff = 8 -- 光标与屏幕左右边缘的最小距离
opt.formatoptions = "crqj" -- 控制自动格式化的行为
opt.whichwrap = "bs<>[]hl" -- 设置水平移动按键可以移动到上一行或下一行
opt.conceallevel = 0 -- 正常显示concealed text
-- opt.backspace = indent,eol,start

opt.autoindent = true -- 根据上一行决定新行的缩进
opt.shiftround = true -- Round indent to multiple of 'shiftwidth'
opt.expandtab = true -- 按下<Tab>时插入空格。如果要插入<Tab>字符，需要按<CTRL-V>键，再按<Tab>键
opt.softtabstop = 4 -- 当expandtab被设置时，按下<Tab>或<BackSpace>时插入或删除的空格数
opt.shiftwidth = 4 -- >>、<<、==、自动缩进使用的缩进宽度。设置expandtab时，>>插入shiftwidth个空格
                   -- 设置noexpandtab时，>>插入混合的'\t'和空格，使得视觉宽度增加shiftwidth
opt.tabstop = 4 -- '\t'字符的显示宽度
-- Makefile必须使用真实Tab
vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.softtabstop = 0
    vim.opt_local.shiftwidth = 8
    vim.opt_local.tabstop = 8
  end,
})

opt.showmatch = true -- 在输入闭括号时，短暂地跳转到与之匹配的开括号
opt.matchtime = 5 -- 跳转到匹配的开括号的时间长度 (5表示0.5s)

opt.list = true -- <Tab>显示为 ^I ，而 $ 显示在每行的结尾
opt.listchars = {
  tab = "→ ",
  trail = "·",
  extends = "›",
  precedes = "‹",
} -- <Tab>显示为 → ，空格显示为 ·

-- In X11, There are three documented selections: PRIMARY, SECONDARY, CLIPBOARD
-- PRIMARY is used for last selected text, and CLIPBOARD is used for copy/paste operations
-- In X11, register `*` is mapped to PRIMARY and register `+` is mapped to CLIPBOARD
-- In Win/MacOS, `unnamed` and `unnamedplus` both use clipboard register `*` and `+`, which are mapped to CLIPBOARD
opt.clipboard = { "unnamedplus" }

opt.mouse = "a" -- 允许使用鼠标

opt.errorbells = false -- 防止误触响铃
opt.visualbell = false -- 防止误触闪屏


-- 搜索
opt.wrapscan = true -- 搜索在文件尾折回文件头
opt.ignorecase = true -- 默认忽略大小写敏感
opt.smartcase = true -- 若输入的搜索内容含有大写字母，则切换回大小写敏感
opt.incsearch = true -- 在输入搜索内容的同时搜索，按<Esc>取消搜索
opt.inccommand = "nosplit" -- 实时预览替换结果
opt.hlsearch = true -- 高亮搜索内容
opt.grepformat = "%f:%l:%c:%m,%f:%l:%m" -- （在VIM中使用:grep进行）跨文件搜索的结果显示格式
-- opt.grepprg = "rg --vimgrep" -- 在VIM中使用:grep实际调用的shell工具


-- 状态栏
opt.showcmd = true -- 显示目前执行的命令
opt.showmode = false -- 不显示VIM当前模式，因为已有状态栏 (insert, visual ...)
opt.laststatus = 3 -- nvim 全局状态栏
opt.cmdheight = 2 -- 用于命令行的屏幕行数


-- 窗口
opt.splitbelow = true -- 水平split时，新窗口在下方
opt.splitright = true -- 垂直split时，新窗口在右侧
opt.winminwidth = 5 -- Minimum window width


-- 命令
opt.inccommand = "nosplit" -- Shows the effects of a command incrementally in the buffer
opt.wildmode = "longest:full,full" -- 命令行补全
opt.wildignore:append({
  "*.o",
  "*.obj",
  "*.pyc",
  "*/__pycache__/*",
  "*/.git/*",
  "*/.hg/*",
  "*/.svn/*",
})


-- 性能
opt.lazyredraw = true -- 在执行宏、搜索等操作时，不会在每一步中间状态都刷新屏幕，提升性能
opt.redrawtime = 1500 -- 语法高亮的最大时间，避免极端大文件/复杂高亮导致的卡死
opt.synmaxcol = 300 -- 只对前300列进行语法高亮，提升性能
-- 大文件保护
local LARGE_FILE_THRESHOLD = 5 * 1024 * 1024  -- 5 MB
local large_file = vim.api.nvim_create_augroup("LargeFile", { clear = true })
vim.api.nvim_create_autocmd("BufReadPre", {
  group = large_file,
  callback = function(args)
    local fname = args.file
    if not fname or fname == "" then return end

    local ok, stat = pcall(vim.loop.fs_stat, fname)
    if not ok or not stat then return end

    if stat.size <= LARGE_FILE_THRESHOLD then
      return
    end

    vim.b.largefile = true -- 标记为大文件，以便其他插件检测

    vim.opt_local.syntax = "off"
    vim.opt_local.current_syntax = nil
    vim.opt_local.filetype = "text"
    vim.opt_local.list = false
    vim.opt_local.undofile = false
    vim.opt_local.undolevels = -1
    vim.opt_local.swapfile = false
    if vim.treesitter then
      pcall(vim.treesitter.stop, args.buf)
    end
  end,
})

-- 补全
opt.completeopt = { "menu", "menuone", "noselect" } -- 补全时选项，不自动选择
opt.pumblend = 10 -- 弹出菜单的不透明度
opt.pumheight = 10 -- 弹出菜单的高度


-- 外观
opt.signcolumn = "yes" -- 总是显示sign column，否则每次diagnostics appear/become resolved都会移动文本
opt.termguicolors = true -- 允许使用自定义主题
