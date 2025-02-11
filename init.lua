

-- 有些配置要在lazy之前设置，所以设立放在上面
require("options")

require("lazy_init")
-- 引入config目录下的配置
-- 这里让lua查找config目录下的init.lua
-- require("config")
-- 这里要在之后，因为which-key依赖lazynvim中导入的插件
require("keymaps")