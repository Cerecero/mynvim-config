require("nvim-dap-virtual-text").setup({
    enabled = true,
})
-- Mappings

local dapui = require("dapui")
local dap = require("dap")

dapui.setup()

vim.keymap.set('n', '<F5>', function() dap.continue() end)
vim.keymap.set('n', '<Leader>db', function() dap.toggle_breakpoint() end, {desc = 'Toggle Breakpoint'})

-- vim.keymap.set("n", "<space>b", dap.toggle_breakpoint())
-- vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

-- Eval var under cursor
vim.keymap.set("n", "<leader>?", function()
    require("dapui").eval(nil, { enter = true })
end)

-- vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<F6>", dap.step_into)
vim.keymap.set("n", "<F7>", dap.step_over)
vim.keymap.set("n", "<F8>", dap.step_out)
vim.keymap.set("n", "<F9>", dap.step_back)
vim.keymap.set("n", "<F10>", dap.restart)

dap.listeners.before.attach.dapui_confg = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

dap.adapters.python3 = {
    type = 'executable';
    command = os.getenv('HOME') .. '/usr/bin/python3';
    args = { '-m', 'debugpy.adapter' };

}
require("dap-python").setup("python3")
