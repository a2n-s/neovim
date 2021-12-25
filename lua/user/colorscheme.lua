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
-- Description:  TODO
-- Dependencies: TODO
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

vim.cmd [[
try
  colorscheme monokai
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
