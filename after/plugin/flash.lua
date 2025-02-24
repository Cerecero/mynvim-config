local flash = require("flash")

vim.keymap.set("n", "<leader>fj",function() flash.jump() end , {desc = 'Flash Jump'})

