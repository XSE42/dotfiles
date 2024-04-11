return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    ---@type TSConfig
    opts = {
      highlight = { enable = true },
      indent = { enable = false },
      context_commentstring = { enable = true, enable_autocmd = false },
      -- 添加不同语言
      ensure_installed = {
        "bash",
        "c",
        "lua",
        "markdown",
        "python",
        "rust",
        "vim",
        "vimdoc",
        "yaml",
      },
      -- 不同括号颜色区分
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
    },
    ---@param opts TSConfig
    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        ---@type table<string, boolean>
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
