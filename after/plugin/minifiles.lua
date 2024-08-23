local minifiles = require('mini.files').setup({
    mappings = {
    close       = 'q',
    go_in       = 'l',
    go_in_plus  = 'L',
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
