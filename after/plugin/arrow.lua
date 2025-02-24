require("arrow").setup({
    show_icons = true,
    leader_key = "<leader>;",
    buffer_leader_key = "m",
    always_show_path = true,
    separate_by_branch = true,
    save_path = function()
        return vim.fn.stdpath("cache") .. "/arrow"
    end,
    per_buffer_config = {
        lines = 4,                     -- Number of lines showed on preview.
        sort_automatically = true,     -- Auto sort buffer marks.
        satellite = {                  -- defualt to nil, display arrow index in scrollbar at every update
            enable = true,
            overlap = true,
            priority = 1000,
        },
        zindex = 10,          --default 50
        treesitter_context = nil, -- it can be { line_shift_down = 2 }, currently not usable, for detail see https://github.com/otavioschwanck/arrow.nvim/pull/43#issue-2236320268
    },
})
