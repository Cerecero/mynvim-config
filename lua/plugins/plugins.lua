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
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- Theme --
    {
        'uloco/bluloco.nvim',
        lazy = false,
        priority = 0,
        dependencies = { 'rktjmp/lush.nvim' },
        config = function()
            -- your optional config goes here, see below.
        end,
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
    {  -- lsp-zero ---
        "https://github.com/tpope/vim-fugitive"
    }, { 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp'
    }, -- Mason --
    {
        "williamboman/mason.nvim"
    },
    { -- Dashboard --
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
            }
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
    { --Tablines--
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
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
    }, --vim-visual-multi
    {
        "mg979/vim-visual-multi",
    }, -- Tmux Navigation --
    {
        "alexghergh/nvim-tmux-navigation",
        lazy = false,
    }
}
