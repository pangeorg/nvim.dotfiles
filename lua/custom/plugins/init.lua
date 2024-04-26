-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup()
      vim.keymap.set('n', '<C-_>', '<CMD>ToggleTerm direction=float<CR>', { desc = 'Toggle terminal', silent = true })
      vim.keymap.set('t', '<C-_>', '<C-\\><C-n><CMD>ToggleTerm<CR>', { desc = 'Toggle terminal', silent = true })
    end,
  },
}
