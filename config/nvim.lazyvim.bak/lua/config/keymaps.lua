-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprev<CR>", { desc = "Go to previous buffer" })

-- Use tabs for indenting, spaces for alignment
local function smart_tab()
  local col = vim.fn.col(".")
  local current_line = vim.fn.getline(".")
  local line_before_cursor = string.sub(current_line, 1, col - 1)

  if col == 1 or string.match(line_before_cursor, "^%s+$") then
    return "<Tab>"
  else
    local spaces_needed = vim.opt.softtabstop:get() - ((vim.fn.virtcol(".") - 1) % vim.opt.softtabstop:get())
    return string.rep(" ", spaces_needed)
  end
end

vim.keymap.set("i", "<Tab>", function()
  return smart_tab()
  -- end, { expr = true, silent = true })
end, { expr = true })
