--[[
Description: 
Author: yeshooo@马超
version: 
Date: 2024-12-05 11:42:30
LastEditors: yeshooo@马超
LastEditTime: 2024-12-05 11:42:39
--]]
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  }
}