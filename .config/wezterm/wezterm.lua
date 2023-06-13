local wezterm = require 'wezterm'
local act     = wezterm.action

local bindings = {
  { key = '=', mods = 'CTRL',       action = act.IncreaseFontSize },
  { key = '-', mods = 'CTRL',       action = act.DecreaseFontSize },
  { key = 't', mods = 'CTRL',       action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 't', mods = 'CTRL|SHIFT', action = act.SpawnWindow },
  { key = 'w', mods = 'CTRL',       action = act.CloseCurrentTab { confirm = false }},
  { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo 'Clipboard' },
  { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom 'Clipboard' }
}

for i = 1, 7 do
  table.insert(bindings, {
    key    = tostring(i),
    mods   = 'CTRL',
    action = act.ActivateTab(i - 1)
  })
end

return {
  color_scheme         = 'Catppuccin Mocha',
  font                 = wezterm.font 'Delugia',
  font_size            = 11,
  default_cursor_style = 'SteadyBar',

  enable_scroll_bar     = true,
  use_fancy_tab_bar     = false,
  scrollback_lines      = 2000,
  enable_kitty_graphics = true,

  disable_default_key_bindings = true,
  keys                         = bindings
 }
