-- Nvim-tree setup
require('nvim-tree').setup({
  view = {
    width = 30,
    side = 'left',
    -- adaptive_size = true, -- Adjusts size to fit file names
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    full_name = true,
    highlight_opened_files = "none",
    highlight_git = true,
    root_folder_modifier = ":t",
    indent_markers = {
      enable = true,
    },
  },
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = false,
      },
    },
  },
  filters = {
    dotfiles = false,
    custom = { ".DS_Store" },
  },
  git = {
    enable = true,
    ignore = false,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
})

-- Auto commands for nvim-tree behavior
local api = vim.api

-- Keymap to toggle nvim-tree
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Set a variable if reading from stdin
api.nvim_create_autocmd("StdinReadPre", {
  pattern = "*",
  callback = function()
    vim.g.std_in = 1
  end,
})

-- Open nvim-tree if no file arguments are given
api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  group = vim.api.nvim_create_augroup("NvimTreeOnOpen", { clear = true }),
  once = true,
  callback = function(_)
    if vim.fn.argc() == 0 then
      vim.cmd("NvimTreeOpen")
    end
  end,
})

-- Close nvim-tree if it's the last window
api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if api.nvim_eval('winnr("$")') == 1 and vim.bo.filetype == "NvimTree" then
      api.nvim_command('quit')
    end
  end,
})

