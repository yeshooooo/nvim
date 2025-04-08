-- VSCode特定的键位映射，不依赖which-key

-- 系统剪贴板集成
vim.keymap.set('v', '<C-c>', '"+y')  -- Visual模式下Ctrl+c复制到系统剪贴板

-- VSCode特定命令
-- 关闭当前标签
vim.keymap.set("n", "<leader>c", "<Cmd>lua require('vscode').call('workbench.action.closeEditorInAllGroups')<CR>", {desc = "Close Current Tab"})

-- 打开文件目录栏
vim.keymap.set("n", "<leader>e", "<Cmd>lua require('vscode').call('workbench.action.toggleSidebarVisibility')<CR>", {desc = "toggleSidebarVisibility"})
vim.keymap.set("n", "<leader>a", "<Cmd>lua require('vscode').call('workbench.action.toggleActivityBarVisibility')<CR>", {desc = "toggleActivityBarVisibility"})

-- 切换焦点（在编辑区和文件树之间切换）
vim.keymap.set("n", "<leader><leader>f", "<Cmd>lua require('vscode').call('workbench.action.focusSideBar')<CR>", {desc = "Toggle Focus"})

-- Flash插件键位绑定（避免使用which-key注册方式）
-- 使用pcall更安全地加载Flash插件
local flash_ok, flash = pcall(require, "flash")
if flash_ok then
  -- s键触发flash跳转
  vim.keymap.set({"n", "x", "o"}, "s", function() flash.jump() end, {desc = "Flash"})
  -- 操作模式下的r键触发远程flash
  vim.keymap.set("o", "r", function() flash.remote() end, {desc = "Remote Flash"})
  -- 命令模式下的Ctrl+s切换flash搜索
  vim.keymap.set("c", "<c-s>", function() flash.toggle() end, {desc = "Toggle Flash Search"})
  -- 大写S键触发treesitter跳转
  vim.keymap.set({"n", "x", "o"}, "S", function() flash.treesitter() end, {desc = "Flash Treesitter"})
  -- 操作模式和可视模式下的大写R键触发treesitter搜索
  vim.keymap.set({"o", "x"}, "R", function() flash.treesitter_search() end, {desc = "Treesitter Search"})
end 