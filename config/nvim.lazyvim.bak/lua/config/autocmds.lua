-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Rsync from dev to remote server
local to_exclude = {
  "logs",
  "local",
  "vendor",
  "node_modules",
  "package.json",
  "cpanfile.snapshot",
  "perl5.14.4.core",
  "lib/MessageFocus/Job/CustomScript",
}
local server_hostname = "dev-41"
-- local server_hostname = 'dev-100'
local remote_mf_path = "/home/ted.leahy/messagefocus"

local rsync_cmd = string.format(
  "rsync -ruv --exclude={%s} ./* ted.leahy@%s:%s &",
  table.concat(to_exclude, ","),
  server_hostname,
  remote_mf_path
)

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "/Users/tleahy/projects/messagefocus/*",
  -- command = '!' .. rsync_cmd,
  command = "silent !" .. rsync_cmd,
  group = vim.api.nvim_create_augroup("Rsync", {}),
})
