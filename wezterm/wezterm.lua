
-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- IME有効にする
config.use_ime = true

-- color scheme (see: https://wezfurlong.org/wezterm/colorschemes/)
config.color_scheme = 'Monokai Dark (Gogh)'

-- フォント
-- config.font = wezterm.font{
--   family="Hack Nerd Font", 
--   weight="Regular", stretch="Normal", style="Normal",
--   harfbuzz_features={ 'calt=0', 'clig=0', 'liga=0' },
-- }
config.line_height = 1.0

-- 背景を透過
config.window_background_opacity = 0.70

-- タブバーの設定
-- config.enable_tab_bar = false
config.tab_bar_at_bottom = true -- タブを下に表示
config.hide_tab_bar_if_only_one_tab = true

-- 非アクティブなペインの明度を下げる
config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.8,
}

-- ショートカットキーの設定
config.keys = {
  -- Ctrl+Shift+hで新しいペインを作成(画面を横分割)
  {
    key = 'h',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },

  -- Ctrl+Shift+vで新しいペインを作成(画面を縦分割)
  {
    key = 'j',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },

  -- Ctrl+左矢印でカーソルを前の単語に移動
  {
    key = "LeftArrow",
    mods = "SHIFT",
    action = wezterm.action.SendKey {
      key = "b",
      mods = "META",
    },
  },

  -- Shift+右矢印でカーソルを次の単語に移動
  {
    key = "RightArrow",
    mods = "SHIFT",
    action = wezterm.action.SendKey {
      key = "f",
      mods = "META",
    },
  },

  -- Shift+Backspaceで前の単語を削除
  {
    key = "Backspace",
    mods = "SHIFT",
    action = wezterm.action.SendKey {
      key = "w",
      mods = "CTRL",
    },
  },

  -- Alt(Opt)+Shift+Fでフルスクリーン切り替え
  -- {
  --   key = 'f',
  --   mods = 'SHIFT|META',
  --   action = wezterm.action.ToggleFullScreen,
  -- },
  
  -- Ctrl+Shift+tで新しいタブを作成
  {
    key = 't',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
}




-- ログインシェルの指定
-- for MacOS
-- config.default_prog = { '/bin/zsh', '-l' }
-- for Ubuntu
config.default_prog = { '/usr/bin/zsh', '-l' }


-- launch menu (see https://wezfurlong.org/wezterm/config/launch.html#the-launcher-menu)
-- config.launch_menu = {
--   {
--     args = { 'top' },
--   },
--   {
--     -- Optional label to show in the launcher. If omitted, a label
--     -- is derived from the `args`
--     label = 'Bash',
--     -- The argument array to spawn.  If omitted the default program
--     -- will be used as described in the documentation above
--     args = { 'bash', '-l' },

--     -- You can specify an alternative current working directory;
--     -- if you don't specify one then a default based on the OSC 7
--     -- escape sequence will be used (see the Shell Integration
--     -- docs), falling back to the home directory.
--     -- cwd = "/some/path"

--     -- You can override environment variables just for this command
--     -- by setting this here.  It has the same semantics as the main
--     -- set_environment_variables configuration option described above
--     -- set_environment_variables = { FOO = "bar" },
--   },
-- }

-- and finally, return the configuration to wezterm
return config
