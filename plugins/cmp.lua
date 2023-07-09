-- 判断是否是个字符
local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

return {
  -- 覆盖官方的cmp
  "hrsh7th/nvim-cmp",
  -- 安装依赖，相当于packer里的依赖requires配置
  dependencies = {
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-emoji",
    "jc-doyle/cmp-pandoc-references",
    "kdheepak/cmp-latex-symbols",
  },
  opts = function(_, opts)
    -- 引入cmp变量
    local cmp = require "cmp"
    -- 重新初始化，扩展覆盖我们下面添加的配置
    return require("astronvim.utils").extend_tbl(opts, {
      completion = {
        -- 自动选中第一条，省的弹出来的第一个不被选中还得额外的按
        completeopt = "menu,menuone,noinsert",
      },
      sources = cmp.config.sources {
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 900 },
        -- 路径提示
        { name = "path", priority = 750 }, 
        { name = "pandoc_references", priority = 725 },
        { name = "latex_symbols", priority = 700 },
        { name = "emoji", priority = 700 },
        { name = "calc", priority = 650 },
        { name = "buffer", priority = 250 },
      },
      mapping = {

        -- 禁用回车键自动补全
        ["<CR>"] = cmp.config.disable,
        -- ctrl + e关闭补全窗口
        --
        -- ctrl + p 选择上一项
        ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        -- ctrl + n 选择下一项
        ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
        -- 同理， ctrl + k 选中上一项
        ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        -- ctrl + j 选择下一项
        ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
        -- 选中对应项后按tab键自动补全
        ["<Tab>"] = cmp.mapping(function(fallback)
          -- idea输入方式
          if cmp.visible() then
            local entry = cmp.get_selected_entry()
            if not entry then
              cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
            else
              if has_words_before() then
                cmp.confirm {
                  behavior = cmp.ConfirmBehavior.Replace,
                  select = false,
                }
              else
                cmp.confirm {
                  behavior = cmp.ConfirmBehavior.Insert,
                  select = false,
                }
              end
            end
          else
            fallback()
          end
        end, { "i", "s" }),
        -- 禁用掉原来的shift + tab键
        ["<S-Tab>"] = cmp.config.disable,
      },
    })
  end,
}
