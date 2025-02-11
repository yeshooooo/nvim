return {
  {
    "folke/tokyonight.nvim",
    dependencies = {
      -- 状态栏
      "nvim-lualine/lualine.nvim",
      -- 图标
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      vim.cmd [[colorscheme tokyonight-storm]]
      require("lualine").setup {
      options = {
          theme = 'tokyonight'
        },
      }
    end
  },

}


