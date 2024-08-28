-- Lsp plugin --
-- aka Language Server Protocol

local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())


cmp.setup({
    completion = {
        autocomplete = false
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)         -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),         -- Invoke Completion Manually
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },         -- For luasnip users.
    }, {
        { name = 'buffer' },
    })
})

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts, {desc = 'Display hover information'})
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts, {desc = '[G]oto [D]efinition'})
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts, {desc ='[G]oto [D]eclaration'})
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts, {desc = 'List all the implementations'})
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts, {desc = 'Jumps to definition'})
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts, {desc = 'list all the references'})
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts, {desc= 'Displays signature help'})
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts, {desc= 'Renames all references for this symbol'})
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts, {desc= 'Formats code'})
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts, {desc= 'Selects a code action available'})
end

lsp_zero.extend_lspconfig({
    sign_text = true,
    lsp_attach = lsp_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})


local cmp = require('cmp')
--
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    snippet = {
        expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({}),
}) 
