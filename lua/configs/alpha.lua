local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
    -- [[                               __                ]],
    -- [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    -- [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    -- [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    -- [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    -- [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    -- [[                                                    ]],
    -- [[  ██████████   ██████      ████      ████╗     ██╗  ]],
    -- [[      ██         ██       ██  ██     █████╗    ██║  ]],
    -- [[      ██         ██      ██    ██    ██╔███╗   ██║  ]],
    -- [[      ██         ██     ██      ██   ██║╚███╗  ██║  ]],
    -- [[      ██         ██     ██████████   ██║ ╚███╗ ██║  ]],
    -- [[      ██         ██     ██      ██   ██║  ╚███╗██║  ]],
    -- [[      ██       ██████   ██      ██   ██║   ╚█████║  ]],
    -- [[                                     ╚═╝    ╚════╝  ]],

    [[                                                            ]],
    [[  ██████████████████ ████        ████  ███████████  ]],
    [[   ██████████████████ ████████████████  ███████████   ]],
    [[      ████  ████   ██████████████   █████████     ]],
    [[         ████  ████  ████  ████  █████████      ]],
    [[           ████ ████  ████  ████  █████████       ]],
    [[            ████ ████   ██████  ███████████       ]],
    [[            ████  ████   ██████  ██████  ███        ]],
    [[             ████████████ ████   ██████   ██        ]],
    [[            ██████████████ ██    ██████   ██        ]],
    [[                             ██                         ]],

    -- [[                                                                      ]],
    -- [[        ███████████           █████      ██                     ]],
    -- [[       ███████████             █████                             ]],
    -- [[       ████████████████ ███████████ ███   ███████     ]],
    -- [[      ████████████████ ████████████ █████ ██████████████   ]],
    -- [[     █████████████████████████████ █████ █████ ████ █████   ]],
    -- [[   ██████████████████████████████████ █████ █████ ████ █████  ]],
    -- [[  ██████  ███ █████████████████ ████ █████ █████ ████ ██████ ]],
    -- [[  ██████   ██  ███████████████   ██ █████████████████ ]],
    -- [[  ██████   ██  ███████████████   ██ █████████████████ ]],

}
dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    dashboard.button("b", "  File Browser", ":Telescope file_browser <CR>"),
    dashboard.button("P", "  Find project", ":Telescope project <CR>"),
    dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("i", "  options", ":e ~/.config/nvim/lua/core/init.lua <CR>"),
    dashboard.button("m", "  keymaps", ":e ~/.config/nvim/lua/core/keymaps.lua <CR>"),
    dashboard.button("p", "  plugins", ":e ~/.config/nvim/lua/core/plugins.lua<CR>"),
    dashboard.button("u", "  UI", ":e ~/.config/nvim/lua/core/UI.lua <CR>"),
    dashboard.button("a", "  autocommands", ":e ~/.config/nvim/lua/core/autocommands.lua <CR>"),
    dashboard.button("c", "  configs", ":e ~/.config/nvim/lua/configs/init.lua <CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
    -- NOTE: requires the fortune-mod package to work
    -- local handle = io.popen("fortune")
    -- local fortune = handle:read("*a")
    -- handle:close()
    -- return fortune
    return "yitian.yang"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
