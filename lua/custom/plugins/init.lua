local function gh(repo) return 'https://github.com/' .. repo end

vim.api.nvim_create_autocmd('PackChanged', {
  group = vim.api.nvim_create_augroup('custom-pack-builds', { clear = true }),
  callback = function(event)
    if
      event.data.spec.name == 'markdown-preview.nvim'
      and (event.data.kind == 'install' or event.data.kind == 'update')
    then
      local result = vim
        .system({ 'npx', '--yes', 'yarn', 'install' }, {
          cwd = vim.fs.joinpath(event.data.path, 'app'),
        })
        :wait()
      if result.code ~= 0 then
        local output = result.stderr or result.stdout or ''
        if output == '' then output = 'No output from the install command.' end
        vim.notify(
          ('Markdown Preview install failed:\n%s'):format(output),
          vim.log.levels.ERROR
        )
      end
    end
  end,
})

vim.pack.add {
  gh 'tpope/vim-fugitive',
  gh 'tpope/vim-rhubarb',
  gh 'numToStr/Comment.nvim',
  gh 'lukas-reineke/indent-blankline.nvim',
  gh 'windwp/nvim-autopairs',
  gh 'rmagatti/auto-session',
  gh 'sindrets/diffview.nvim',
  gh 'kdheepak/lazygit.nvim',
  gh 'iamcco/markdown-preview.nvim',
  gh 'andythigpen/nvim-coverage',
  gh 'stevearc/oil.nvim',
  gh 'nvim-tree/nvim-web-devicons',
  gh 'nvim-lualine/lualine.nvim',
  gh 'kylechui/nvim-surround',
  gh 'kevinhwang91/nvim-ufo',
  gh 'kevinhwang91/promise-async',
  'https://codeberg.org/andyg/leap.nvim',
  gh 'nvim-lua/plenary.nvim',
}

require('Comment').setup {}
require('ibl').setup {}
require 'custom.plugins.autopairs'
require 'custom.plugins.autosession'
require 'custom.plugins.leap'
require 'custom.plugins.markdown-preview'
require 'custom.plugins.lualine'
require 'custom.plugins.nvim-coverage'
require 'custom.plugins.oil'
require 'custom.plugins.surround'
require 'custom.plugins.ufo'
require 'custom.plugins.lazygit'
require 'custom.keymaps'
