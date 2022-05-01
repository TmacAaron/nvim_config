-- local status_ok, vimtex = pcall(require, "vimtex")
-- if not status_ok then
--     vim.notify(vimtex)
--     return
-- end

vim.g.vimtex_view_method = 'zathura'

vim.g.vimtex_compiler_latexmk_engines = {
    _ = '-pdf',
    xelatex = '-xelatex',
}
-- vim.g.vimtex_syntax_comments = 1

vim.g.vimtex_quickfix_open_on_warning = 0
-- vim.g.vimtex_quickfix_mode = 0
-- vim.g.vimtex_quickfix_ignore_filters = {
--     "Command terminated with space",
--     "LaTeX Font Warning: Font shape",
--     "Package caption Warning: The option",
--     [[Underfull \\hbox (badness [0-9]*) in]],
--     "Package enumitem Warning: Negative labelwidth",
--     [[Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in]],
--     [[Package caption Warning: Unused \\captionsetup]],
--     "Package typearea Warning: Bad type area settings!",
--     [[Package fancyhdr Warning: \\headheight is too small]],
--     [[Underfull \\hbox (badness [0-9]*) in paragraph at lines]],
--     "Package hyperref Warning: Token not allowed in a PDF string",
--     [[Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in paragraph at lines]],
-- }
vim.g.vimtex_syntax_conceal = {
    accents = 1,
    cites = 1,
    fancy = 1,
    greek = 1,
    math_bounds = 1,
    math_delimiters = 1,
    math_fracs = 1,
    math_super_sub = 1,
    math_symbols = 1,
    sections = 1,
    styles = 1,
}
