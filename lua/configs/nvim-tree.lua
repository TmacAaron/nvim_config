local status_ok, ntree = pcall(require, "nvim-tree")
if not status_ok then
    vim.notify("nvim-tree not found!")
    return
end

ntree.setup {
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        -- autoresize = true,
        side = "left",
        mappings = {
            custom_only = false,
            list = {
                {key = '<C-u>',     action = 'dir-up'},
                {key = '<C-i>',     action = 'cd'},
                {key = 'sv',     action = 'vsplit'},
                {key = 'sh',     action = 'split'},
                {key = 'ss',     action = 'system_open'},
            }
    }
    }
}

vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌"
    },
    folder = {
        arrow_open = "",
        arrow_closed = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = "",
    }
}

