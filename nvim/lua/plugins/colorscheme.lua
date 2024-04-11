-- 主题
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 999, -- make sure to load this before all the other start plugins
    opts = { style = "moon" },
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
