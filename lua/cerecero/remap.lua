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
-- Press Esc to :noh
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Insert boiler plate for error handling in Go
local function insert_err_go()
    local lines = {
        "if err != nil {",
        '   fmt.Errorf("%s", err)',
        "}",
    }
    vim.api.nvim_put(lines, "l", true, true)
end
vim.api.nvim_create_autocmd("Filetype", {
    pattern = "go",
    callback = function()
        vim.keymap.set("i", "eRR", insert_err_go)
    end
})
-- END ---


-- Terminal --
vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-term-open', {clear = true}),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})
local job_id = 0
vim.keymap.set("n", "<leader>st", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)
    vim.cmd("startinsert")

    job_id = vim.bo.channel
end)

vim.keymap.set("n", "<leader>gor", function()
    vim.fn.chansend(job_id, { "go run ./cmd/web \r\n" })
end)

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode"})

