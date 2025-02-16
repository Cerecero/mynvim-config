require("cerecero")
require("mason").setup()
vim.opt.number = true         -- Enable line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.autoindent = true     -- Enable autoindent
vim.opt.tabstop = 4           -- Number of spaces a tab represents
vim.opt.shiftwidth = 4        -- Number of spaces for each indentation
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.cursorline = true

vim.opt.termguicolors = true

vim.opt.colorcolumn = "80"

vim.opt.updatetime = 50

vim.opt.scrolloff = 8

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- vim.api.nvim_set_option("clipboard", "unnamed") -- Deprecated

vim.opt.guicursor = "n-ci:block,i:ver3" 

-- Set relative line number as orange (do this after loading theme)
-- vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "gray" })
-- vim.api.nvim_set_hl(0, "LineNr", { fg = "white" })
-- vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "grey" })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#6272a4" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#e06c75" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#6272a4" })

-- vim.opt.winbar = "%= %#PmenuSel# %t " status line

vim.opt.splitbelow = true -- opens a horizontal split below insted of above
vim.opt.splitright = true -- opens a vertical split on the right side instead of left side

vim.opt.ignorecase = true -- ignore the caps on commands
-- Ignore this themes when picking from colorscheme command
vim.opt.wildignore:append({
    "blue.vim",
    "darkblue.vim",
    "delek.vim",
    "elflord.vim",
    "evening.vim",
    "industry.vim",
    "koehler.vim",
    "morning.vim",
    "desert.vim",
    "murphy.vim",
    "pablo.vim",
    "peachpuff.vim",
    "quiet.vim",
    "ron.vim",
    "shine.vim",
    "slate.vim",
    "sorbet.vim",
    "torte.vim",
    "vim.vim",
    "wildcharm.vim",
    "zaibatsu.vim",
    "zellner.vim",
    "vim.vim",
}, ",")



 vim.filetype.add({
  extension = {
    tmpl = "gotmpl",
    },
})

vim.treesitter.language.register("gotmpl", "tmpl") -- Prevent it from defaulting to 'template'
