return {
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      lazy = true
    },
    opts = {
      options = {
        theme = "tokyonight",
      },
    },
  },
  -- bufferline
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
      { "<leader>bd", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
      { "<A-h>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
      { "<A-l>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      lazy = true
    },
    opts = {
      options = {
        always_show_bufferline = true,
        offsets = {{
          filetype = "NvimTree",
          text = "NvimTree",
          highlight = "Directory",
          text_align = "left",
        }},
      },
    },
  },
}
