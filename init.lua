require('mapping')
require('options')

if vim.fn.exists("g:vscode") == 0 then
  require('plugins')
  require('plugins_setup')
end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
