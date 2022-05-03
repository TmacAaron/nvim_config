vim.cmd [[
    augroup keymaps_user_config
        autocmd!
        autocmd BufWritePost keymaps.lua source <afile>
    augroup end
]]

vim.g.mapleader = ' '

local function mapkey(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true })
end

local function mapcmd(key, cmd)
    vim.api.nvim_set_keymap('n', key, '<cmd>' .. cmd .. '<cr>', { noremap = true, silent = true })
end

-- keymaps
mapkey('n', '=', 'nzz') -- 寻找下一搜索结果，并将其置于屏幕中心
-- noremap = nzz
mapkey('n', '-', 'Nzz') -- 寻找上一搜索结果，并将其置于屏幕中心
-- noremap - Nzz

-- 插入模式移动光标
mapkey('i', '<C-h>', '<Left>') -- inoremap <C-h> <Left>
mapkey('i', '<C-j>', '<Down>') -- inoremap <C-h> <Left>
mapkey('i', '<C-k>', '<Up>') -- inoremap <C-h> <Left>
mapkey('i', '<C-l>', '<Right>') -- inoremap <C-h> <Left>
mapkey('i', '<C-d>', '<Delete>') -- inoremap <C-h> <Left>
-- mapkey('i', '<C-n>', '<Esc>ui')     -- inoremap <C-h> <Left>
mapkey('i', 'fj', '<Esc>') -- 退出编辑模式
-- inoremap fj <esc>
mapkey('n', 'Y', 'J') -- 与下一行合并
mapkey('x', 'Y', 'J') -- 与下一行合并
-- noremap Y J
mapkey('n', 'H', '^') -- 跳到行首
mapkey('x', 'H', '^') -- 跳到行首
-- noremap H ^
mapkey('n', 'L', '$') -- 跳到行尾
mapkey('x', 'L', '$') -- 跳到行尾
-- noremap L $
mapkey('n', 'K', 'H') -- 跳到顶部
mapkey('x', 'K', 'H') -- 跳到顶部
-- nnoremap K H
mapkey('n', 'J', 'L') -- 跳到底部
mapkey('x', 'J', 'L') -- 跳到底部
-- nnoremap J L
mapkey('n', '<C-j>', '10j') -- 向下10行
mapkey('x', '<C-j>', '10j') -- 向下10行
-- noremap <C-j> 10j
mapkey('n', '<C-k>', '10k') -- 向上10行
mapkey('x', '<C-k>', '10k') -- 向上10行
-- noremap <C-k> 10k
mapkey('n', '<C-h>', '10h') -- 向左10列
mapkey('x', '<C-h>', '10h') -- 向左10列
-- noremap <C-h> 10h
mapkey('n', '<C-l>', '10l') -- 向右10列
mapkey('x', '<C-l>', '10l') -- 向右10列
-- noremap <C-l> 10l


-- mapcmd
-- 取消高亮mapcmd('<leader>', 'retab!')
-- mapcmd('<leader><cr>', 'nohlsearch')    -- noremap <LEADER><CR> :nohlsearch<CR>
mapkey('n', 's', '<nop>') -- map s <nop>
mapcmd('<C-s>', 'w') -- 保存
-- noremap <C-s> :w<CR>
mapkey('i', '<C-s>', '<Esc>:w<CR>') -- 保存 inoremap <C-s> <Esc>:w<CR>
mapcmd('<A-s>', 'wall') -- 保存所有
-- map <A-w> :wall<CR>
mapcmd('Q', 'q') -- 退出
-- map Q :q<CR>
mapcmd('<A-q>', 'qall') -- 全部退出 map <A-q> :qall<CR>
mapcmd('<A-Q>', 'q!') -- 强制退出 map <A-Q> :q!<CR>

mapcmd('sl', 'set splitright<CR>:vsplit') -- 右分屏，聚焦右窗口
-- map sl :set splitright<CR>:vsplit<CR>
mapcmd('sh', 'set nosplitright<CR>:vsplit') -- 左分屏，聚焦左窗口
-- map sh :set nosplitright<CR>:vsplit<CR>
mapcmd('sk', 'set nosplitbelow<CR>:split') -- 上分屏，聚焦上窗口
-- map sk :set nosplitbelow<CR>:split<CR>
mapcmd('sj', 'set splitbelow<CR>:split') -- 下分屏，聚焦下窗口
-- map sj :set splitbelow<CR>:split<CR>
mapkey('n', 'wo', '<C-w>o') -- 关闭其他窗口
-- map wo <C-w>o
mapkey('n', 'wq', '<C-w>c') -- 关闭窗口
-- map wq <C-w>c
mapkey('t', '<Esc>', '<C-\\><C-n>') -- terminal中进入普通模式
mapkey('t', 'fj', '<C-\\><C-n>')

mapkey('n', '<A-l>', '<C-w>l') -- 光标移至右窗口
mapkey('i', '<A-l>', '<C-\\><C-n><C-w>l')
mapkey('t', '<A-l>', '<C-\\><C-n><C-w>l')
-- map <LEADER>l <C-w>l
mapkey('n', '<A-k>', '<C-w>k') -- 光标移至上窗口
mapkey('i', '<A-k>', '<C-\\><C-n><C-w>k')
mapkey('t', '<A-k>', '<C-\\><C-n><C-w>k')
-- map <LEADER>k <C-w>k
mapkey('n', '<A-j>', '<C-w>j') -- 光标移至下窗口
mapkey('i', '<A-j>', '<C-\\><C-n><C-w>j')
mapkey('t', '<A-j>', '<C-\\><C-n><C-w>j')
-- map <LEADER>j <C-w>j
mapkey('n', '<A-h>', '<C-w>h') -- 光标移至左窗口
mapkey('i', '<A-h>', '<C-\\><C-n><C-w>h')
mapkey('t', '<A-h>', '<C-\\><C-n><C-w>h')
-- map <LEADER>h <C-w>h
mapkey('n', '<A-w>', '<C-w>w') -- 光标在窗口中循环移动
-- map <LEADER>w <C-w>w
mapkey('n', '<leader>L', '<C-w>L') -- 窗口移至右
-- map <LEADER>L <C-w>L
mapkey('n', '<leader>K', '<C-w>K') -- 窗口移至上
-- map <LEADER>K <C-w>K
mapkey('n', '<leader>J', '<C-w>J') -- 窗口移至下
-- map <LEADER>J <C-w>L
mapkey('n', '<leader>H', '<C-w>H') -- 窗口移至左
-- map <LEADER>H <C-w>H
mapkey('n', 'wt', '<C-w>T') -- 窗口打开为新标签页
-- map <LEADER>t <C-w>T
mapkey('n', '\\v', '<C-w>t<C-w>H') -- 变为垂直分布
-- map sc <C-w>t<C-w>H
mapkey('n', '\\h', '<C-w>t<C-w>K') -- 变为水平分布
-- map sr <C-w>t<C-w>K
-- mapcmd('<A-up>', 'res +5')          -- 窗口上移
-- -- map <A-up> :res +5<CR>
-- mapcmd('<A-down>', 'res -5')            -- 窗口下移
-- -- map <A-down> :res -5<CR>
-- mapcmd('<A-left>', 'vertical resize-5')     -- 窗口左移
-- -- map <A-left> :vertical resize-5<CR>
-- mapcmd('<A-right>', 'vertical resize+5')    -- 窗口右移
-- -- map <A-right> :vertical resize+5<CR>
mapcmd('tn', 'tabe') -- 新建标签页
-- map tn :tabe<CR>
mapcmd('th', '-tabnext') -- 前一标签页
-- map th :-tabnext<CR>
mapcmd('tl', '+tabnext') -- 后一标签页
-- map tl :+tabnext<CR>
mapcmd('tq', 'tabc') -- 关闭当前标签页
-- map tq :tabc<CR>
mapcmd('to', 'tabo') -- 关闭其他标签页
-- map to :tabo<CR>
-- mapcmd('sv', 'source $MYVIMRC')         -- 重新加载vim配置文件
mapcmd('sv', 'luafile %') -- 重新加载vim配置文件
-- map sv :source $MYVIMRC<CR>
-- 寻找两个相等的单词
-- map <LEADER>fd /\(\<\w\+\>\)\_s*\1
-- 替换占空符<++>
-- map <LEADER><LEADER> <ESC>/<++><CR>:nohlsearch<CR>c4l
mapkey('n', '<C-a>', 'ggVG') -- 全选
-- map <C-a> ggVG
-- 数字加减1
mapkey('n', '+', '<C-a>') -- nnoremap + <C-a>
mapkey('n', '_', '<C-x>') -- nnoremap _ <C-x>

-- mapcmd('<leader>vi', 'tabe<cr>:e ~/.config/nvim/lua/core/init.lua')   -- 打开我的vimrc
-- mapcmd('<leader>vmap', 'tabe<cr>:e ~/.config/nvim/lua/core/keymaps.lua')  -- 打开我的vimrc
-- mapcmd('<leader>vpl', 'tabe<cr>:e ~/.config/nvim/lua/core/plugins.lua')   -- 打开我的vimrc
-- mapcmd('<leader>vui', 'tabe<cr>:e ~/.config/nvim/lua/core/UI.lua')    -- 打开我的vimrc
-- map <silent> <LEADER>vi :tabe<CR>:e ~/.config/nvim/init.vim<CR>
-- 复制到系统剪切板
-- map <LEADER>y +y
-- 从系统剪切板粘贴
-- map <LEADER>p +po
--  开关nerdtree
-- map tt : NERDTreeToggle<CR>
mapcmd('<C-n>', 'set rnu! rnu?') -- 开关相对行号
-- map <C-n> :set rnu! rnu?<CR>
-- 开关拼写检查
-- map <LEADER>sp :set spell!<CR>
--
--
-- plugins keymap
-- nvim tree
-- mapcmd('tt', 'NvimTreeToggle')

-- telescope
-- mapcmd('<leader>ff', 'lua require("telescope.builtin").find_files()')
-- -- mapcmd('<leader>fg', 'Telescope live_grep')
-- mapcmd('<leader>fg', 'lua require("telescope").extensions.live_grep_raw.live_grep_raw()')
-- mapcmd('<leader>fw', 'lua require("telescope.builtin").grep_string()')
-- mapcmd('<leader>fb', 'lua require("telescope.builtin").buffers()')
-- mapcmd('<leader>fh', 'lua require("telescope.builtin").help_tags()')
-- mapcmd('<leader>fo', 'lua require("telescope.builtin").oldfiles()')
-- mapcmd('<leader>fc', 'lua require("telescope.builtin").commands()')
-- mapcmd('<leader>fk', 'lua require("telescope.builtin").keymaps()')
-- mapcmd('<leader>/', 'lua require("telescope.builtin").current_buffer_fuzzy_find()')
-- mapcmd('<leader>fk', 'lua require("telescope.builtin").keymaps()')
-- -- telescope -file browser
-- mapcmd('<leader>sf', 'lua require("telescope").extensions.file_browser.file_browser()')
-- -- telescope -project
-- mapcmd('<leader>fp', 'lua require("telescope").extensions.project.project(require("telescope.themes").get_dropdown({}))')
-- -- telescope -bookmarks
-- mapcmd('<leader>fm', 'lua require("telescope").extensions.vim_bookmarks.current_file()')
-- mapcmd('<leader>fM', 'lua require("telescope").extensions.vim_bookmarks.all()')
-- -- telescope -find symbol
-- mapcmd('<leader>fs', 'lua require("telescope").extensions.aerial.aerial()')
-- -- telescope -dap
-- mapcmd('<leader>fd', 'lua require("telescope").extensions.dap.commands{}')
-- mapcmd('<leader>fdc', 'lua require("telescope").extensions.dap.configurations{}')
-- mapcmd('<leader>fdb', 'lua require("telescope").extensions.dap.list_breakpoints{}')
-- mapcmd('<leader>fv', 'lua require("telescope").extensions.dap.variables{}')
-- mapcmd('<leader>fdf', 'lua require("telescope").extensions.dap.frames{}')
--
-- toggleterm
-- mapcmd('<leader>tf', 'ToggleTerm direction=float')
-- mapcmd('<leader>th', 'ToggleTerm direction=horizontal')
-- mapcmd('<leader>tv', 'ToggleTerm direction=vertical')
-- mapcmd('<leader>tt', 'ToggleTerm direction=tab')
-- mapcmd('<leader>sl', 'ToggleTermSendCurrentLine')
mapkey('v', '<leader>sv', ':ToggleTermSendVisualLines<cr>')
mapkey('v', '<leader>ss', ':ToggleTermSendVisualSelection<cr>')

-- expand region
-- mapkey('', '<ENTER>', '<Plug>(expand_region_expand)')
-- mapkey('', '<BS>', '<Plug>(expand_region_shrink)')

-- aerial
mapcmd('<leader>a', 'AerialToggle')

-- debug dap
-- mapcmd('<leader>db', 'lua require("dap").toggle_breakpoint()')
-- mapcmd('<leader>dB', 'lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))')
-- -- keymap("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", opts)
-- mapcmd('<leader>dl', 'lua require("dap").run_last()')
-- mapcmd('<F10>', 'lua require"user.dap.dre ("user.dap.di-python")ap-util".reload_continue()')
mapcmd('<F4>', 'lua require("dap").terminate()')
mapcmd('<F5>', 'lua require("dap").continue()')
mapcmd('<F6>', 'lua require("dap").step_over()')
mapcmd('<F7>', 'lua require("dap").step_into()')
mapcmd('<F8>', 'lua require("dap").step_out()')
mapcmd('E', 'lua require("dapui").eval()')
-- keymap("n", "<leader>dt", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- smart-splits
mapcmd('<A-up>', 'lua require("smart-splits").resize_up()')
mapcmd('<A-down>', 'lua require("smart-splits").resize_down()')
mapcmd('<A-left>', 'lua require("smart-splits").resize_left()')
mapcmd('<A-right>', 'lua require("smart-splits").resize_right()')

-- mapcmd('<A-k>', 'lua require("smart-splits").move_cursor_up()')
-- mapcmd('<A-j>', 'lua require("smart-splits").move_cursor_down()')
-- mapcmd('<A-h>', 'lua require("smart-splits").move_cursor_left()')
-- mapcmd('<A-l>', 'lua require("smart-splits").move_cursor_right()')

-- hop
-- place this in one of your configuration file(s)
-- mapcmd('f', "lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })")
-- mapcmd('F', "lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })")
-- mapcmd('f', "lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })")
-- mapcmd('F', "lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })")
-- mapcmd('f', "lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })")
-- mapcmd('F', "lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })")
-- place this in one of your configuration file(s)
vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
-- vim.api.nvim_set_keymap('n', '<leader>e', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {})
-- vim.api.nvim_set_keymap('v', '<leader>e', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {})
-- vim.api.nvim_set_keymap('o', '<leader>e', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END, inclusive_jump = true })<cr>", {})

-- mapcmd('<leader>w', "lua require'hop'.hint_words()")
-- mapcmd('<leader>l', "lua require'hop'.hint_lines()")
-- mapcmd('<leader>c', "lua require'hop'.hint_char1()")
-- mapcmd('<leader>C', "lua require'hop'.hint_char2()")
-- mapcmd('<leader>p', "lua require'hop'.hint_patterns()")

local status_ok, wk = pcall(require, "which-key")
if not status_ok then
    vim.notify(wk)
    return
end

local opts_l = {
    mode = "n", -- NORMAL mode
    -- prefix: use "<leader>f" for example for mapping everything related to finding files
    -- the prefix is prepended to every mapping part of `mappings`
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings_l = {
    -- f = {
    --     name = "file", -- optional group name
    --     f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    --     r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
    --     n = { "New File" }, -- just a label. don't create any mapping
    --     e = "Edit File", -- same as above
    --     ["1"] = "which_key_ignore",  -- special label to hide it in the popup
    --     b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
    -- },
    -- bufferline
    ["1"] = { "<cmd>BufferLineGoToBuffer 1<cr>", "To Buffer 1" },
    ["2"] = { "<cmd>BufferLineGoToBuffer 2<cr>", "To Buffer 2" },
    ["3"] = { "<cmd>BufferLineGoToBuffer 3<cr>", "To Buffer 3" },
    ["4"] = { "<cmd>BufferLineGoToBuffer 4<cr>", "To Buffer 4" },
    ["5"] = { "<cmd>BufferLineGoToBuffer 5<cr>", "To Buffer 5" },
    ["6"] = { "<cmd>BufferLineGoToBuffer 6<cr>", "To Buffer 6" },
    ["7"] = { "<cmd>BufferLineGoToBuffer 7<cr>", "To Buffer 7" },
    ["8"] = { "<cmd>BufferLineGoToBuffer 8<cr>", "To Buffer 8" },
    ["9"] = { "<cmd>BufferLineGoToBuffer 9<cr>", "To Buffer 9" },

    h = {
        name = "highlight",
        d = { ":HSRmHighlight rm_all<cr>", "Delete all" }
    },

    v = {
        name = "setup",
        i = { "<cmd>tabe<cr>:e ~/.config/nvim/lua/core/init.lua<cr>", "options" },
        k = { "<cmd>tabe<cr>:e ~/.config/nvim/lua/core/keymaps.lua<cr>", "keymaps" },
        p = { "<cmd>tabe<cr>:e ~/.config/nvim/lua/core/plugins.lua<cr>", "plugins" },
        u = { "<cmd>tabe<cr>:e ~/.config/nvim/lua/core/UI.lua<cr>", "UI" },
        c = { "<cmd>tabe<cr>:e ~/.config/nvim/lua/configs/init.lua<cr>", "configs" },
        a = { "<cmd>tabe<cr>:e ~/.config/nvim/lua/core/autocommands.lua<cr>", "autocommands" },
    },

    ["<cr>"] = { "<cmd>nohlsearch<cr>", "cancel highlight search" },
    ["<tab>"] = { "<cmd>retab!<cr>", "tab to space" },
    ["<leader>"] = { "<cmd>Format<cr>", "Format" },

    -- telescope
    ["/"] = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "search in current buffer" },
    f = {
        name = "find",
        f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "files" },
        -- mapcmd('<leader>fg', 'Telescope live_grep'),
        e = { "<cmd>lua require('telescope').extensions.live_grep_raw.live_grep_raw()<cr>", "grep" },
        w = { "<cmd>lua require('telescope.builtin').grep_string()<cr>", "word" },
        b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "buffers" },
        h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "help_tags" },
        r = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "recent files" },
        c = { "<cmd>lua require('telescope.builtin').commands()<cr>", "commands" },
        k = { "<cmd>lua require('telescope.builtin').keymaps()<cr>", "keymaps" },
        -- project
        p = { "<cmd>lua require('telescope').extensions.project.project(require('telescope.themes').get_dropdown({}))<cr>", "project" },
        -- bookmarks
        m = { "<cmd>lua require('telescope').extensions.vim_bookmarks.current_file()<cr>", "current file bookmarks" },
        M = { "<cmd>lua require('telescope').extensions.vim_bookmarks.all()<cr>", "all bookmarks" },
        -- symbol
        s = { "<cmd>lua require('telescope').extensions.aerial.aerial()<cr>", "symbols" },
        ["<leader>"] = { "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", "file browser" },
        -- dap
        v = { "<cmd>lua require('telescope').extensions.dap.variables{}<cr>", "variables" },
        d = {
            name = "dap",
            f = { "<cmd>lua require('telescope').extensions.dap.frames{}<cr>", "frames" },
            r = { "<cmd>lua require('telescope').extensions.dap.commands{}<cr>", "commands" },
            c = { "<cmd>lua require('telescope').extensions.dap.configurations{}<cr>", "configurations" },
            b = { "<cmd>lua require('telescope').extensions.dap.list_breakpoints{}<cr>", "breakpoints" },
        },
        -- todo
        t = { "<cmd>TodoTelescope<cr>", "Todo" },
        g = {
            name = "Git",
            s = { "<cmd>Telescope git_status<cr>", "Git Status" },
            b = { "<cmd>Telescope git_branches<cr>", "Checkout Branches" },
            c = { "<cmd>Telescope git_commits<cr>", "Checkout Commits" },
            f = { "<cmd>Telescope git_files<cr>", "Files" },
        }
    },

    -- toggleterm
    t = {
        name = "open terminal/Todo",
        f = { "<cmd>ToggleTerm direction=float<cr>", "float" },
        h = { "<cmd>ToggleTerm direction=horizontal<cr>", "horizontal" },
        v = { "<cmd>ToggleTerm direction=vertical<cr>", "vertical" },
        t = { "<cmd>ToggleTerm direction=tab<cr>", "tab" },
        d = { "<cmd>TodoTrouble<cr>", "Todo List" }
    },
    s = {
        name = "send to terminal",
        l = { "<cmd>ToggleTermSendCurrentLine<cr>", "current line" }
    },

    -- git
    g = {
        name = "Git",
        s = "Stage Hunk",
        S = "Stage Buffer",
        r = "Reset Hunk",
        R = "Reset Buffer",
        u = "Undo Stage Hunk",
        h = "Preview Hunk",
        B = "Toggle Blame",
        b = "Line Blame",
        t = "Diff",
        T = "Diff",
        d = "Toggle Delete",
        f = { "<cmd>DiffviewFileHistory<cr>", "File History" },
        p = { "<cmd>DiffviewOpen<cr>", "Diff Project" },
    },

    -- debug(dap)
    d = {
        name = "debug(dap)",
        b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "set breakpoint" },
        B = { "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "set breakpoint" },
        l = { "<cmd>lua require('dap').run_last()<cr>", "run last" },
        r = { "<cmd>lua require('dap').repl.open()<cr>", "open repl" },
        a = { "diagnostic list" },
        f = { "peek definition function" },
        F = { "peek definition class" },
    },

    -- hop
    ["w"] = { "<cmd>lua require'hop'.hint_words()<cr>", "hop words" },
    ["l"] = { "<cmd>lua require'hop'.hint_lines()<cr>", "hop lines" },
    ["i"] = { "<cmd>lua require'hop'.hint_char1()<cr>", "hop 1 char" },
    ["I"] = { "<cmd>lua require'hop'.hint_char2()<cr>", "hop 2 char" },
    ["p"] = { "<cmd>lua require'hop'.hint_patterns()<cr>", "hop patterns" },

    -- comment
    r = {
        name = "Line-Comment/rename",
        r = "current line (toggle)",
        o = "on the line below",
        O = "on the line above",
        A = "at the end of line",
        n = "rename"
    },
    b = {
        name = "Block-Comment",
        r = "current line (toggle)",
    },

    -- diagnostic
    ["e"] = "diagnostic float open",

    -- move window
    ["H"] = "move window to left",
    ["J"] = "move window to down",
    ["K"] = "move window to top",
    ["L"] = "move window to right",

    -- trouble
    x = {
        name = "Trouble",
        x = { "<cmd>Trouble<cr>", "Toggle Trouble" },
        w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace diagnostic" },
        d = { "<cmd>Trouble document_diagnostics<cr>", "Document diagnostic" },
        l = { "<cmd>Trouble loclist<cr>", "Loc List" },
        q = { "<cmd>Trouble quickfix<cr>", "Quick Fix" },
        u = { "<cmd>Trouble lsp_references<cr>", "lsp references" },
    },

    -- cmake
    c = {
        name = "cmake",
        c = { "<cmd>CMake configure<cr>", "Configure Project" },
        t = { "<cmd>CMake select_target<cr>", "Select Target" },
        T = { "<cmd>CMake select_build_type<cr>", "Select Build Type" },
        b = { "<cmd>CMake build<cr>", "Build Target" },
        B = { "<cmd>CMake build_all<cr>", "Build all" },
        r = { "<cmd>CMake run<cr>", "Run Target" },
        R = { "<cmd>CMake build_and_run<cr>", "Build and Run Target" },
        d = { "<cmd>CMake debug<cr>", "Debug Target" },
        D = { "<cmd>CMake build_and_debug<cr>", "Build and Debug Target" },
        q = { "<cmd>CMake cancel<cr>", "Cancel" },
        s = { "<cmd>CMake set_target_args<cr>", "Set Arguments for Target" },
        n = { "<cmd>CMake create_project<cr>", "Create new CMake Project" },
    }
}

local opts = {
    mode = "n", -- NORMAL mode
    -- prefix: use "<leader>f" for example for mapping everything related to finding files
    -- the prefix is prepended to every mapping part of `mappings`
    prefix = "",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    ["<F4>"] = "(debug) terminate",
    ["<F5>"] = "(debug) continue",
    ["<F6>"] = "(debug) step over",
    ["<F7>"] = "(debug) step into",
    ["<F8>"] = "(debug) step out",

    w = {
        name = "window",
        o = "close other windows",
        q = "close window",
        t = "open as tab",
        w = { "<cmd>TZFocus<cr>", "Toggle Min/Max window" },
        f = { "<cmd>TZAtaraxis<cr>", "Toggle Focus" }
    },

    t = {
        name = "tab/file_tree",
        n = "new tab",
        h = "previous tab",
        l = "next tab",
        q = "close tab",
        o = "close other tabs",
        t = { "<cmd>NvimTreeToggle<cr>", "open file tree" },
    },

    s = {
        name = "split/surround/swap",
        h = "split left",
        j = "split down",
        k = "split up",
        l = "split right",
        -- surround
        a = "surround add",
        d = "surround delete",
        r = "surround replace",
        s = "surround repeat",
        t = "surround toggle",
        -- swap
        n = "swap next parameter",
        p = "swap previous parameter",
        i = { "<cmd>ISwap<cr>", "swap" },
        w = { "<cmd>ISwapWith<cr>", "swap with" },
        --
        v = "source vimrc(luafile)"
    },

    g = {
        name = "goto",
        d = "definition",
        D = "declaration",
        h = "hover diagnostic",
        p = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "preview definition" }
    },

    ["+"] = "number +1",
    ["_"] = "number -1",
    ["<C-n>"] = "开关相对行号",
    ["<C-a>"] = "select all",
    ["<C-s>"] = "save",
    ["<A-s>"] = "save all",
    ["Q"] = "quit",
    ["<A-q>"] = "quit all",
    ["<A-Q>"] = "quit!",
    --
    ["<A-h>"] = "cursor to left win",
    ["<A-j>"] = "cursor to down win",
    ["<A-k>"] = "cursor to up win",
    ["<A-l>"] = "cursor to right win",
    ["<A-w>"] = "cursor move cycle",

}

local opts_t = {
    mode = "n", -- NORMAL mode
    -- prefix: use "<leader>f" for example for mapping everything related to finding files
    -- the prefix is prepended to every mapping part of `mappings`
    prefix = "\\",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings_t = {
    ["v"] = "窗口变为垂直分布",
    ["h"] = "窗口变为水平分布",
    l = {
        name = "latex(vimtex)",
        a = "context menu",
        C = "clean full",
        c = "clean",
        e = "errors",
        g = "status",
        G = "all status",
        i = "info",
        I = "info full",
        K = "stop all",
        k = "stop",
        l = "compile",
        L = "compile selected",
        m = "imaps list",
        o = "compile output",
        q = "log",
        s = "toogle main",
        T = "toggle toc",
        t = "open toc",
        v = "view",
        x = "reload",
        X = "reload state",
    }
}

local opts_z = {
    mode = "n", -- NORMAL mode
    -- prefix: use "<leader>f" for example for mapping everything related to finding files
    -- the prefix is prepended to every mapping part of `mappings`
    prefix = "z",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = false, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings_z = {
    f = {
        c = { "zfac", "class" },
        f = { "zfaf", "function" },
        l = { ":loadview", "Load View" }
    },
}

local opts_v = {
    mode = "v", -- NORMAL mode
    -- prefix: use "<leader>f" for example for mapping everything related to finding files
    -- the prefix is prepended to every mapping part of `mappings`
    prefix = "",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings_v = {
    ["<leader>"] = {
        b = "block comment",
        r = "line comment",
        s = {
            name = "send to terminal",
            s = "visual select",
            v = "visual line"
        },
        h = {
            name = "highlight",
            h = { ":<c-u>HSHighlight 0<cr>", "Black" },
            y = { ":<c-u>HSHighlight 1<cr>", "Yellow" },
            a = { ":<c-u>HSHighlight 2<cr>", "Aqua" },
            p = { ":<c-u>HSHighlight 3<cr>", "Purple" },
            r = { ":<c-u>HSHighlight 4<cr>", "Red" },
            g = { ":<c-u>HSHighlight 5<cr>", "Green" },
            l = { ":<c-u>HSHighlight 6<cr>", "Blue" },
            f = { ":<c-u>HSHighlight 7<cr>", "Pink" },
            w = { ":<c-u>HSHighlight 8<cr>", "White" },
            b = { ":<c-u>HSHighlight 9<cr>", "Brown" },
            d = { ":<c-u>HSRmHighlight<cr>", "Delete" },
        }
    },
}

local opts_i = {
    mode = "i", -- NORMAL mode
    -- prefix: use "<leader>f" for example for mapping everything related to finding files
    -- the prefix is prepended to every mapping part of `mappings`
    prefix = "",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings_i = {
    ["f"] = "which_key_ignore"
}

wk.setup()
wk.register(mappings_l, opts_l)
wk.register(mappings, opts)
wk.register(mappings_t, opts_t)
wk.register(mappings_v, opts_v)
wk.register(mappings_i, opts_i)
wk.register(mappings_z, opts_z)
