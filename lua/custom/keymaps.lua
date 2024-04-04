---------------------------------------
-- Telescope keymaps
---------------------------------------

local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end

local function telescope_find_buffers_in_current_tab()
  require('telescope.builtin').buffers {
    only_cwd = true
  }
end

vim.keymap.set('n', '<leader>f/', telescope_live_grep_open_files, { desc = '[F]ind [/] in Open Files' })
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').builtin, { desc = '[F]ind [S]elect Telescope' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fG', ':LiveGrepGitRoot<cr>', { desc = '[F]ind by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume, { desc = '[F]ind [R]esume' })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', telescope_find_buffers_in_current_tab, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

local function find_git_root()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == '' then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ':h')
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
  if vim.v.shell_error ~= 0 then
    print 'Not a git repository. Searching on current working directory'
    return cwd
  end
  return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require('telescope.builtin').live_grep {
      search_dirs = { git_root },
    }
  end
end

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

-- vim.keymap.set('n', '<leader>fw', ':LiveGrepGitRoot<cr>', { desc = '[F]ind by Grep on Git Root' })
---------------------------------------
-- Tabs
---------------------------------------
local function test(opts)
  local git_root = find_git_root()
  local parsed = load("return " .. opts.args)
  vim.cmd.tc(git_root)
  return {}
end

vim.api.nvim_create_user_command('FuckinWorkGoddamnIt', test, {})
vim.keymap.set('n', '<leader>tb', require('telescope.builtin').buffers, { desc = 'Show Buffers from all Tabs' })
vim.keymap.set('n', '<leader>tn', '<CMD>tabe<CR>', {desc = 'Create New Tab'})
vim.keymap.set('n', '<leader>tc', '<CMD>tabc<CR>', {desc = 'Close Current Tab'})
-- vim.keymap.set('n', '<leader>ts', '<CMD>tcd ' .. find_git_root() .. '<CR>', {desc = 'Set directory to current working directory for active tab'})
-- vim.keymap.set('n', '<CMD>FuckinWorkGoddamnIt<CR>', {desc = 'Set directory to current working directory for active tab'})
vim.keymap.set('n', '<M-h>', '<CMD>tabn -<CR>', {desc = 'Go to previous tab'})
vim.keymap.set('n', '<M-l>', '<CMD>tabn +<CR>', {desc = 'Go to next tab'})

---------------------------------------
-- Fine CmdLine
---------------------------------------

-- vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})

---------------------------------------
-- Oil
---------------------------------------
vim.keymap.set('n', '<leader>o', '<CMD>Oil<CR>', {desc = "Open [O]il"})

---------------------------------------
-- Monorepo
---------------------------------------
-- vim.keymap.set('n', '<leader>ml', '<CMD>Telescope monorepo<CR>', { desc = "Open Repo List" })
