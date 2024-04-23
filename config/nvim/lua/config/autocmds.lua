-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local to_exclude = "'logs','local','vendor','perl5.14.4.core','lib/MessageFocus/Job/CustomScript','node_modules'"
local src_dir = "~/projects/messagefocus/*"
local dev_41_host = "ted.leahy@dev-41"
local dev_100_host = "ted.leahy@dev-100"
local remote_dir = "/home/ted.leahy/messagefocus"

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "/Users/tleahy/projects/messagefocus/*",
  command = string.format(
    "!rsync --recursive --update --links --mkpath --perms --executability --exclude={%s} %s %s:%s &",
    to_exclude,
    src_dir,
    -- dev_41_host,
    dev_100_host,
    remote_dir
  ),
})
