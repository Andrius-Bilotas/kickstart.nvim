require('auto-session').setup {
  suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
}

vim.keymap.set(
  'n',
  '<leader>ar',
  '<cmd>AutoSession search<CR>',
  { desc = 'Session search' }
)
vim.keymap.set(
  'n',
  '<leader>as',
  '<cmd>AutoSession save<CR>',
  { desc = 'Save session' }
)
vim.keymap.set(
  'n',
  '<leader>aa',
  '<cmd>AutoSession toggle<CR>',
  { desc = 'Toggle autosave' }
)
