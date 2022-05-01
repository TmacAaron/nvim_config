local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    vim.notify("telescope not found!")
    return
end

local actions = require "telescope.actions"
local trouble = require("trouble.providers.telescope")

telescope.setup {
    defaults = {

        prompt_prefix = " ",
        selection_caret = " ",
        path_display = {
            shorten = {
                -- e.g. for a path like
                --   `alpha/beta/gamma/delta.txt`
                -- setting `path_display.shorten = { len = 1, exclude = {1, -1} }`
                -- will give a path like:
                --   `alpha/b/g/delta.txt`
                len = 3, exclude = {1, -1}
            },
        },
        mappings = {
            i = {["<c-x>"] = trouble.open_with_trouble},
            n = {["<c-x>"] = trouble.open_with_trouble},
            i = {["<c-h>"] = actions.select_horizontal},
            n = {["<c-h>"] = actions.select_horizontal},
        },
    },

    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },

        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            }
        },

        file_browser = {
            -- theme = "ivy",
            mappings = {
                ["i"] = {
                  -- your custom insert mode mappings
                },
                ["n"] = {
                  -- your custom normal mode mappings
                },
            },
        },
    },
}

telescope.load_extension "fzf"
telescope.load_extension "ui-select"
telescope.load_extension "file_browser"
telescope.load_extension "project"
telescope.load_extension "vim_bookmarks"
