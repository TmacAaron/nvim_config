-- local status_ok, ci = pcall(require, "cinnamon")
-- if not status_ok then
--     vim.notify(ci)
--     return
-- end
--
-- ci.setup {
--     default_keymaps = true, -- Create default keymaps.
--     extra_keymaps = false, -- Create extra keymaps.
--     extended_keymaps = false, -- Create extended keymaps.
--     centered = true, -- Keep cursor centered in window when using window scrolling.
--     default_delay = 1, -- The default delay (in ms) between each line when scrolling.
--     horizontal_scroll = true, -- Enable smooth horizontal scrolling when view shifts left or right.
--     scroll_limit = 150, -- Max number of lines moved before scrolling is skipped.
-- }

local status_ok, ns = pcall(require, "neoscroll")
if not status_ok then
    vim.notify(ns)
    return
end

ns.setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
        '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
    hide_cursor = true, -- Hide cursor while scrolling
    stop_eof = true, -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil, -- Default easing function
    pre_hook = nil, -- Function to run before the scrolling animation starts
    post_hook = nil, -- Function to run after the scrolling animation ends
    performance_mode = false, -- Disable "Performance Mode" on all buffers.
})
