--[[
Description: 
Author: yeshooo@马超
version: 
Date: 2024-12-04 09:00:58
LastEditors: yeshooo@马超
LastEditTime: 2024-12-04 09:01:24
--]]
-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
-- 1. 验证lazy.nvim是否存在
-- 定义一个变量lazypath
-- stdpath("data")
-- macOS/Linux: ~/.local/share/nvim
-- Windows: ~/AppData/Local/nvim-data
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end

-- 2. 将第一步定义的变量加入运行时路径
-- rtp = runtimepath
-- nvim进行路径搜索的时候，除已有的路径，还会从prepend的路径中查找,否则找不到下面的下面 require("lazy") 
vim.opt.rtp:prepend(lazypath)

-- 3. 加载lazy.nvim模块
-- 注意写法区别
-- require("lazy").setup({""})
-- require("lazy").setup({"plugins"})这种写法会尝试加载单个模块 "plugins",它会寻找一个名为 plugins.lua 或 plugins/init.lua 的文件,不会自动扫描 plugins 目录下的其他文件,这种写法通常用于简单的配置，所有插件都定义在同一个文件中
-- 
--
--这里会自动导入lua/plugins 目录下的所有的插件配置,它会扫描整个 plugins 目录，加载所有返回插件规范的 .lua 文件
require("lazy").setup("plugins")