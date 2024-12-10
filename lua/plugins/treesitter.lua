--[[
Description: 
Author: yeshooo@马超
version: 
Date: 2024-12-04 15:20:36
LastEditors: yeshooo@马超
LastEditTime: 2024-12-09 16:23:23
--]]
--[[
Description: 
Author: yeshooo@马超
version: 
Date: 2024-12-04 15:20:36
LastEditors: yeshooo@马超
LastEditTime: 2024-12-05 09:04:27
--]]

--[[
Description: 
Author: yeshooo@马超
version: 
Date: 2024-12-04 15:20:36
LastEditors: yeshooo@马超
LastEditTime: 2024-12-04 15:21:19
--]]
return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  -- 在更新或者安装nvim-treesitter的时候，同时更新所有parser
  build = ":TSUpdate all",

  -- 安装文本对象插件
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },

  -- 设定主模块, 因为官方默认的默认主模块并不是仓库名这个模块
  main = "nvim-treesitter.configs",
  opts = {
	-- tree-sitter的解释器都需要编译安装，我这里为了跨平台统一，同时个人习惯，设置为clang，其他gcc/cl同理
	compilers = { "clangd" },
	
    -- 可以在这列出来需要安装的语言的解析器
    -- 具体支持哪些，查看官方仓库 https://github.com/nvim-treesitter/nvim-treesitter
    -- 这里列出的是我个人对着文档根据自己可能需要的添加的

    ensure_installed = { 
      "bash",
      "c", 
      "cmake",
      "comment", 
      "cpp", 
      "css",
      "csv",
      "desktop",
      "diff",
      "dockerfile",
      "doxygen",
      "fish",
      "func",
      -- git相关
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      -- opengl glsl
      "glsl",
      -- go 语言相关
      "go",
      "goctl",
      "gomod",
      "gotmpl",
      "gowork",

      -- 证书
      "gpg",
      -- 前端自动化工具
      "haskell",
      "haskell_persistent",
      -- d3d着色器
      "hlsl",

      "html",
      "htmldjango",
      "http",

      "java",
      "javascript",
      "jq",
      "json",
      "json5",
      -- "JSON with comments", -- 这个现在有问题

      "kotlin",
      -- 公式
      "latex",

      "lua", 
      "luadoc",
      -- "lua_patterns", -- 有问题

      "make",

      "query", 
      "markdown", 
      "markdown_inline",
      "matlab",
      --汇编
      "nasm",

      "nginx",
      "ninja",
      "php",

      "python",
      -- 正则
      "regex",

      "rust",
      "scss",
      "sql",
      "ssh_config",
      "sxhkdrc",
      "tmux",
      "toml",
      "tsx",
      "typescript",
      "vim", 
      "vimdoc", 

      "vue",
      "xml",
      -- X11配置文件
      "xresources",
      "yaml",

      "zig",
      
    
    },

    -- 也可以安装所有语言的,这里取消安装所有语言的，除了安装所有影响速度外，还有个原因是安装所有语言的会有不确定的插件安装失败
    -- ensure_installed = "all",
    -- 开启高亮
    highlight = {
      enable = true,
    },

    -- 开启更好的indent，方便格式化代码
    indent = {
      enable = true,
    },
    -- 其他待定

    -- 配置依赖插件nvim-treesitter-textobjects的配置
    -- 官方配置： https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    -- 参考： https://github.com/FledgeXu/DotFiles/blob/main/.config/nvim/lua/plugins/treesitter.lua
    -- 参考2： https://github.com/ye-junzhe/BetterNvim/blob/master/lua/Junzhe/plugins/nvim-treesitter.lua
    textobjects = {
      -- 用法：比如选中vaf,vif,删除函数中的内容 dif, daf等
      select = {
          enable = true,
          -- 关闭选中多余空格
          -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects 文档中Text objects: select部分
          include_surrounding_whitespace = false,
          keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
          },
      },
      move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
              ["]f"] = "@function.outer",
              ["]c"] = { query = "@class.outer", desc = "Next class start" },
          },
          goto_next_end = {
              ["]F"] = "@function.outer",
              ["]C"] = "@class.outer",
          },
          goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[c"] = "@class.outer",
          },
          goto_previous_end = {
              ["[F"] = "@function.outer",
              ["[C"] = "@class.outer",
          },
      },
    },


  },

}