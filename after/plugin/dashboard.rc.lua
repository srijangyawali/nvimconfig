local status, db = pcall(require, 'dashboard')
if (not status) then
  print("Dashboard not found")
  return
end

db.setup({
  theme = 'doom',
  config = {
    header = {
      '',
      '',
      '',
      '',
      '',
      '',
      '   ██████  ███████ ████████ ██████  ██ ███████     ',
      '   ██   ██ ██         ██    ██   ██ ██ ██          ',
      '   ██   ██ █████      ██    ██████  ██ ███████     ',
      '   ██   ██ ██         ██    ██   ██ ██      ██     ',
      '   ██████  ███████    ██    ██   ██ ██ ███████     ',
      '',
      '',
      'You are not supposed to be here!',
      '',
      '',
    },
    center = {
      {
        icon = '⏳ ',
        desc = 'Recent Files                       SPC f r',
        keymap = 'SPC f r',
        action = 'Telescope oldfiles'
      },
      {
        icon = '🔍 ',
        desc = 'Find files                         SPC t f',
        keymap = 'SPC t f',
        action = 'Telescope find_files'
      },
      {
        icon = '📂 ',
        desc = 'File Browser                       SPC f f',
        keymap = 'SPC f f',
        action = 'Telescope file_browser'
      },
      {
        icon = '🟰 ',
        desc = 'Search word                        SPC t g',
        keymap = 'SPC t g',
        action = 'Telescope live_grep'
      },

    },
    footer = { '', '', '', '⚠️ To exit neovim press :q followed by an enter. ' },
  }
})
