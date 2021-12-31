--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __               __  _ ____               __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  ____  ____  / /_(_) __/_  __         / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   / __ \/ __ \/ __/ / /_/ / / /        / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/    / / / / /_/ / /_/ / __/ /_/ /   _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/     /_/ /_/\____/\__/_/_/  \__, /   (_)  /_/\__,_/\__,_/
--                                                                                                 /____/
--
-- Description:  send notifications to neovim.
--               see https://github.com/rcarriga/nvim-notify
-- Dependencies:
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

-- Use a protected call so we don't error out on first use
local status_ok, notify = pcall(require, "notify")
if not status_ok then
  vim.notify("Could not load properly 'packer' inside 'plugins.lua'")
  return
end

notify.setup({
  stages   = "slide",              -- Animation style (see below for details). One of: "fade_in_slide_out", "fade", "slide", "static", "default".
  on_open  = nil,                  -- Function called when a new window is opened, use for changing win settings/config
  on_close = nil,                  -- Function called when a window is closed
  render   = "default",            -- Render function for notifications. See notify-render()
  timeout  = 5000,                 -- Default timeout for notifications
  -- For stages that change opacity this is treated as the highlight behind the window
  -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
  background_colour = "Normal",
  minimum_width     = 50,          -- Minimum width for notification windows
  icons = {                        -- Icons for the different levels
    ERROR = "",
    WARN  = "",
    INFO  = "",
    DEBUG = "",
    TRACE = "✎",
  },
})
