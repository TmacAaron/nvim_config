local status_ok, installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    vim.notify(installer)
    return
end

-- automatically install
local servers = {
    "pyright",
    "jsonls",
    -- "texlab",
    "yamlls",
    -- "sumneko_lua",
}

for _, name in pairs(servers) do
    local server_is_found, server = installer.get_server(name)
    if server_is_found and not server:is_installed() then
        print("installing" .. name)
    end
end

installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("configs.lsp.handler").on_attach,
        capabilities = require("configs.lsp.handler").capabilities,
    }

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
