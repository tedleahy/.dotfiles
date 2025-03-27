-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.editorconfig = false

-- Tab widths
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "perl",
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "typescriptreact",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

-- Sets how neovim will display certain whitespace characters in the editor
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.list = true
