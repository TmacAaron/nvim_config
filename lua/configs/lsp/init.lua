local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("lspconfig not found!")
    return
end

require('configs.lsp.tabnine')
require('configs.lsp.cmp')
require('configs.lsp.installer')
require('configs.lsp.lsp-signature')
require('configs.lsp.handler').setup()
require('configs.lsp.grammar')
