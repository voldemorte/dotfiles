-- Neo-tree setup
require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = true, -- Show hidden files
      hide_dotfiles = false, -- Do not hide dotfiles
      hide_gitignored = false, -- Do not hide gitignored files
      hide_by_name = {
        ".DS_Store", -- Hide these specific files
      },
    },
  },
  window = {
    position = "left", -- Position of the Neo-tree window
    width = 30, -- Width of the Neo-tree window
  },
  default_component_configs = {
    indent = {
      with_expanders = true, -- Display expanders for directories
      expander_collapsed = ">", -- Custom symbol for collapsed directories
      expander_expanded = "v", -- Custom symbol for expanded directories
    },
  },
})

-- Auto commands for Neo-tree behavior
local api = vim.api

-- Keymap to toggle Neo-tree
vim.api.nvim_set_keymap('n', '<C-n>', ':Neotree toggle<CR>', { noremap = true, silent = true })

-- Set a variable if reading from stdin
api.nvim_create_autocmd("StdinReadPre", {
  pattern = "*",
  callback = function()
    vim.g.std_in = 1
  end,
})

-- Open Neo-tree if no file arguments are given
api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  group = vim.api.nvim_create_augroup("NeotreeOnOpen", { clear = true }),
  once = true,
  callback = function(_)
    if vim.fn.argc() == 0 then
      vim.cmd("Neotree")
    end
  end,
})

-- Close Neo-tree if it's the last window
api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if api.nvim_eval('winnr("$")') == 1 and vim.bo.filetype == "neo-tree" then
      api.nvim_command('quit')
    end
  end,
})
