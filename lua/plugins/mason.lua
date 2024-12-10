--[[
Description: 
Author: yeshooo@马超
version: 
Date: 2024-12-09 16:19:39
LastEditors: yeshooo@马超
LastEditTime: 2024-12-10 16:13:21
--]]
return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "cmake",  -- 这会自动安装 cmake-language-server
          "tailwindcss",
          "volar",
          
        },
        automatic_installation = true,
      })
      
      -- LSP 配置
      local lspconfig = require("lspconfig")
      
      -- CMake 配置
      lspconfig.cmake.setup{
        init_options = {
          buildDirectory = "build"
        },
        capabilities = require('cmp_nvim_lsp').default_capabilities(), 
        on_attach = function(client, bufnr)
          local opts = { noremap=true, silent=true, buffer=bufnr }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        end
      }
    end
  }
}
