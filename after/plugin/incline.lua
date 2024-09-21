local incline = require 'incline'
local Path = require 'plenary.path'
local devicons = require 'nvim-web-devicons'
local helpers = require 'incline.helpers'

local function shorten_path(path, opts)
    opts = opts or {}
    local short_len = opts.short_len or 1
    local tail_count = opts.tail_count or 2
    local head_max = opts.head_max or 0
    local relative = opts.relative == nil or opts.relative
    local return_table = opts.return_table or false
    if relative then
        path = vim.fn.fnamemodify(path, ':.')
   end
    local components = vim.split(path, Path.path.sep)
    if #components == 1 then
        if return_table then
            return { nil, path }
        end
        return path
    end
    local tail = { unpack(components, #components - tail_count + 1) }
    local head = { unpack(components, 1, #components - tail_count) }
    if head_max > 0 and #head > head_max then
        head = { unpack(head, #head - head_max + 1) }
    end


    local result = {
        #head > 0 and Path.new(unpack(head)):shorten(short_len, {}) or nil,
        table.concat(tail, Path.path.sep),
    }
    if return_table then
        return result
    end
    return table.concat(result, Path.path.sep)
end


local function modified_suffix(buf)
    if vim.api.nvim_buf_get_option(buf, 'modified') then
        return ' [+]'
    else
        return ''
    end
end


local function shorten_path_styled(buf, opts)
    local path = vim.api.nvim_buf_get_name(buf)
    local ft_icon, ft_color = devicons.get_icon_color(path)
    opts = opts or {}
    local head_style = opts.head_style or {}
    local tail_style = opts.tail_style or {}
    local result = shorten_path(
        path,
        vim.tbl_extend('force', opts, {
            return_table = true,
        })
    )
    return {
        result[1] and vim.list_extend(head_style, { result[1], '/' }) or '',
        vim.list_extend(tail_style, { result[2] }),
        ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
        modified_suffix(buf)
    }
end

incline.setup {
    window = {
        padding = 0,
        margin = { horizontal = 0, vertical = 0 },
    },
    render = function(props)
        return shorten_path_styled(props.buf, {
            short_len = 1,
            tail_count = 2,
            head_max = 4,
            head_style = { group = 'Comment' },
            tail_style = { guifg = 'white' },
        })
    end,
}

--     render = function(props)
-- local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':t')
--         return res
--     end,



-- require('incline').setup {
-- }
