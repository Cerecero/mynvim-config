return {
    "folke/which-key.nvim",
    { "folke/neoconf.nvim",        cmd = "Neoconf" },
    -- Treesitter --
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "python", "go" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    -- Telescope --
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
    },
    { -- Theme 2 --
        'navarasu/onedark.nvim',
        lazy = false,
        priority = 1000,
    },
    {
        'shaunsingh/moonlight.nvim',
        lazy = false,
    },
    {  -- undotree --
        "https://github.com/mbbill/undotree"
    }, -- vim-fugitive--
    {
        "https://github.com/tpope/vim-fugitive"
    }, -- lsp-zero --
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp'
    }, -- Mason --
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    { -- lualine --
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    { -- Arrow --
        "otavioschwanck/arrow.nvim",
    },
    {  -- minifiles--
        "echasnovski/mini.files", version = '*'
    }, -- mini.pairs
    {
        'echasnovski/mini.pairs', version = '*'
    }, -- mini.indents
    {
        'echasnovski/mini.indentscope', version = false
    }, --vim-visual-multi
    {
        "mg979/vim-visual-multi",
    }, -- Tmux Navigation --
    {
        "alexghergh/nvim-tmux-navigation",
        lazy = false,
    }, -- nvim-cmp
    {
        "hrsh7th/nvim-cmp",
    }, -- cmp-nvim-lsp
    {
        "sar/cmp-lsp.nvim",
    }, -- conform
    {
        "stevearc/conform.nvim",
    }, --Comment.nvim
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        }
    }, --nvim surround
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
    },                 --nvim-dap
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            {
                "rcarriga/nvim-dap-ui"
            },
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
        }
    }, --debugpy
    {
        "HiPhish/debugpy.nvim",
    }, --nvim-dap-python
    {
        "mfussenegger/nvim-dap-python",
    },
    -- nvim-telekasten
    {
        "nvim-telekasten/telekasten.nvim",
    }, -- nvim focus
    {
        'nvim-focus/focus.nvim',
        version = false
    }, -- lush.nvim theme creator
    {
        "rktjmp/lush.nvim",
    }, -- incline.nvim
    {
        "b0o/incline.nvim",
    },
}


-- Unused plugins
-- shipwright
-- {
--     "rktjmp/shipwright.nvim",
-- {
--     "yetone/avante.nvim",
--     lazy = false,
--     version = false,
--     build = "make",
--     dependencies = {
--     "stevearc/dressing.nvim",
--         "nvim-lua/plenary.nvim",
--         "MunifTanjim/nui.nvim",
--     },
-- },
--     { -- render-markdown
--         'MeanderingProgrammer/render-markdown.nvim',
--         opts = {
--             file_types = { "markdown", "Avante" },
--         },
--         ft = { "markdown", "Avante" },
--
--     },
-- -- }, --lush
--
-- {
--     "folke/noice.nvim",
--     event = "VeryLazy",
--     opts = {
--         -- add any options here
--     },
--     dependencies = {
--         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
--         "MunifTanjim/nui.nvim",
--         -- OPTIONAL:
--         --   `nvim-notify` is only needed, if you want to use the notification view.
--         --   If not available, we use `mini` as the fallback
--         "rcarriga/nvim-notify",
--     }
-- }
