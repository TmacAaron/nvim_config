local status_ok, spec = pcall(require, "specs")
if not status_ok then
    vim.notify(spec)
    return
end

spec.setup{ 
    show_jumps  = true,
    min_jump = 30,
    popup = {
        delay_ms = 0, -- delay before popup displays
        inc_ms = 15, -- time increments used for fade/resize effects 
        blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
        width = 20,
        winhl = "PMenu",
        fader = require('specs').linear_fader,
        resizer = require('specs').shrink_resizer
    },
    ignore_filetypes = {},
    ignore_buftypes = {
        nofile = true,
    },
}
