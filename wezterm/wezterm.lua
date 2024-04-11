-- Pull in the wezterm API
local wezterm = require "wezterm"

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end



-- This is where you actually apply your config choices
-- 环境变量
config.term = "xterm-256color"


-- 窗口
config.initial_cols = 120 -- 窗口列数
config.initial_rows = 50 -- 窗口行数


-- 编辑
config.font = wezterm.font_with_fallback {
    { family = "CaskaydiaCove Nerd Font Mono" },
    { family = "JetBrains Mono" },
} -- 字体列表
config.font_size = 12.0 -- 字体大小
config.line_height = 1.0 -- 行高


-- 按键绑定
config.keys = {
  -- `CTRL+SHIFT+SPACE` for "ActivateCopyMode"
  {
    key = "Space",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivateCopyMode,
  },
  -- `CTRL+SHIFT+X` for "QuickSelect"
  {
    key = "X",
    mods = "CTRL|SHIFT",
    action = wezterm.action.QuickSelect,
  },
}


-- 颜色
config.color_scheme = "Tokyo Night" -- 颜色主题



-- And finally, return the configuration to wezterm
return config
