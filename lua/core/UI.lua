vim.cmd [[
    augroup ui_user_config
        autocmd!
        autocmd BufWritePost UI.lua source <afile>
    augroup end
]]

vim.g.sonokai_style = 'atlantis'
vim.g.sonokai_transparent_background = 1
vim.g.sonokai_better_performance = 1
-- vim.g.sonokai_enable_italic = 0
-- vim.g.sonokai_disable_italic_comment = 0
vim.opt.termguicolors = true
-- vim.cmd('colorscheme catppuccin')
vim.cmd('colorscheme sonokai')
-- vim.cmd('colorscheme gruvbox')
vim.cmd('highlight Normal guibg=None ctermbg=None')
vim.cmd('highlight VertSplit guifg=#C1C7B5 ctermfg=250')
vim.cmd('highlight LineNr guifg=#98B7B5 ctermfg=240')
vim.cmd('highlight MatchParen ctermbg=100 guibg=#97B87E ctermfg=237 guifg=#424b5b')
vim.cmd('highlight MatchWord ctermfg=110 guifg=#72cce8 cterm=underline,italic gui=underline,italic')
vim.cmd('highlight MatchParenCur cterm=underline gui=underline')
vim.cmd('highlight MatchWordCur cterm=underline,italic gui=underline,italic')
-- vim.cmd('highlight MatchWordCur cterm=reverse gui=reverse')
vim.cmd('highlight Visual cterm=reverse gui=reverse')
vim.cmd('highlight Conceal ctermfg=240 guifg=#FB98DD')
vim.cmd('highlight CursorColumn ctermbg=236 guibg=#5D657D')

vim.cmd('highlight link illuminatedWord CursorColumn')
-- vim.cmd('highlight illuminatedWord cterm=reverse gui=reverse')
-- vim.cmd('highlight link CurrentWord Visual')
vim.cmd('highlight Folded guifg=#C1C7B5')

require'lualine'.setup {
    options = {
        theme = 'sonokai'
    }
}

-- require'catppuccin'.setup {
--     transparent_background = true,
--     term_colors = true,
--     integrations = {
--         treesitter = true,
--         telescope = true,
--         nvimtree = {
--             enabled = true,
--             show_root = false,
--             transparent_panel = true,
--         },
--     }
-- }
