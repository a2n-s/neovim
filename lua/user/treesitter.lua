--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __   __                      _ __  __                     __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  / /_________  ___  _____(_) /_/ /____  _____         / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   / __/ ___/ _ \/ _ \/ ___/ / __/ __/ _ \/ ___/        / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/    / /_/ /  /  __/  __(__  ) / /_/ /_/  __/ /      _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/      \__/_/   \___/\___/____/_/\__/\__/\___/_/      (_)  /_/\__,_/\__,_/
--
-- Description:  treesitter for better highlight.
-- Dependencies:
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

local notify_ok, notify = pcall(require, "notify")
local plugin            = "https://github.com/nvim-treesitter/nvim-treesitter"
local error_timeout     = 5000
local err_opts          = { title=plugin, timeout=error_timeout }

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  local err_msg = "Could not load properly 'nvim-treesitter.configs' inside 'treesitter.lua'"
  if not notify_ok then vim.notify(err_msg) else notify(err_msg, "error", err_opts) end
  return
end

configs.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
