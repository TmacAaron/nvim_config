local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
    vim.notify("autopairs not found!")
    return
end

npairs.setup ({
    check_ts = true,
    ts_config = {
        lua = {'string', 'source'},-- it will not add a pair on that treesitter node
        javascript = {'string', 'template_string'},
        java = false,-- don't check treesitter on java
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel", "dap-repl", "tex" },
    fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'", "<" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Offset from pattern match
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
    },
})

-- Rule
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

npairs.add_rules {
    Rule("<", ">")
        -- don't add a pair if the next character is %
        -- :with_pair(cond.not_after_regex("%%"))
        -- don't add a pair if  the previous character is xxx
        -- :with_pair(cond.not_before_regex("xxx", 3))
        -- don't move right when repeat character
        :with_move(cond.none()),
        -- don't delete if the next character is xx
        -- :with_del(cond.not_after_regex("xx"))
        -- disable adding a newline when you press <cr>
        -- :with_cr(cond.none()),

    Rule("$", "$",{"tex", "latex"})
        -- don't add a pair if the next character is %
        -- :with_pair(cond.not_after_regex("%%"))
        -- don't add a pair if  the previous character is xxx
        -- :with_pair(cond.not_before_regex("xxx", 3))
        -- don't move right when repeat character
        :with_move(cond.none()),
        -- don't delete if the next character is xx
        -- :with_del(cond.not_after_regex("xx"))
        -- disable adding a newline when you press <cr>
        -- :with_cr(cond.none()),

    -- Rule('=', '')
    --     :with_pair(cond.not_inside_quote())
    --     :with_pair(function(opts)
    --         local last_char = opts.line:sub(opts.col - 1, opts.col - 1)
    --         if last_char:match('[%w%=%s]') then
    --             return true
    --         end
    --         return false
    --     end)
    --     :replace_endpair(function(opts)
    --         local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
    --         local next_char = opts.line:sub(opts.col, opts.col)
    --         next_char = next_char == ' ' and '' or ' '
    --         if prev_2char:match('%w$') then
    --             return '<bs> =' .. next_char
    --         end
    --         if prev_2char:match('%=$') then
    --             return next_char
    --         end
    --         if prev_2char:match('=') then
    --             return '<bs><bs>=' .. next_char
    --         end
    --         return ''
    --     end)
    --     :set_end_pair_length(0)
    --     :with_move(cond.none())
    --     :with_del(cond.none()),

    -- Rule(' ', ' ')
    --     :with_pair(function (opts)
    --         local pair = opts.line:sub(opts.col - 1, opts.col)
    --         return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    --     end),
    -- Rule('( ', ' )')
    --     :with_pair(function() return false end)
    --     :with_move(function(opts)
    --         return opts.prev_char:match('.%)') ~= nil
    --     end)
    --     :use_key(')'),
    -- Rule('{ ', ' }')
    --     :with_pair(function() return false end)
    --     :with_move(function(opts)
    --         return opts.prev_char:match('.%}') ~= nil
    --     end)
    --     :use_key('}'),
    -- Rule('[ ', ' ]')
    --     :with_pair(function() return false end)
    --     :with_move(function(opts)
    --         return opts.prev_char:match('.%]') ~= nil
    --     end)
    --     :use_key(']')
}

-- local cmp_autopairs = require "nvim-autopairs.completion.cmp"
-- local cmp_status_ok, cmp = pcall(require, "cmp")
-- if not cmp_status_ok then
--     return
-- end
-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
