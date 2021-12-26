--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __         __            _                     __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  ____  / /_  ______ _(_)___  _____         / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   / __ \/ / / / / __ `/ / __ \/ ___/        / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/    / /_/ / / /_/ / /_/ / / / / (__  )   _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/     / .___/_/\__,_/\__, /_/_/ /_/____/   (_)  /_/\__,_/\__,_/
--                                                                          /_/            /____/
-- Description:  define everything the packer plugin manager needs and list used plugins.
--               for further information about packer see https://github.com/wbthomason/packer.nvim
--               for the general structure of the following file, see https://github.com/wbthomason/packer.nvim#quickstart
-- Dependencies:
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 


-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Could not load properly 'packer' inside 'plugins.lua'")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- mandatory plugins
  use "wbthomason/packer.nvim"                      -- https://github.com/wbthomason/packer.nvim                      | Have packer manage itself
  use "nvim-lua/popup.nvim"                         -- https://github.com/nvim-lua/popup.nvim                         | An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"                       -- https://github.com/nvim-lua/plenary.nvim                       | Useful lua functions used ny lots of plugins
  -- colorschemes
  use "lunarvim/colorschemes"                       -- https://github.com/lunarvim/colorschemes                       | A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"                      -- https://github.com/lunarvim/darkplus.nvim                      | the darkplus theme from lunarvim
  use "tanvirtin/monokai.nvim"                      -- https://github.com/tanvirtin/monokai.nvim                      | the monokai them I like
  -- cmp plugins
  use "hrsh7th/nvim-cmp"                            -- https://github.com/hrsh7th/nvim-cmp                            | The completion plugin
  use "hrsh7th/cmp-buffer"                          -- https://github.com/hrsh7th/cmp-buffer                          | buffer completions
  use "hrsh7th/cmp-path"                            -- https://github.com/hrsh7th/cmp-path                            | path completions
  use "hrsh7th/cmp-cmdline"                         -- https://github.com/hrsh7th/cmp-cmdline                         | cmdline completions
  use "saadparwaiz1/cmp_luasnip"                    -- https://github.com/saadparwaiz1/cmp_luasnip                    | snippet completions
  use "hrsh7th/cmp-nvim-lsp"                        -- https://github.com/hrsh7th/cmp-nvim-lsp                        | lsp server completion
  use "hrsh7th/cmp-nvim-lua"                        -- https://github.com/hrsh7th/cmp-nvim-lua                        | lua completion
  -- snippets
  use "L3MON4D3/LuaSnip"                            -- https://github.com/L3MON4D3/LuaSnip                            | snippet engine
  use "rafamadriz/friendly-snippets"                -- https://github.com/rafamadriz/friendly-snippets                | a bunch of snippets to use
  -- LSP
  use "neovim/nvim-lspconfig"                       -- https://github.com/neovim/nvim-lspconfig                       | enable LSP
  use "williamboman/nvim-lsp-installer"             -- https://github.com/williamboman/nvim-lsp-installer             | simple to use language server installer
  use "tamago324/nlsp-settings.nvim"                -- https://github.com/tamago324/nlsp-settings.nvim                | language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim"             -- https://github.com/jose-elias-alvarez/null-ls.nvim             | for formatters and linters
  -- telescope
  use "nvim-telescope/telescope.nvim"               -- https://github.com/nvim-telescope/telescope.nvim               |
  use "nvim-telescope/telescope-media-files.nvim"   -- https://github.com/nvim-telescope/telescope-media-files.nvim   |
  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",              -- https://github.com/nvim-treesitter/nvim-treesitter             |
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring" -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring |
  -- git
  use "lewis6991/gitsigns.nvim"                                                                                                                               -- https://github.com/lewis6991/gitsigns.nvim
  -- other plugins
  use "windwp/nvim-autopairs"                       -- https://github.com/windwp/nvim-autopairs                       | Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim"                       -- https://github.com/numToStr/Comment.nvim                       | Easily comment stuff
  use "kyazdani42/nvim-web-devicons"                -- https://github.com/kyazdani42/nvim-web-devicons                |
  use "kyazdani42/nvim-tree.lua"                    -- https://github.com/kyazdani42/nvim-tree.lua                    |
  use "akinsho/bufferline.nvim"                     -- https://github.com/akinsho/bufferline.nvim                     |
  use "moll/vim-bbye"                               -- https://github.com/moll/vim-bbye                               |
  use "nvim-lualine/lualine.nvim"                   -- https://github.com/nvim-lualine/lualine.nvim                   |
  use "akinsho/toggleterm.nvim"                     -- https://github.com/akinsho/toggleterm.nvim                     |
  use "ahmedkhalf/project.nvim"                     -- https://github.com/ahmedkhalf/project.nvim                     |
  use "lewis6991/impatient.nvim"                    -- https://github.com/lewis6991/impatient.nvim                    |
  use "lukas-reineke/indent-blankline.nvim"         -- https://github.com/lukas-reineke/indent-blankline.nvim         |
  use "goolord/alpha-nvim"                          -- https://github.com/goolord/alpha-nvim                          |
  use "antoinemadec/FixCursorHold.nvim"             -- https://github.com/antoinemadec/FixCursorHold.nvim             | This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"                        -- https://github.com/folke/which-key.nvim                        |

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
