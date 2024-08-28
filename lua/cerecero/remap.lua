vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Move the selection in Visual Mode --
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Half Page Jumping --
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--Search termn in the middle --
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Preserve the yanked content --
--vim.keymap.set("n", "<C-d>", "<C>zz")
-- Replace all the works equal to the one on the cursor --
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = 'Replace all words == cursor'})

-- Wirte buffer
vim.keymap.set("n", "<leader>w", vim.cmd.write, {desc = 'Write buffer'})
-- Quit buffer
vim.keymap.set("n", "<leader>q", vim.cmd.quit, {desc = '[q]uit'}) --This will quit the buffer, but it will fail when changes have been made to the buffer or previous buffers

-- Yank content to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y", {desc = 'yank content to clipboard'})
vim.keymap.set("v", "<leader>y", "\"+y", {desc = "yank content to clipboard in visual mode"})
vim.keymap.set("n", "<leader>Y", "\"+Y", {desc = "yank line to clipboard"})

-- Highligh yank
vim.api.nvim_create_autocmd('TextYankPost',{
    group = vim.api.nvim_create_augroup('kickstart-highligh-yank', {clear = true}),
    callback = function()
        vim.highlight.on_yank()
    end,
})
