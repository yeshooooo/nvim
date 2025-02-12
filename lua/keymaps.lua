


vim.keymap.set('v', '<C-c>', '"+y')  -- Visual模式下Ctrl+c复制到系统剪贴板

-- keymaps.lua

-- formatting 格式化


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
  { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" }
  

})

-- 这里原来是在vscode中不启用tree-sitter，现在觉得还是启用更好，但是原来的设置不删除
--[[ if not vim.g.vscode then
  wk.add(
    {
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" }
    }
  )
end ]]





