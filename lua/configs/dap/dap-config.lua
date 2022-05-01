local M = {}

local function config_install_and_sign()
    local dap_install = require("dap-install")
    dap_install.setup {
        installation_path = vim.fn.stdpath "data" .. "/dapinstall/",
    }
    require "dap"
    local dap_sign = {
        break_point = {
            text = "🛑",
            texthl = "LspDiagnosticsSignError",
            linehl = "",
            numhl = "",
        },
        rejected = {
            text = "",
            texthl = "LspDiagnosticsSignHint",
            linehl = "",
            numhl = "",
        },
        stopped = {
            text = "",
            texthl = "LspDiagnosticsSignInformation",
            linehl = "DiagnosticUnderlineInfo",
            numhl = "LspDiagnosticsSignInformation",
        },
    }

    vim.fn.sign_define("DapBreakpoint", dap_sign.break_point)
    vim.fn.sign_define("DapStopped", dap_sign.stopped)
    vim.fn.sign_define("DapBreakpointRejected", dap_sign.rejected)
end

local function config_dapui()
    -- dapui config
    local dap, dapui = require "dap", require "dapui"
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
        vim.api.nvim_command("DapVirtualTextEnable")
        -- dapui.close("tray")
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        vim.api.nvim_command("DapVirtualTextDisable")
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        vim.api.nvim_command("DapVirtualTextDisable")
        dapui.close()
    end
    -- for some debug adapter, terminate or exit events will no fire, use disconnect reuest instead
    dap.listeners.before.disconnect["dapui_config"] = function()
        vim.api.nvim_command("DapVirtualTextDisable")
        dapui.close()
    end
end

local function config_debuggers()
    local dap = require "dap"
    -- TODO: wait dap-ui for fixing temrinal layout
    -- the "30" of "30vsplit: doesn't work
    dap.defaults.fallback.terminal_win_cmd = '30vsplit new' -- this will be overrided by dapui
    dap.set_log_level("DEBUG")

    -- load from json file
    require('dap.ext.vscode').load_launchjs(nil, {cppdbg = {'cpp'}})

    -- config per launage
    require("configs.dap.language.python")
    -- require("configs.dap.language.cpp")
    require("configs.dap.language.di-cpp")
end

function M.setup()
    config_install_and_sign()
    config_dapui()
    config_debuggers() -- Debugger
end

return M
