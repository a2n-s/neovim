--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __        __               __       __              __           __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  _____/ /_  ___  ____ _/ /______/ /_  ___  ___  / /_         / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   / ___/ __ \/ _ \/ __ `/ __/ ___/ __ \/ _ \/ _ \/ __/        / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/    / /__/ / / /  __/ /_/ / /_(__  ) / / /  __/  __/ /_    _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/      \___/_/ /_/\___/\__,_/\__/____/_/ /_/\___/\___/\__/   (_)  /_/\__,_/\__,_/
--
-- Description:  manage, open, search and edit a cheatsheet about neovim commands.
--               see https://github.com/sudormrfbin/cheatsheet.nvim
-- Dependencies:
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

local status_ok, cheatsheet = pcall(require, "cheatsheet")
if not status_ok then
  vim.notify("Could not load properly 'cheatsheet' inside 'cheatsheet.lua'")
  return
end

cheatsheet.setup({
    -- Whether to show bundled cheatsheets

    -- For generic cheatsheets like default, unicode, nerd-fonts, etc
    bundled_cheatsheets = {
        enabled = {},
        disabled = {"nerd-font"},
    },
    -- bundled_cheatsheets = true,

    -- For plugin specific cheatsheets
    bundled_plugin_cheatsheets = {
        -- enabled = {"gitsigns.nvim", "telescope.nvim", "nvim-tree"},
        disabled = {},
    },
    -- bundled_plugin_cheatsheets = true,

    -- For bundled plugin cheatsheets, do not show a sheet if you
    -- don't have the plugin installed (searches runtimepath for
    -- same directory name)
    include_only_installed_plugins = true,

    -- Key mappings bound inside the telescope window
    telescope_mappings = {
        ['<CR>'] = require('cheatsheet.telescope.actions').select_or_fill_commandline,
        ['<A-CR>'] = require('cheatsheet.telescope.actions').select_or_execute,
        ['<C-Y>'] = require('cheatsheet.telescope.actions').copy_cheat_value,
        ['<C-E>'] = require('cheatsheet.telescope.actions').edit_user_cheatsheet,
    }
})
