--Undotree

--Undotree visualizes the undo history and makes it easy to browse and switch between different undo branches.--

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, {desc = 'UndoTree'})
--The focussed window will no longer automatically resize. Other focus features are still available
-- Default: true
require("focus").setup({ autoresize = { enable = false } })
