-- TODO: check keys
return {
  -- NOTE: https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/motion/mini-surround/init.lua key mappings description
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.flash-nvim" },
  {
    "folke/flash.nvim",
    -- 禁用 community中 对应的预设的键位，改为在keymaps.lua中修改为自己的
    keys = function() return {} end,
  },
}
