local status_ok, grammar = pcall(require, "grammar-guard")
if not status_ok then
    vim.notify(grammar)
    return
end
-- hook to nvim-lspconfig
grammar.init()

-- local status_ok, lsp = pcall(require, "lspconfig")
-- if not status_ok then
--     vim.notify(lsp)
--     return
-- end
-- -- setup LSP config
-- lsp.grammar_guard.setup({
--     settings = {
--         ltex = {
--             enabled = { "latex", "tex", "bib", "markdown" },
--             language = "en",
--             diagnosticSeverity = "information",
--             setenceCacheSize = 2000,
--             additionalRules = {
--                 enablePickyRules = true,
--                 motherTongue = "en",
--             },
--             trace = { server = "verbose" },
--             dictionary = {},
--             disabledRules = {},
--             hiddenFalsePositives = {},
--         },
--     },
-- })
