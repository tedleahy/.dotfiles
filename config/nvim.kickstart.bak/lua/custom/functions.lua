local function smart_tab()
  local current_line = vim.fn.getline '.'
  local col = vim.fn.col '.' - 1 -- Get current column (0-indexed)

  if col == 0 then
    -- Beginning of line, insert tab
    vim.api.nvim_input '\t'
    return
  end

  local line_before_cursor = string.sub(current_line, 1, col)

  if string.match(line_before_cursor, '^%s*$') or string.match(line_before_cursor, '^\t*$') then
    -- Only whitespace or tabs before cursor, insert tab
    vim.api.nvim_input '\t'
  else
    -- Other characters before cursor, insert spaces
    vim.api.nvim_input(string.rep(' ', vim.opt.softtabstop:get()))
  end
end

local M = {}
M.smart_tab = smart_tab
return M
