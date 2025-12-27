-- Core Neovim Options
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Cursor line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.colorcolumn = "100"
opt.showmode = false -- lualine shows mode
opt.showcmd = true
opt.cmdheight = 1
opt.pumheight = 10 -- popup menu height
opt.conceallevel = 0 -- show `` in markdown
opt.laststatus = 3 -- global statusline

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Consider - as part of keyword
opt.iskeyword:append("-")

-- Disable swapfile
opt.swapfile = false

-- Undo history
opt.undofile = true
opt.undodir = vim.fn.expand("~/.vim/undodir")

-- Update time (faster completion)
opt.updatetime = 100
opt.timeoutlen = 300

-- Completion
opt.completeopt = "menuone,noselect"

-- Mouse
opt.mouse = "a"

-- File encoding
opt.fileencoding = "utf-8"

-- Scroll offset
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Fill chars (cleaner look)
opt.fillchars = {
  vert = "│",
  fold = " ",
  eob = " ", -- hide ~ at end of buffer
  diff = "╱",
}

-- Shorter messages
opt.shortmess:append("sI")

-- Better diff
opt.diffopt:append("linematch:60")

-- Git signs colors (after colorscheme loads)
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Sign column colors
    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#9ece6a" })
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#7aa2f7" })
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#f7768e" })
    -- Line number colors for changes
    vim.api.nvim_set_hl(0, "GitSignsAddNr", { fg = "#9ece6a" })
    vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = "#7aa2f7" })
    vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { fg = "#f7768e" })
  end,
})
