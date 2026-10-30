require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },
  sections = {
    lualine_x = {
      function() return require('auto-session.lib').current_session_name(true) end,
    },
  },
}
