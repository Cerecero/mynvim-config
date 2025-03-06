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
-- Replace all the words equal to the one on the cursor --
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

-- Keymap to insert err boilerplate, in go files
vim.api.nvim_create_autocmd("Filetype", {
    pattern = "go",
    callback = function()
        vim.keymap.set("i", "eRR", insert_err_go)
    end
})

                            -- Terminal Section --
vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-term-open', {clear = true}),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})

-- Exit Terminal Mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode"})
local job_id = 0
local function Term()
  local terminal_buffer_number = vim.fn.bufnr("term://")
  local terminal_window_number = vim.fn.bufwinnr("term://")
  local window_count = vim.fn.winnr("$")

  if terminal_window_number > 0 and window_count > 1 then
    vim.fn.execute(terminal_window_number .. "wincmd c")
  elseif terminal_buffer_number > 0 and terminal_buffer_number ~= vim.fn.bufnr("%") then
    vim.fn.execute("sb " .. terminal_buffer_number)  
  elseif terminal_buffer_number == vim.fn.bufnr("%") then
    vim.fn.execute("bprevious | sb " .. terminal_buffer_number .. " | wincmd p")
  else
    vim.fn.execute("sp term://zsh")
    vim.cmd("startinsert")
        job_id = vim.bo.channel
  end
end
vim.api.nvim_create_user_command("Term", Term, {
  desc = "Open terminal window",
})

vim.keymap.set("n", "<leader><space>", vim.cmd.Term, { noremap = true, silent = true })

                         -- End of Terminal Section --

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Remap visual mode block wise to <C-b>
vim.api.nvim_set_keymap('n', '<C-b>', '<C-v>', { noremap = true, silent = true })

-- Insert line above or below without entering to insert mode
vim.keymap.set('n', '<leader>o', 'o<Esc>')
vim.keymap.set('n', '<leader>O', 'O<Esc>')
