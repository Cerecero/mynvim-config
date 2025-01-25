-- Telescope --
-- require('telescope').setup{
--     defaults = {
--         vimgrep_arguments = {
--             '--hidden',
--         }
--     }
-- }

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc ='Project Files'})
vim.keymap.set('n', '<C-p>', builtin.git_files, {desc= 'Git files'})
vim.keymap.set('n', '<leader>ps', function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {desc = 'Project Search'})
vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, {desc = 'Document Symbols'})
vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, {desc = 'Workspace Symbols'})
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {desc = 'Goto References'})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = 'Find Files'})

vim.keymap.set('n', '<leader>cf', function ()
    builtin.find_files {
        cwd = vim.fn.stdpath("config")
    }
end, { desc = 'Nvim Config Files'})

-- vim.keymap.set('n', '<leader>fs', builtin.git_status(), {desc = 'Git Status'})
--
-- require("telescope").load_extension("noice")
