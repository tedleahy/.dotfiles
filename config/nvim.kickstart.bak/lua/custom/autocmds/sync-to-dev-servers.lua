local to_exclude = {
  'logs',
  'local',
  'vendor',
  'node_modules',
  'package.json',
  'cpanfile.snapshot',
  'perl5.14.4.core',
  'lib/MessageFocus/Job/CustomScript',
}
local server_hostname = 'dev-41'
-- local server_hostname = 'dev-100'
local remote_mf_path = '/home/ted.leahy/messagefocus'

local rsync_cmd = string.format('rsync -ruv --exclude={%s} ./* ted.leahy@%s:%s &', table.concat(to_exclude, ','), server_hostname, remote_mf_path)

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '/Users/tleahy/projects/messagefocus/*',
  -- command = '!' .. rsync_cmd,
  command = 'silent !' .. rsync_cmd,
  group = vim.api.nvim_create_augroup('Rsync', {}),
})
