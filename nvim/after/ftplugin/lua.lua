-- Set indentation settings for Lua
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.expandtab = true
vim.bo.autoindent = true
vim.bo.smartindent = true

-- Enable syntax highlighting for Lua (if not enabled by default)
vim.cmd [[syntax on]]

-- Enable folding based on syntax
vim.wo.foldmethod = 'syntax'
vim.wo.foldlevel = 99  -- Start with all folds open

-- Optional: Configure foldtext to display custom fold text
vim.opt.foldtext = 'v:lua.vim.fn.foldtext()'
