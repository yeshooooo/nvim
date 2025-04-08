-- 检测是否在VSCode中运行
local in_vscode = vim.g.vscode ~= nil

-- 仅在VSCode环境中设置基本选项
if in_vscode then
  -- 设置leader键
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "
  
  -- 基本的VSCode特定键位映射
  vim.keymap.set('v', '<C-c>', '"+y')  -- Visual模式下Ctrl+c复制到系统剪贴板
  
  -- VSCode命令集成
  if pcall(require, "vscode") then
    vim.keymap.set("n", "<leader>e", "<Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>")
  end
else
  -- 非VSCode环境，加载完整配置
  -- 有些配置要在lazy之前设置，所以设立放在上面
  require("options")
  
  require("lazy_init")
  -- 引入config目录下的配置
  -- 这里让lua查找config目录下的init.lua
  -- require("config")
  
  -- 这里要在之后，因为which-key依赖lazynvim中导入的插件
  require("keymaps")
end 