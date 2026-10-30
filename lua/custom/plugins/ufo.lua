vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set(
  'n',
  'zR',
  require('ufo').openAllFolds,
  { desc = 'Open all folds' }
)
vim.keymap.set(
  'n',
  'zM',
  require('ufo').closeAllFolds,
  { desc = 'Close all folds' }
)

require('ufo').setup {
  provider_selector = function() return { 'treesitter', 'indent' } end,
}
