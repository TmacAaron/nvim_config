local status_ok, fold = pcall(require, "pretty-fold")
if not status_ok then
    vim.notify(fold)
    return
end

local status_ok, preview = pcall(require, "pretty-fold.preview")
if not status_ok then
    vim.notify(preview)
    return
end

fold.setup()
preview.setup()
