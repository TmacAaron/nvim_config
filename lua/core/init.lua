require('impatient')

vim.cmd [[
    augroup user_config
        autocmd!
        autocmd BufWritePost init.lua source <afile>
    augroup end
]]

-- vim.opt.nocompatible=true                           -- 不以兼容模式运行
vim.opt.encoding='utf-8'                            -- utf-8编码
vim.opt.helplang='cn'                               -- 中文帮助文档
vim.opt.number=true                                 -- 显示行号
vim.opt.wrap=true                                   -- 自动换行
vim.opt.showcmd=true                                -- 显示输入信息
vim.opt.cursorline=true                             -- 显示光标所在行
vim.opt.cursorcolumn=true                             -- 显示光标所在列
-- vim.opt.cursorcolumn                             -- 显示光标所在列
vim.opt.wildmenu=true                               -- 显示补全提示
vim.opt.hlsearch=true                               -- 高亮搜索结果
vim.opt.rnu=true                                    -- 相对行号
vim.opt.list=true
--vim.opt.list lcs=tab:\|\ 
--vim.opt.listchars={'tab:▸\ ','trail:▫'}
vim.opt.foldenable=false-- 允许折叠 
-- vim.opt.foldmethod='manual'                         -- 手动折叠 
vim.opt.foldmethod='expr'
vim.opt.foldexpr="nvim_treesitter#foldexpr()"
vim.opt.foldlevel=99
vim.opt.shiftwidth = 4
vim.opt.ts=4                                        -- 设置tab键长度为四个空格
vim.opt.expandtab=true                              -- 设置tab键替换为四个空格键
vim.opt.incsearch=true                              -- 一边输入一边高亮  
vim.opt.ignorecase=true                             -- 忽略大小写
vim.opt.smartcase=true                              -- 智能大小写 
vim.opt.laststatus=2                                -- 设置状态栏在倒数第2行
vim.opt.spell=false                                  -- 打开拼写检查
vim.opt.spelllang={'en', 'de', 'cjk'}
vim.opt.mouse='a'                                   -- 启用鼠标
vim.opt.backspace={'indent', 'eol', 'start'}        -- 退格键可以退到上一行
vim.opt.scrolloff=8                                 -- 光标行上下移动范围各缩小5行
-- vim.opt.ruler=true
-- vim.opt.showtabline=2
vim.opt.conceallevel =1

vim.cmd "set whichwrap+=<,>,[,]"
vim.cmd [[set iskeyword+=-]]
-- vim.cmd "syntax enable"
require('core.plugins')
require('core.UI')
require('core.keymaps')
require('core.autocommands')

require('configs')
