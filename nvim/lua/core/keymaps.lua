vim.g.mapleader = " "

local keymap = vim.keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- INSERT Mode

-- VISUAL Mode

-- NORMAL Mode
keymap.set("n", "<leader>n", ":nohl<CR>")  -- 取消高亮
