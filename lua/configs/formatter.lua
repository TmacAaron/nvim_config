local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
    vim.notify(formatter)
    return
end

formatter.setup()
