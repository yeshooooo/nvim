


vim.keymap.set('v', '<C-c>', '"+y')  -- Visual模式下Ctrl+c复制到系统剪贴板

-- keymaps.lua

-- 检查是否在 VSCode 中运行
-- 这里未生效，因为默认vscode中的action是system处理的，这里vscode中默认是Alt + arrowdown/up..
if vim.g.vscode then
  -- VSCode Neovim 扩展的键位映射
  vim.keymap.set('n', '<A-j>', "<Cmd>call VSCodeNotify('editor.action.moveLinesDownAction')<CR>")
  vim.keymap.set('n', '<A-k>', "<Cmd>call VSCodeNotify('editor.action.moveLinesUpAction')<CR>")
  
  vim.keymap.set('x', '<A-j>', "<Cmd>call VSCodeNotify('editor.action.moveLinesDownAction')<CR>")
  vim.keymap.set('x', '<A-k>', "<Cmd>call VSCodeNotify('editor.action.moveLinesUpAction')<CR>")
  
  vim.keymap.set('i', '<A-j>', "<Cmd>call VSCodeNotify('editor.action.moveLinesDownAction')<CR>")
  vim.keymap.set('i', '<A-k>', "<Cmd>call VSCodeNotify('editor.action.moveLinesUpAction')<CR>")
else
  -- 原生 Neovim 的映射
  vim.keymap.set('n', '<A-j>', '<cmd>m .+1<CR>==')
  vim.keymap.set('n', '<A-k>', '<cmd>m .-2<CR>==')
  
  vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
  vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")
  
  vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<CR>==gi')
  vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<CR>==gi')
end

local wk = require("which-key") -- 这里是导入模块，插件已经在which-key.lua中引入的，注意区分

-- 这里使用which-key进行设置
-- which-key的 register 函数不仅提供提示功能，同时也会设置键位映射，它内部会调用 vim.keymap.set 来实现按键功能

-- 

-- flash.nvim设置，在vscode和neovim中均通用
-- Flash.nvim 键位映射，在 VSCode 和 Neovim 中都生效
wk.add({
  -- 基础映射（VSCode 和 Neovim 通用）
  { "s", function() require("flash").jump() end, desc = "Flash", mode = { "n", "x", "o" } },
  { "r", function() require("flash").remote() end, desc = "Remote Flash", mode = "o" },
  { "<c-s>", function() require("flash").toggle() end, desc = "Toggle Flash Search", mode = "c" },
  

})
if not vim.g.vscode then
  wk.add(
    {
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" }
    }
  )
end





