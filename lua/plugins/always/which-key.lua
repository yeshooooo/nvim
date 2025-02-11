return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      -- 它会调用 which-key 的 show 函数，参数 global = false,它只显示当前缓冲区（buffer）的本地键位映射
      -- 快速查看当前文件/缓冲区特有的键位映射
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
