--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __     _                   __                     __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/    (_)_  ______  __  __/ /____  _____         / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/     / / / / / __ \/ / / / __/ _ \/ ___/        / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/      / / /_/ / /_/ / /_/ / /_/  __/ /      _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/     __/ /\__,_/ .___/\__, /\__/\___/_/      (_)  /_/\__,_/\__,_/
--                                                                          /___/     /_/    /____/
--
-- Description:  opens jupoyter notebooks inside neovim.
--               see https://github.com/ahmedkhalf/jupyter-nvim
-- Dependencies:
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

local status_ok, jupyter = pcall(require, "jupyter-nvim")
if not status_ok then
  vim.notify("Could not load 'jupyter-nvim' inside 'jupyter.lua'", "error", { title="ahmedkhalf/jupyter-nvim" })
  return
end
jupyter.setup({})

