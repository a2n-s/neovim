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
-- Description:  TODO
-- Dependencies: TODO
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("Could not load properly 'lspconfig' inside 'lsp/init.lua'")
  return
end

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
