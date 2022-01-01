--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __   __                 __   _       _ __           __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  / /________       _/_/  (_)___  (_) /_         / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   / / ___/ __ \    _/_/   / / __ \/ / __/        / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/    / (__  ) /_/ /  _/_/    / / / / / / /_    _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/     /_/____/ .___/  /_/     /_/_/ /_/_/\__/   (_)  /_/\__,_/\__,_/
--                                                                                 /_/
-- Description:  the central control of the lsp management in neovim, basically calls other files.
-- Dependencies:
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

local notify_ok, notify = pcall(require, "notify")
local plugin            = "lsp"
local error_timeout     = 5000
local err_opts          = { title=plugin, timeout=error_timeout }

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  local err_msg = "Could not load properly 'lspconfig' inside 'lsp/init.lua'"
  if not notify_ok then vim.notify(err_msg) else notify(err_msg, "error", err_opts) end
  return
end

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
