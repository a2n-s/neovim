--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __   _                       __  _            __           __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  (_)___ ___  ____  ____ _/ /_(_)__  ____  / /_         / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   / / __ `__ \/ __ \/ __ `/ __/ / _ \/ __ \/ __/        / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/    / / / / / / / /_/ / /_/ / /_/ /  __/ / / / /_    _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/     /_/_/ /_/ /_/ .___/\__,_/\__/_/\___/_/ /_/\__/   (_)  /_/\__,_/\__,_/
--                                                                                      /_/
-- Description:  To load neovim faster with a cache.
--               see https://github.com/lewis6991/impatient.nvim
-- Dependencies:
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

local notify_ok, notify = pcall(require, "notify")
local plugin            = "lewis6991/impatient.nvim"
local error_timeout     = 5000
local err_opts          = { title=plugin, timeout=error_timeout }

local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  local err_msg = "Could not load properly 'impatient' inside 'impatient.lua'"
  if not notify_ok then vim.notify(err_msg) else notify(err_msg, "error", err_opts) end
  return
end

impatient.enable_profile()
