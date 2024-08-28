require('nvim-tmux-navigation').setup({
    disable_when_zoomed = true, -- defaults to false,
})
local nvimtmuxnav = require('nvim-tmux-navigation')
vim.keymap.set('n', "<C-h>", nvimtmuxnav.NvimTmuxNavigateLeft)
vim.keymap.set('n', "<C-j>", nvimtmuxnav.NvimTmuxNavigateDown)
vim.keymap.set('n', "<C-k>", nvimtmuxnav.NvimTmuxNavigateUp)
vim.keymap.set('n', "<C-l>", nvimtmuxnav.NvimTmuxNavigateRight)
vim.keymap.set('n', "<C-\\>", nvimtmuxnav.NvimTmuxNavigateLastActive)
vim.keymap.set('n', "<C-Space>", nvimtmuxnav.NvimTmuxNavigateNext)
