


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