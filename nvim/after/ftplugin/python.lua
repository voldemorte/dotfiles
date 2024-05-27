-- Set indentation settings
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = true
vim.bo.autoindent = true
vim.bo.smartindent = true

-- Enable folding based on syntax
vim.wo.foldmethod = 'syntax'
vim.wo.foldlevel = 99  -- Start with all folds open

-- Optional: Configure foldtext to display custom fold text
vim.opt.foldtext = 'v:lua.vim.fn.foldtext()'
