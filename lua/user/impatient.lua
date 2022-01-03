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

local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  local err_opts = { title="lewis6991/impatient.nvim", timeout=5000 }
  vim.notify("Could not load properly 'impatient' inside 'impatient.lua'", "error", err_opts)
  return
end

impatient.enable_profile()
