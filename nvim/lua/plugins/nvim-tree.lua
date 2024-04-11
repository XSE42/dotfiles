-- 文档树
return {
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<leader>e", "<Cmd>NvimTreeToggle<CR>", desc = "Toggle nvim-tree" },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      lazy = true
    },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require("nvim-tree").setup {}
    end
  },
}
