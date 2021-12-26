--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--         _       _ __           __
--        (_)___  (_) /_         / /_  ______ _
--       / / __ \/ / __/        / / / / / __ `/
--      / / / / / / /_    _    / / /_/ / /_/ /
--     /_/_/ /_/_/\__/   (_)  /_/\__,_/\__,_/
--
-- Description:  simply loads all lua files needed by my neovim config.
-- Dependencies:
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"              -- https://github.com/hrsh7th/nvim-cmp
require "user.lsp"              -- https://github.com/neovim/nvim-lspconfig
require "user.telescope"        -- https://github.com/nvim-telescope/telescope.nvim
require "user.treesitter"       -- https://github.com/nvim-treesitter/nvim-treesitter
require "user.autopairs"        -- https://github.com/windwp/nvim-autopairs
require "user.comment"          -- https://github.com/lewis6991/gitsigns.nvim
require "user.gitsigns"         -- https://github.com/numToStr/Comment.nvim
require "user.nvim-tree"        -- https://github.com/kyazdani42/nvim-tree.lua
require "user.bufferline"       -- https://github.com/akinsho/bufferline.nvim
require "user.lualine"          -- https://github.com/nvim-lualine/lualine.nvim
require "user.toggleterm"       -- https://github.com/akinsho/toggleterm.nvim
require "user.project"          -- https://github.com/ahmedkhalf/project.nvim
require "user.impatient"        -- https://github.com/lewis6991/impatient.nvim
require "user.indentline"       -- https://github.com/lukas-reineke/indent-blankline.nvim
require "user.alpha"            -- https://github.com/goolord/alpha-nvim
require "user.whichkey"         -- https://github.com/folke/which-key.nvim
require "user.autocommands"
