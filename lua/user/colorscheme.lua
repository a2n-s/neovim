--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __              __                     __                                 __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  _________  / /___  _______________/ /_  ___  ____ ___  ___           / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   / ___/ __ \/ / __ \/ ___/ ___/ ___/ __ \/ _ \/ __ `__ \/ _ \         / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/    / /__/ /_/ / / /_/ / /  (__  ) /__/ / / /  __/ / / / / /  __/   _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/      \___/\____/_/\____/_/  /____/\___/_/ /_/\___/_/ /_/ /_/\___/   (_)  /_/\__,_/\__,_/
--
-- Description:  loads a colorscheme or fallback to the default of neovim when not found.
-- Dependencies:
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch

local colorscheme = "xresources"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("Could not load properly '" .. colorscheme .. "' inside 'colorscheme.lua'", "error", { title = colorscheme })
  vim.cmd([[colorscheme default]])
  vim.cmd([[set background=dark]])
	return
end
