return {
  'rmagatti/auto-session',
  lazy = false,
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
  },
  keys = {
    { '<leader>ar', '<cmd>AutoSession search<CR>', desc = 'Session search' },
    { '<leader>as', '<cmd>AutoSession save<CR>', desc = 'Save session' },
    { '<leader>aa', '<cmd>AutoSession toggle<CR>', desc = 'Toggle autosave' },
  },
}
