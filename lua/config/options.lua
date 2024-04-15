-- 查询某个不熟悉的配置 :help '配置名' ，如help 'title'
--
-- neovim官网的doc/usr或者 :help查看详细的配置文档
-- lua 和lua guide 教你怎么用lua配置
-- crtl + v相当于alt点击多行，同时操作
local option = vim.opt
local buffer = vim.b
local global = vim.g

-- Global Settings --
-- showmode影响左下角是否有插入这些字，因为后面会装插件，所以这里关闭
option.showmode = false
--
option.backspace = { "indent", "eol", "start" }
-- tab键等4格
option.tabstop = 4
option.shiftwidth = 4
option.expandtab = true

-- 缩进相关
option.shiftround = true
option.autoindent = true
option.smartindent = true

-- 左边显示行号和相当行号:
-- 跳转到第100行 :100
option.number = true
-- 相对行数可以用于快速跳转，比如网上跳10行，10k
option.relativenumber = true

-- 命令模式下自动补全可以有menu
option.wildmenu = true

-- 搜索高亮是否显示全部结果
option.hlsearch = false

-- 模糊搜索相关
option.ignorecase = true
option.smartcase = true

-- 自动补全设置,显示然后控制是否自动选中
-- option.completeopt = { "menuone", "noselect" }
option.completeopt = { "menuone" }
-- 高亮当前缩在行
option.cursorline = true

-- 启用真实颜色
-- 很多插件会用到
option.termguicolors = true

-- 在数字栏左边加一个很短的空格
option.signcolumn = "yes"

-- 文件改动自动读取
option.autoread = true

-- 在终端标题栏上显示文件名和路径
option.title = true

-- 关闭.swap 和backup
option.swapfile = false

-- 插件的触发时间
option.updatetime = 50

-- 所有模式下都启用鼠标
option.mouse = "a"

-- 存储文件的undo编辑信息,这样就算关了文件再打开的时候也可以回退
option.undofile = true
option.undodir = vim.fn.expand "$HOME/.local/share/nvim/undo"
-- 可以一直undo回退到最开始的样子
option.exrc = true

-- 关闭因为太长而多行显示
option.wrap = false

-- 让新打开的文件在右边显示
-- 如用:vsplit xxx
-- 还有:split 默认在上面，:splitdown可能会让新的在下面，待验证
option.splitright = true

-- Buffer Settings --
-- 设置默认为utf-8
buffer.fileenconding = "utf-8"

-- Global settings --
global.mapleader = " "

-- Key mappings --
-- :help 'key-mapping'
-- 禁用上下左右键
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")

-- buffer 有关的快捷键
-- 在normal mode下按alt + tab 切换buffer
-- <cmd> 和 : 等价，但是<cmd>默认是slient模式，不会在状态栏显示按下快捷键后对应的命令结果
vim.keymap.set("n", "<A-Tab>", "<cmd>bNext<CR>", { silent = true })
-- 空格bc关闭buffer
vim.keymap.set("n", "<leader>bc", "<cmd>bd<CR>")

-- 在visual mode下按大些J和K整块移动

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- 将在visual mode下选中的东西通过空格+y 复制到系统剪切板
vim.keymap.set({ "v", "n" }, "<leader>y", '"+y')
