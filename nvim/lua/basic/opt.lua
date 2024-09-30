vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-----------  Basic Option Config  ----------

-- 行号
opt.relativenumber = true
opt.number = true
opt.scrolloff = 999
opt.sidescrolloff = 999 -- 光标左右留空

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true -- 添加智能缩进

-- 防止包裹
opt.wrap = false
opt.linebreak = true -- 确保换行不断字

-- 光标行
opt.cursorline = true
-- opt.cursorcolumn = true  -- 高亮当前列

-- 鼠标
opt.mouse:append("a")

-- 系统粘贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true -- 增量搜索
opt.hlsearch = true  -- 高亮搜索结果

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"

-- 其他设置
opt.backup = false      -- 禁用备份文件
opt.writebackup = false -- 禁用写入备份
opt.swapfile = false    -- 禁用交换文件
opt.undofile = true     -- 启用撤销文件

-- 文件处理
opt.autoread = true -- 自动读取文件更新

-- 性能优化
opt.updatetime = 300 -- 提升更新速度
opt.timeoutlen = 500 -- 映射等待时间
opt.ttimeoutlen = 50 -- 终端映射等待时间

-- 可视化设置
opt.showmode = false -- 不显示当前模式
opt.laststatus = 2   -- 总是显示状态行
opt.showcmd = true   -- 显示命令
opt.ruler = true     -- 显示标尺
-- opt.list = true          -- 显示不可见字符

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
