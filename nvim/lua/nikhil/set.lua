-- My personal settings
vim.opt.clipboard = "unnamedplus"

-- Enable filetype plugin and indent
vim.cmd('filetype plugin indent on')

-- Always try to show 10 lines above and below the cursor location
vim.opt.scrolloff = 10

-- Classic vim cursor
vim.opt.guicursor = ""

-- disable line wrap
vim.opt.wrap = false

-- file options
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true

-- searching
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- terminal color
vim.opt.termguicolors = true

vim.opt.updatetime = 50

-- Set line numbers
vim.opt.number = true

-- page movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Disable 'Q' for recording
vim.keymap.set("n", "Q", "<nop>")

-- Load all plugins now
vim.cmd('packloadall')

-- Load all helptags now, after plugins have been loaded. All messages and errors will be ignored.
vim.cmd('silent! helptags ALL')
