local map_split = function(buf_id, lhs, direction)
    local rhs = function()
        -- Make new window and set it as target
        local new_target_window
        -- vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
        vim.api.nvim_win_call(MiniFiles.get_explorer_state().target_window, function()
            vim.cmd(direction .. ' split')
            new_target_window = vim.api.nvim_get_current_win()
        end)

        MiniFiles.set_target_window(new_target_window)
        MiniFiles.go_in()
    end

    -- Adding `desc` will result into `show_help` entries
    local desc = 'Split ' .. direction
    vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
end

vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
        local buf_id = args.data.buf_id
        -- Tweak keys to your liking
        map_split(buf_id, 'gs', 'belowright horizontal')
        map_split(buf_id, 'gv', 'belowright vertical')
    end,
})

local minifiles = require('mini.files').setup({

    mappings = {
        close       = 'q',
        go_in       = 'l',
        go_in_plus  = '<CR>',
        go_out      = 'h',
        go_out_plus = 'H',
        reset       = '<BS>',
        reveal_cwd  = '@',
        show_help   = 'g?',
        synchronize = '=',
        trim_left   = '<',
        trim_right  = '>',
    },

})
vim.keymap.set('n', '<leader>pv', ':lua require("mini.files").open(vim.api.nvim_buf_get_name(0), true)<CR>', {})
vim.keymap.set('n', '<leader>pe', ':lua require("mini.files").open(vim.loop.cwd(), true)<CR>', {})
--vim.keymap.set('n', '<C-p>', builtin.git_files, {}):
