-- Telescope --
-- Fuzzy Finder plugin

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc ='Project Files'})
vim.keymap.set('n', '<C-p>', builtin.git_files, {desc= 'Git files'})
vim.keymap.set('n', '<leader>ps', function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {desc = 'Project Search'})
vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, {desc = 'Document Symbols'})
vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, {desc = 'Workspace Symbols'})
-- vim.keymap.set('n', '<leader>fs', builtin.git_status(), {desc = 'Git Status'})
--
require("telescope").load_extension("noice")
