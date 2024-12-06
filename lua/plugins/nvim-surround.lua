--[[
Description: 
Author: yeshooo@马超
version: 
Date: 2024-12-04 14:53:19
LastEditors: yeshooo@马超
LastEditTime: 2024-12-04 14:53:27
--]]
return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
      require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
      })
  end
}