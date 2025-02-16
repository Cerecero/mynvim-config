-- Telescope --
require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            -- ".tmpl",
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Git files' })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = 'Project Search' })
vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { desc = 'Document Symbols' })
vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, { desc = 'Workspace Symbols' })
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, { desc = 'Goto References' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find Help Tags' })
-- Test
-- vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Find Help Tags' })
-- vim.keymap.set('n', '<leader>gb', builtin.git_status, { desc = 'Find Help Tags' })
-- vim.keymap.set('n', '<leader>gb', builtin.git_commits, { desc = 'Find Help Tags' })
-- vim.keymap.set('n', '<leader>gb', builtin., { desc = 'Find Help Tags' })


vim.keymap.set('n', '<leader>cf', function()
    local opts = require('telescope.themes').get_ivy({
        cwd = vim.fn.stdpath("config")
    })
    builtin.find_files(opts)
end, { desc = 'Nvim Config Files' })

vim.keymap.set('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

-- vim.keymap.set('n', '<leader>fs', builtin.git_status(), {desc = 'Git Status'})
--
-- require("telescope").load_extension("noice")

-- Custom Messages
-- Function to capture the output of :messages
local function get_messages()
    local messages = vim.fn.execute("messages")
    local lines = vim.split(messages, "\n", { trimempty = true })
    if #lines == 0 then
        print("No messages to show")
        return
    end

    local grouped_messages = {}
    local current_message = ""

    for _, line in ipairs(lines) do
        if line:match("^%s*$") then
            if current_message ~= "" then
                table.insert(grouped_messages, current_message)
                current_message = ""
            end
        else
            current_message = current_message == "" and line or (current_message .. "\n" .. line)
        end
    end
    if current_message ~= "" then
        table.insert(grouped_messages, current_message) -- Insert last message
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Messages",
        finder = require("telescope.finders").new_table {
            results = grouped_messages,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry:gsub("\n", " "),
                    ordinal = entry,
                }
            end,
        },
        sorter = require("telescope.config").values.generic_sorter({}),
        attach_mappings = function(_, map)
            map("i", "<CR>", function(prompt_bufnr)
                local entry = require("telescope.actions.state").get_selected_entry()
                require("telescope.actions").close(prompt_bufnr)

                vim.cmd("new")
                local buf = vim.api.nvim_get_current_buf()
                vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(entry.value, "\n"))
                vim.bo[buf].buftype = "nofile"
                vim.bo[buf].bufhidden = "wipe"
                vim.bo[buf].swapfile = false
            end)
            return true
        end,
    }):find()
end

vim.api.nvim_create_user_command("TelescopeMessages", get_messages, {})
vim.keymap.set("n", "<leader>nn", get_messages, { desc = "Messages in Telescope" })

require("telescope").load_extension("fzf")
