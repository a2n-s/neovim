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
local notify_ok, notify = pcall(require, "notify")
local plugin            = "wbthomason/packer.nvim"
local error_timeout     = 5000
local err_opts          = { title=plugin, timeout=error_timeout }

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  local err_msg = "Could not load properly 'packer' inside 'plugins.lua'"
  if not notify_ok then vim.notify(err_msg) else notify(err_msg, "error", err_opts) end
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
-- TOC:
--   Management           Color                               Cursorline                    Search                Preconfigured Configuration
--   UI                     Colorscheme Creation              Startup                       Scrollbar             Keybinding
--   Completion             Colorscheme                       Indent                        Scrolling             Tmux
--   snippets               Tree-sitter Supported Colorscheme Game                          Mouse                 Remote Development
--   LSP                    Lua Colorscheme                   File explorer                 Project               Split and Window
--     LSP Installer      Utility                             Dependency management         Browser integration   External
--   Markdown             Icon                                Git                           Editing support       Version Manager
--   Syntax               Debugging                           Programming languages support Formatting            Boilerplate
--   Terminal integration Spellcheck                          Comment                       Web development       other plugins
--   Snippets             Neovim Lua Development              Collaborative Editing         Media
--   Register             Fennel                              Quickfix                      Discord Rich Presence
--   Marks                Tabline                             Motion                        Command Line
--   Fuzzy Finder         Statusline                          Code Runner                   Session
--   Note Taking            Statusline component              GitHub                        Test
-- Management
     use "wbthomason/packer.nvim"                      -- https://github.com/wbthomason/packer.nvim                      | Have packer manage itself
     use "nvim-lua/popup.nvim"                         -- https://github.com/nvim-lua/popup.nvim                         | An implementation of the Popup API from vim in Neovim
     use "nvim-lua/plenary.nvim"                       -- https://github.com/nvim-lua/plenary.nvim                       | Useful lua functions used ny lots of plugins
  -- use "wbthomason/packer.nvim"                      -- https://github.com/wbthomason/packer.nvim                      | A use-package inspired plugin manager for Neovim. Uses native packages, supports Luarocks dependencies, written in Lua, allows for expressive config.
  -- use "savq/paq-nvim"                               -- https://github.com/savq/paq-nvim                               | Neovim package manager written in Lua.
  -- use "NTBBloodbath/cheovim"                        -- https://github.com/NTBBloodbath/cheovim                        | Neovim configuration switcher written in Lua. Inspired by chemacs.
-- UI
  -- use "CosmicNvim/cosmic-ui"                        -- https://github.com/CosmicNvim/cosmic-ui                        | Cosmic-UI is a simple wrapper around specific vim functionality. Built in order to provide a quick and easy way to create a Cosmic UI experience with Neovim!
  -- use "yatli/fvim"                                  -- https://github.com/yatli/fvim                                  | Cross platform Neovim front-end UI, built with F# + Avalonia.
  -- use "qvacua/vimr"                                 -- https://github.com/qvacua/vimr                                 | Neovim GUI for macOS in Swift.
  -- use "vhakulinen/gnvim"                            -- https://github.com/vhakulinen/gnvim                            | GUI for Neovim, without any web bloat.
  -- use "Kethku/neovide"                              -- https://github.com/Kethku/neovide                              | No Nonsense Neovim Client in Rust.
  -- use "beeender/glrnvim"                            -- https://github.com/beeender/glrnvim                            | A terminal wrapper that launches Neovim inside of alacritty.
  -- use "akiyosi/goneovim"                            -- https://github.com/akiyosi/goneovim                            | Neovim GUI written in Golang, using a Golang qt backend.
  -- use "RMichelsen/Nvy"                              -- https://github.com/RMichelsen/Nvy                              | A Neovim client in C++.
  -- use "asvetliakov/vscode-neovim"                   -- https://github.com/asvetliakov/vscode-neovim                   | Neovim integration for Visual Studio Code.
  -- use "equalsraf/neovim-qt"                         -- https://github.com/equalsraf/neovim-qt                         | Neovim client library and GUI, in Qt5.
  -- use "lunixbochs/actualvim"                        -- https://github.com/lunixbochs/actualvim                        | Sublime Text 3 input mode using Neovim.
  -- use "vv-vim/vv"                                   -- https://github.com/vv-vim/vv                                   | Neovim client for macOS. A pure, fast, minimalistic Vim experience with good macOS integration. Optimized for speed and nice font rendering.
  -- use "jebberjeb/javafx-neovimpane"                 -- https://github.com/jebberjeb/javafx-neovimpane                 | A JavaFX text pane, backed by Neovim, created with Clojure.
  -- use "rohit-px2/nvui"                              -- https://github.com/rohit-px2/nvui                              | A modern frontend for Neovim.
  -- use "Lyude/neovim-gtk"                            -- https://github.com/Lyude/neovim-gtk                            | A GTK3+ client written in Rust, ressembling a lot the original vim-gtk3 with ligatures support.
-- Completion
     use "hrsh7th/cmp-cmdline"                         -- https://github.com/hrsh7th/cmp-cmdline                        *| cmdline completions
  -- use "ms-jpq/coq_nvim"                             -- https://github.com/ms-jpq/coq_nvim                             | Fast as FUCK Neovim completion. SQLite, concurrent scheduler, hundreds of hours of optimization.
  -- use "jameshiew/nvim-magic"                        -- https://github.com/jameshiew/nvim-magic                        | Framework for integrating AI code assistance.
     use "hrsh7th/nvim-cmp"                            -- https://github.com/hrsh7th/nvim-cmp>                           | A completion plugin for Neovim written in Lua. New version of nvim-compe.
     use "hrsh7th/cmp-nvim-lsp"                        -- https://github.com/hrsh7th/cmp-nvim-lsp                        | A nvim-cmp source for Neovim builtin LSP client.
     use "saadparwaiz1/cmp_luasnip"                    -- https://github.com/saadparwaiz1/cmp_luasnip                    | A nvim-cmp source for luasnip completion.
  -- use "quangnguyen30192/cmp-nvim-ultisnips"         -- https://github.com/quangnguyen30192/cmp-nvim-ultisnips         | A nvim-cmp source for UltiSnips.
     use "hrsh7th/cmp-path"                            -- https://github.com/hrsh7th/cmp-path                            | A nvim-cmp source for filesystem paths.
  -- use "petertriho/cmp-git"                          -- https://github.com/petertriho/cmp-git                          | A nvim-cmp source for Git.
     use "hrsh7th/cmp-buffer"                          -- https://github.com/hrsh7th/cmp-buffer                          | A nvim-cmp source for buffer words.
  -- use "tzachar/cmp-tabnine"                         -- https://github.com/tzachar/cmp-tabnine                         | A nvim-cmp source for TabNine.
     use "hrsh7th/cmp-nvim-lua"                        -- https://github.com/hrsh7th/cmp-nvim-lua                        | A nvim-cmp source for the Neovim Lua API.
  -- use "lukas-reineke/cmp-rg"                        -- https://github.com/lukas-reineke/cmp-rg                        | A nvim-cmp source for Ripgrep.
  -- use "f3fora/cmp-spell"                            -- https://github.com/f3fora/cmp-spell                            | A nvim-cmp source for vim's spellsuggest.
  -- use "andersevenrud/compe-tmux"                    -- https://github.com/andersevenrud/compe-tmux                    | A nvim-cmp source for Tmux.
  -- use "David-Kunz/cmp-npm"                          -- https://github.com/David-Kunz/cmp-npm                          | A nvim-cmp source for NPM.
  -- use "lukas-reineke/cmp-under-comparator"          -- https://github.com/lukas-reineke/cmp-under-comparator          | A nvim-cmp function for better sorting.
  -- use "mini.completion"                             -- https://github.com/echasnovski/mini.nvim#minicompletion        | Module of <a href="https://github.com/echasnovski/mini.nvim">echasnovski/mini.nvim</a> for asynchronous two-stage completion. Supports showing completion item info and independent function signature.
-- snippets
     use "L3MON4D3/LuaSnip"                            -- https://github.com/L3MON4D3/LuaSnip                            | snippet engine
     use "rafamadriz/friendly-snippets"                -- https://github.com/rafamadriz/friendly-snippets                | a bunch of snippets to use
-- LSP
     use "neovim/nvim-lspconfig"                       -- https://github.com/neovim/nvim-lspconfig                       | Quickstart configurations for the Neovim LSP client.
  -- use "nvim-lua/lsp-status.nvim"                    -- https://github.com/nvim-lua/lsp-status.nvim                    | This is a Neovim plugin/library for generating statusline components from the built-in LSP client.
  -- use "nvim-lua/lsp_extensions.nvim"                -- https://github.com/nvim-lua/lsp_extensions.nvim                | Repo to hold a bunch of info                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                amp; extension callbacks for built-in LSP.
  -- use "RishabhRD/nvim-lsputils"                     -- https://github.com/RishabhRD/nvim-lsputils                     | Better defaults for nvim-lsp actions.
  -- use "tami5/lspsaga.nvim"                          -- https://github.com/tami5/lspsaga.nvim                          | A light-weight lsp plugin based on Neovim built-in lsp with a highly performant UI.
  -- use "onsails/diaglist.nvim"                       -- https://github.com/onsails/diaglist.nvim                       | Live render workspace diagnostics in quickfix, buffer diagnostics in loclist.
  -- use "folke/trouble.nvim"                          -- https://github.com/folke/trouble.nvim                          | A pretty diagnostics list to help you solve all the trouble your code is causing.
  -- use "folke/lsp-colors.nvim"                       -- https://github.com/folke/lsp-colors.nvim                       | A plugin that adds missing LSP diagnostics highlight groups for color schemes that don't yet support the builtin LSP client.
  -- use "kosayoda/nvim-lightbulb"                     -- https://github.com/kosayoda/nvim-lightbulb                     | The plugin shows a lightbulb in the sign column whenever a <code>textDocument/codeAction</code> is available at the current cursor position.
  -- use "onsails/lspkind-nvim"                        -- https://github.com/onsails/lspkind-nvim                        | The plugin adds vscode-like icons to Neovim lsp completions.
  -- use "ojroques/nvim-lspfuzzy"                      -- https://github.com/ojroques/nvim-lspfuzzy                      | A small plugin to make the LSP client use FZF.
  -- use "gfanto/fzf-lsp.nvim"                         -- https://github.com/gfanto/fzf-lsp.nvim                         | Enable the power of fzf fuzzy search for the Neovim built in lsp.
  -- use "ray-x/lsp_signature.nvim"                    -- https://github.com/ray-x/lsp_signature.nvim                    | Lsp signature hint when you type.
  -- use "rmagatti/goto-preview"                       -- https://github.com/rmagatti/goto-preview                       | Previewing native LSP's goto definition calls in floating windows.
  -- use "nanotee/sqls.nvim"                           -- https://github.com/nanotee/sqls.nvim                           | Sqls (sql database connection plugin + LSP client) plugin for Neovim.
  -- use "jubnzv/virtual-types.nvim"                   -- https://github.com/jubnzv/virtual-types.nvim                   | Neovim plugin that shows type annotations as virtual text.
  -- use "jose-elias-alvarez/nvim-lsp-ts-utils"        -- https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils        | Utilities to improve the TypeScript development experience for Neovim's built-in LSP client.
  -- use "ray-x/navigator.lua"                         -- https://github.com/ray-x/navigator.lua                         | Learn existing code quickly and navigate code like a breeze. A swiss army knife makes exploring LSP and <g-emoji class="g-emoji" alias="evergreen_tree" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f332.png"><img class="emoji" alt="evergreen_tree" height="20" width="20" src="https://github.githubassets.com/images/icons/emoji/unicode/1f332.png"></g-emoji>Treesitter symbols a piece of <g-emoji class="g-emoji" alias="cake" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f370.png"><img class="emoji" alt="cake" height="20" width="20" src="https://github.githubassets.com/images/icons/emoji/unicode/1f370.png"></g-emoji>.
  -- use "liuchengxu/vista.vim"                        -- https://github.com/liuchengxu/vista.vim                        | List all functions and variables in a window of your current file.
  -- use "simrat39/symbols-outline.nvim"               -- https://github.com/simrat39/symbols-outline.nvim               | A tree like view for symbols in Neovim using the Language Server Protocol. Supports all your favourite languages.
     use "tamago324/nlsp-settings.nvim"                -- https://github.com/tamago324/nlsp-settings.nvim                | A plugin for setting Neovim LSP with JSON files.
  -- use "simrat39/rust-tools.nvim"                    -- https://github.com/simrat39/rust-tools.nvim                    | Tools for better development in rust using Neovim's builtin LSP.
  -- use "stevearc/aerial.nvim"                        -- https://github.com/stevearc/aerial.nvim                        | A code outline window for skimming and quick navigation.
     use "jose-elias-alvarez/null-ls.nvim"             -- https://github.com/jose-elias-alvarez/null-ls.nvim             | Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
  -- use "jakewvincent/texmagic.nvim"                  -- https://github.com/jakewvincent/texmagic.nvim                  | Enhance the lspconfig settings for Texlab by defining any number of custom LaTeX build engines and selecting them with magic comments.
  -- use "nanotee/nvim-lsp-basics"                     -- https://github.com/nanotee/nvim-lsp-basics                     | Basic wrappers for LSP features.
  -- use "weilbith/nvim-code-action-menu"              -- https://github.com/weilbith/nvim-code-action-menu              | A floating pop-up menu for code actions to show code action information and a diff preview.
  -- use "mfussenegger/nvim-lint"                      -- https://github.com/mfussenegger/nvim-lint                      | An asynchronous linter plugin for Neovim (                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        gt;= 0.5) complementary to the built-in Language Server Protocol support.
  -- use "b0o/SchemaStore.nvim"                        -- https://github.com/b0o/SchemaStore.nvim                        | A Neovim Lua plugin providing access to the <a href="https://github.com/SchemaStore/schemastore">SchemaStore</a> catalog.
  -- use "ldelossa/litee.nvim"                         -- https://github.com/ldelossa/litee.nvim                         | Neovim's missing IDE features.
-- LSP Installer
  -- use "anott03/nvim-lspinstall"                     -- https://github.com/anott03/nvim-lspinstall                     | Easy to install language servers.
  -- use "alexaandru/nvim-lspupdate"                   -- https://github.com/alexaandru/nvim-lspupdate                   | Updates installed (or auto installs if missing) LSP servers.
     use "williamboman/nvim-lsp-installer"             -- https://github.com/williamboman/nvim-lsp-installer             | Easily install more than 50+ LSP servers - with full Windows support.
-- Markdown
  -- use "ellisonleao/glow.nvim"                       -- https://github.com/ellisonleao/glow.nvim                       | Markdown preview using glow.
  -- use "davidgranstrom/nvim-markdown-preview"        -- https://github.com/davidgranstrom/nvim-markdown-preview        | Markdown preview in the browser using pandoc and live-server through Neovim's job-control API.
  -- use "jghauser/auto-pandoc.nvim"                   -- https://github.com/jghauser/auto-pandoc.nvim                   | Easy pandoc conversion leveraging yaml blocks.
  -- use "jghauser/follow-md-links.nvim"               -- https://github.com/jghauser/follow-md-links.nvim               | Press enter to follow internal markdown links.
  -- use "jakewvincent/mkdnflow.nvim"                  -- https://github.com/jakewvincent/mkdnflow.nvim                  | Markdown notebook navigation (follow internal and external markdown links, create links, jump to links, etc.)
  -- use "jubnzv/mdeval.nvim"                          -- https://github.com/jubnzv/mdeval.nvim                          | A Neovim plugin that evaluates code blocks inside markdown documents.
  -- use "mjlbach/babelfish.nvim"                      -- https://github.com/mjlbach/babelfish.nvim                      | A Neovim plugin to convert Markdown to vimdoc using Treesitter.
  -- use "kdheepak/panvimdoc"                          -- https://github.com/kdheepak/panvimdoc                          | A pandoc to vimdoc GitHub action.
-- Syntax
     use {
       "nvim-treesitter/nvim-treesitter",              -- https://github.com/nvim-treesitter/nvim-treesitter             | Neovim Treesitter configurations and abstraction layer.
       run = ":TSUpdate",
     }
  -- use "nvim-treesitter/nvim-treesitter-textobjects" -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects | Create your own textobjects using tree-sitter queries.
  -- use "RRethy/nvim-treesitter-textsubjects"         -- https://github.com/RRethy/nvim-treesitter-textsubjects         | Location and syntax aware text objects which <em>do what you mean</em>.
  -- use "blackCauldron7/surround.nvim"                -- https://github.com/blackCauldron7/surround.nvim                | A surround text object plugin for Neovim written in Lua.
  -- use "mini.surround"                               -- https://github.com/echasnovski/mini.nvim#minisurround          | Module of <a href="https://github.com/echasnovski/mini.nvim">echasnovski/mini.nvim</a> for working with text surroundings (add, delete, replace, find, highlight). Fully supports dot-repeat.
-- Terminal integration
  -- use "LoricAndre/OneTerm.nvim"                     -- https://github.com/LoricAndre/OneTerm.nvim                     | Plugin framework for running commands in the terminal.
  -- use "nikvdp/neomux"                               -- https://github.com/nikvdp/neomux                               | Control Neovim from shells running inside Neovim.
     use "akinsho/toggleterm.nvim"                     -- https://github.com/akinsho/toggleterm.nvim                     | A Neovim Lua plugin to help easily manage multiple terminal windows.
  -- use "norcalli/nvim-terminal.lua"                  -- https://github.com/norcalli/nvim-terminal.lua                  | A high performance filetype mode for Neovim which leverages conceal and highlights your buffer with the correct color codes.
  -- use "numToStr/FTerm.nvim"                         -- https://github.com/numToStr/FTerm.nvim                         | No nonsense floating terminal written in Lua.
  -- use "oberblastmeister/termwrapper.nvim"           -- https://github.com/oberblastmeister/termwrapper.nvim           | Wrapper for Neovim's terminal features to make them more user friendly.
  -- use "pianocomposer321/consolation.nvim"           -- https://github.com/pianocomposer321/consolation.nvim           | A general-purpose terminal wrapper and management plugin for Neovim, written in Lua.
  -- use "jghauser/kitty-runner.nvim"                  -- https://github.com/jghauser/kitty-runner.nvim                  | Poor man's REPL. Easily send buffer lines and commands to a kitty terminal.
  -- use "jlesquembre/nterm.nvim"                      -- https://github.com/jlesquembre/nterm.nvim                      | A Neovim plugin to interact with the terminal, with notifications.
  -- use "s1n7ax/nvim-terminal"                        -- https://github.com/s1n7ax/nvim-terminal                        | A simple                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            amp; easy to use multi-terminal plugin.
-- Snippets
  -- use "norcalli/snippets.nvim"                      -- https://github.com/norcalli/snippets.nvim                      | Snippets in Lua.
  -- use "hrsh7th/vim-vsnip"                           -- https://github.com/hrsh7th/vim-vsnip                           | Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.
  -- use "rafamadriz/friendly-snippets"                -- https://github.com/rafamadriz/friendly-snippets                | Snippets collection for all kind of programming languages that integrates really well with vim-vsnip.
  -- use "L3MON4D3/LuaSnip"                            -- https://github.com/L3MON4D3/LuaSnip                            | A snippet engine for Neovim written in Lua.
  -- use "dcampos/nvim-snippy"                         -- https://github.com/dcampos/nvim-snippy                         | Snippet plugin written in Lua with support for <a href="https://github.com/honza/vim-snippets">vim-snippets</a>.
-- Register
  -- use "gennaro-tedesco/nvim-peekup"                 -- https://github.com/gennaro-tedesco/nvim-peekup                 | Dynamically interact with vim registers.
  -- use "tversteeg/registers.nvim"                    -- https://github.com/tversteeg/registers.nvim                    | Non-obtrusive minimal preview of vim registers.
  -- use "acksld/nvim-neoclip.lua"                     -- https://github.com/AckslD/nvim-neoclip.lua                     | Clipboard manager Neovim plugin with telescope integration.
-- Marks
  -- use "chentau/marks.nvim"                          -- https://github.com/chentau/marks.nvim                          | A better user experience for viewing and interacting with vim marks.
-- Fuzzy Finder
     use "nvim-telescope/telescope.nvim"               -- https://github.com/nvim-telescope/telescope.nvim               | Telescope.nvim is a highly <a href="https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions">extendable</a> fuzzy finder over lists. Built on the latest awesome features from Neovim core. Telescope is centered around modularity, allowing for easy customization.
     use "nvim-telescope/telescope-media-files.nvim"   -- https://github.com/nvim-telescope/telescope-media-files.nvim  *|
  -- use "vijaymarupudi/nvim-fzf"                      -- https://github.com/vijaymarupudi/nvim-fzf                      | A Lua API for using fzf in <code>Neovim</code> (                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  gt;= 0.5). Allows for full asynchronicity for UI speed and usability.
  -- use "amirrezaask/fuzzy.nvim"                      -- https://github.com/amirrezaask/fuzzy.nvim                      | Fuzzy.nvim provides a simple mechanism and pipeline to create fuzzy matching in Neovim.
  -- use "camspiers/snap"                              -- https://github.com/camspiers/snap                              | An extensible fuzzy finder. Similar to Telescope, and optimized for performance, especially when grepping in large codebases.
  -- use "ibhagwan/fzf-lua"                            -- https://github.com/ibhagwan/fzf-lua                            | The Lua version of <code>fzf.vim</code>, high-performance and fully async, supports <code>nvim-web-devicons</code>, git indicators, LSP, quickfix/location lists and more. Also supports <a href="https://github.com/lotabout/skim"><code>skim</code></a> as its fzf binary.
  -- use "jvgrootveld/telescope-zoxide"                -- https://github.com/jvgrootveld/telescope-zoxide                | Telescope integration for <a href="https://github.com/ajeetdsouza/zoxide">zoxide</a>, a smart directory picker that tracks your usage.
  -- use "mini.fuzzy"                                  -- https://github.com/echasnovski/mini.nvim#minifuzzy             | Module of <a href="https://github.com/echasnovski/mini.nvim">echasnovski/mini.nvim</a> with functions to perform fuzzy matching of one string to others along with fast Telescope sorter.
-- Note Taking
  -- use "oberblastmeister/neuron.nvim"                -- https://github.com/oberblastmeister/neuron.nvim                | Note taking plugin for neuron that integrates with telescope.nvim.
     use "jbyuki/nabla.nvim"                           -- https://github.com/jbyuki/nabla.nvim                           | Take your scientific notes in Neovim.
  -- use "nvim-neorg/neorg"                            -- https://github.com/nvim-neorg/neorg                            | Modernity meets insane extensibility. The future of organizing your life in Neovim.
  -- use "nvim-orgmode/orgmode"                        -- https://github.com/nvim-orgmode/orgmode                        | Orgmode clone written in Lua for Neovim 0.5+.
  -- use "NFrid/due.nvim"                              -- https://github.com/NFrid/due.nvim                              | Displays due for a date string as a virtual text.
     use "jbyuki/venn.nvim"                            -- https://github.com/jbyuki/venn.nvim                            | Draw ASCII diagrams in Neovim.
  -- use "stevearc/gkeep.nvim"                         -- https://github.com/stevearc/gkeep.nvim                         | Google Keep integration for Neovim.
-- Color
  -- use "norcalli/nvim-colorizer.lua"                 -- https://github.com/norcalli/nvim-colorizer.lua                 | A high-performance color highlighter for Neovim which has no external dependencies!.
  -- use "sunjon/Shade.nvim"                           -- https://github.com/sunjon/Shade.nvim                           | Shade is a Neovim plugin that dims your inactive windows, making it easier to see the active window at a glance.
  -- use "winston0410/range-highlight.nvim"            -- https://github.com/winston0410/range-highlight.nvim            | An extremely lightweight plugin (~ 120loc) that highlights ranges you have entered in commandline.
  -- use "xiyaowong/nvim-transparent"                  -- https://github.com/xiyaowong/nvim-transparent                  | Make your Neovim transparent.
  -- use "folke/twilight.nvim"                         -- https://github.com/folke/twilight.nvim                         | Dim inactive portions of the code you're editing using TreeSitter.
-- Colorscheme Creation
  -- use "tjdevries/colorbuddy.nvim"                   -- https://github.com/tjdevries/colorbuddy.nvim                   | A colorscheme helper for Neovim. Written in Lua! Quick                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         amp; Easy Color Schemes <g-emoji class="g-emoji" alias="smile" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f604.png"><img class="emoji" alt="smile" height="20" width="20" src="https://github.githubassets.com/images/icons/emoji/unicode/1f604.png"></g-emoji>.
  -- use "norcalli/nvim-base16.lua"                    -- https://github.com/norcalli/nvim-base16.lua                    | Programmatic Lua library for setting base16 themes in Neovim.
  -- use "rktjmp/lush.nvim"                            -- https://github.com/rktjmp/lush.nvim                            | Define Neovim themes as a DSL in Lua, with real-time feedback.
  -- use "Iron-E/nvim-highlite"                        -- https://github.com/Iron-E/nvim-highlite                        | A colorscheme template that is "lite" on logic for the developer.
  -- use "mini.base16"                                 -- https://github.com/echasnovski/mini.nvim#minibase16            | Module of <a href="https://github.com/echasnovski/mini.nvim">echasnovski/mini.nvim</a> with fast implementation of base16 theme for manually supplied palette.
-- Colorscheme
     use "lunarvim/colorschemes"                       -- https://github.com/lunarvim/colorschemes                       | A bunch of colorschemes you can try out
     use "lunarvim/darkplus.nvim"                      -- https://github.com/lunarvim/darkplus.nvim                      | the darkplus theme from lunarvim
-- Tree-sitter Supported Colorscheme
  -- use "shaeinst/roshnivim-cs"                       -- https://github.com/shaeinst/roshnivim-cs                       | Colorscheme for Neovim written in Lua, specially made for roshnivim with Tree-sitter support.
  -- use "rafamadriz/neon"                             -- https://github.com/rafamadriz/neon                             | Customizable colorscheme with excellent italic and bold support, dark and light variants. Made to work and look good with Tree-sitter.
  -- use "tomasiser/vim-code-dark"                     -- https://github.com/tomasiser/vim-code-dark                     | A dark color scheme heavily inspired by the look of the Dark+ scheme of Visual Studio Code.
  -- use "Mofiqul/vscode.nvim"                         -- https://github.com/Mofiqul/vscode.nvim                         | A Lua port of vim-code-dark colorscheme for Neovim with vscode light and dark theme.
  -- use "marko-cerovac/material.nvim"                 -- https://github.com/marko-cerovac/material.nvim                 | Material.nvim is a highly configurable colorscheme written in Lua and based on the material palette.
  -- use "bluz71/vim-nightfly-guicolors"               -- https://github.com/bluz71/vim-nightfly-guicolors               | Nightfly is a dark GUI color scheme heavily inspired by Sarah Drasner's Night Owl theme.
  -- use "bluz71/vim-moonfly-colors"                   -- https://github.com/bluz71/vim-moonfly-colors                   | Moonfly is a dark color scheme with Tree-sitter support.
  -- use "ChristianChiarulli/nvcode-color-schemes.vim" -- https://github.com/ChristianChiarulli/nvcode-color-schemes.vim | Nvcode, onedark, nord colorschemes with Tree-sitter support.
     use "folke/tokyonight.nvim"                       -- https://github.com/folke/tokyonight.nvim                       | A clean, dark and light Neovim theme written in Lua, with support for LSP, Tree-sitter and lots of plugins.
  -- use "sainnhe/sonokai"                             -- https://github.com/sainnhe/sonokai                             | High Contrast                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            amp; Vivid Color Scheme based on Monokai Pro.
  -- use "kyazdani42/blue-moon"                        -- https://github.com/kyazdani42/blue-moon                        | A dark color scheme for Neovim derived from palenight and carbonight.
  -- use "mhartington/oceanic-next"                    -- https://github.com/mhartington/oceanic-next                    | Oceanic Next theme for Neovim.
  -- use "glepnir/zephyr-nvim"                         -- https://github.com/glepnir/zephyr-nvim                         | A dark colorscheme with Tree-sitter support.
  -- use "rockerBOO/boo-colorscheme-nvim"              -- https://github.com/rockerBOO/boo-colorscheme-nvim              | A colorscheme for Neovim with handcrafted support for LSP, Tree-sitter.
  -- use "jim-at-jibba/ariake-vim-colors"              -- https://github.com/jim-at-jibba/ariake-vim-colors              | A port of the great Atom theme. Dark and light with Tree-sitter support.
  -- use "Th3Whit3Wolf/onebuddy"                       -- https://github.com/Th3Whit3Wolf/onebuddy                       | Light and dark atom one theme.
  -- use "RishabhRD/nvim-rdark"                        -- https://github.com/RishabhRD/nvim-rdark                        | A dark colorscheme for Neovim written in Lua.
  -- use "ishan9299/modus-theme-vim"                   -- https://github.com/ishan9299/modus-theme-vim                   | This is a color scheme developed by Protesilaos Stavrou for emacs.
  -- use "sainnhe/edge"                                -- https://github.com/sainnhe/edge                                | Clean                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       amp; Elegant Color Scheme inspired by Atom One and Material.
  -- use "theniceboy/nvim-deus"                        -- https://github.com/theniceboy/nvim-deus                        | Vim-deus with Tree-sitter support.
  -- use "bkegley/gloombuddy"                          -- https://github.com/bkegley/gloombuddy                          | Gloom inspired theme for Neovim.
  -- use "Th3Whit3Wolf/one-nvim"                       -- https://github.com/Th3Whit3Wolf/one-nvim                       | An Atom One inspired dark and light colorscheme for Neovim.
  -- use "PHSix/nvim-hybrid"                           -- https://github.com/PHSix/nvim-hybrid                           | A Neovim colorscheme write in Lua.
  -- use "Th3Whit3Wolf/space-nvim"                     -- https://github.com/Th3Whit3Wolf/space-nvim                     | A spacemacs inspired dark and light colorscheme for Neovim.
  -- use "yonlu/omni.vim"                              -- https://github.com/yonlu/omni.vim                              | Omni color scheme for Vim.
  -- use "ray-x/aurora"                                -- https://github.com/ray-x/aurora                                | A 24-bit dark theme with Tree-sitter and LSP support.
  -- use "novakne/kosmikoa.nvim"                       -- https://github.com/novakne/kosmikoa.nvim                       | Colorscheme for Neovim.
     use "tanvirtin/monokai.nvim"                      -- https://github.com/tanvirtin/monokai.nvim                      | Monokai theme for Neovim written in Lua.
  -- use "nekonako/xresources-nvim"                    -- https://github.com/nekonako/xresources-nvim                    | Neovim colorscheme based on your xresources color.
  -- use "savq/melange"                                -- https://github.com/savq/melange                                | Dark color scheme for Neovim and Vim <g-emoji class="g-emoji" alias="dagger" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f5e1.png"><img class="emoji" alt="dagger" height="20" width="20" src="https://github.githubassets.com/images/icons/emoji/unicode/1f5e1.png"></g-emoji>.
  -- use "RRethy/nvim-base16"                          -- https://github.com/RRethy/nvim-base16                          | Neovim plugin for building base16 colorschemes. Includes support for Treesitter and LSP highlight groups.
  -- use "fenetikm/falcon"                             -- https://github.com/fenetikm/falcon                             | A colour scheme for terminals, Vim and friends.
  -- use "andersevenrud/nordic.nvim"                   -- https://github.com/andersevenrud/nordic.nvim                   | A nord-esque colorscheme.
  -- use "shaunsingh/nord.nvim"                        -- https://github.com/shaunsingh/nord.nvim                        | Neovim theme based off of the Nord Color Palette.
  -- use "MordechaiHadad/nvim-papadark"                -- https://github.com/MordechaiHadad/nvim-papadark                | My own Neovim colorscheme.
  -- use "ishan9299/nvim-solarized-lua"                -- https://github.com/ishan9299/nvim-solarized-lua                | Solarized colorscheme in Lua for Neovim 0.5.
  -- use "shaunsingh/moonlight.nvim"                   -- https://github.com/shaunsingh/moonlight.nvim                   | Port of VSCode's Moonlight colorscheme for NeoVim, written in Lua with built-in support for native LSP, Tree-sitter and many more plugins.
     use "navarasu/onedark.nvim"                       -- https://github.com/navarasu/onedark.nvim                       | A One Dark Theme for Neovim 0.5 written in Lua based on Atom's One Dark Theme.
  -- use "lourenci/github-colors"                      -- https://github.com/lourenci/github-colors                      | GitHub colors leveraging Tree-sitter to get 100% accuracy.
  -- use "sainnhe/gruvbox-material"                    -- https://github.com/sainnhe/gruvbox-material                    | Gruvbox modification with softer contrast and Tree-sitter support.
  -- use "sainnhe/everforest"                          -- https://github.com/sainnhe/everforest                          | A green based colorscheme designed to be warm, soft and easy on the eyes.
  -- use "NTBBloodbath/doom-one.nvim"                  -- https://github.com/NTBBloodbath/doom-one.nvim                  | Lua port of doom-emacs' doom-one for Neovim.
  -- use "dracula/vim"                                 -- https://github.com/dracula/vim                                 | Famous beautiful dark powered theme.
  -- use "yashguptaz/calvera-dark.nvim"                -- https://github.com/yashguptaz/calvera-dark.nvim                | A port of <a href="https://github.com/saurabhdaware/vscode-calvera-dark">VSCode Calvara Dark</a> Theme to Neovim with Tree-sitter and many other plugins support.
  -- use "nxvu699134/vn-night.nvim"                    -- https://github.com/nxvu699134/vn-night.nvim                    | A dark Neovim colorscheme written in Lua. Support built-in LSP and Tree-sitter.
  -- use "adisen99/codeschool.nvim"                    -- https://github.com/adisen99/codeschool.nvim                    | Codeschool colorscheme for Neovim written in Lua with Tree-sitter and built-in lsp support.
  -- use "projekt0n/github-nvim-theme"                 -- https://github.com/projekt0n/github-nvim-theme                 | A GitHub theme for Neovim, kitty, alacritty written in Lua. Support built-in LSP and Tree-sitter.
  -- use "kdheepak/monochrome.nvim"                    -- https://github.com/kdheepak/monochrome.nvim                    | A 16 bit monochrome colorscheme that uses hsluv for perceptually distinct gray colors, with support for Tree-sitter and other commonly used plugins.
  -- use "rose-pine/neovim"                            -- https://github.com/rose-pine/neovim                            | All natural pine, faux fur and a bit of soho vibes for the classy minimalist.
  -- use "mcchrish/zenbones.nvim"                      -- https://github.com/mcchrish/zenbones.nvim                      | A collection of vim/neovim colorschemes designed to highlight code using contrasts and font variations.
  -- use "catppuccin/nvim"                             -- https://github.com/catppuccin/nvim                             | Warm mid-tone dark theme to show off your vibrant self! with support for native LSP, Tree-sitter, and more <g-emoji class="g-emoji" alias="ice_cream" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f368.png"><img class="emoji" alt="ice_cream" height="20" width="20" src="https://github.githubassets.com/images/icons/emoji/unicode/1f368.png"></g-emoji>!
  -- use "FrenzyExists/aquarium-vim"                   -- https://github.com/FrenzyExists/aquarium-vim                   | A dark, yet vibrant colorscheme for Neovim.
  -- use "EdenEast/nightfox.nvim"                      -- https://github.com/EdenEast/nightfox.nvim                      | A soft dark, fully customizable Neovim theme, with support for lsp, treesitter and a variety of plugins.
  -- use "kvrohit/substrata.nvim"                      -- https://github.com/kvrohit/substrata.nvim                      | A cold, dark color scheme for Neovim written in Lua ported from <a href="https://github.com/arzg/vim-substrata">arzg/vim-substrata</a> theme.
  -- use "ldelossa/vimdark"                            -- https://github.com/ldelossa/vimdark                            | A minimal Vim theme for night time. Loosely based on vim-monotonic and chrome's dark reader extention. A light theme is included as well for the day time.
  -- use "mangeshrex/uwu.vim"                          -- https://github.com/Mangeshrex/uwu.vim                          | A beautiful and dark vim colorscheme written in vimscript.
  -- use "adisen99/apprentice.nvim"                    -- https://github.com/adisen99/apprentice.nvim                    | Colorscheme for Neovim written in Lua based on the <a href="https://github.com/romainl/Apprentice">Apprentice</a> color pattete with Tree-sitter and built-in lsp support.
  -- use "olimorris/onedarkpro.nvim"                   -- https://github.com/olimorris/onedarkpro.nvim                   | One Dark Pro theme for Neovim, written in Lua and based on the VS Code theme. Includes dark and light themes with completely customisable colors, styles and highlights.
  -- use "rmehri01/onenord.nvim"                       -- https://github.com/rmehri01/onenord.nvim                       | A Neovim theme that combines the Nord and Atom One Dark color palettes for a more vibrant programming experience.
  -- use "RishabhRD/gruvy"                             -- https://github.com/RishabhRD/gruvy                             | Gruvbuddy without colorbuddy using Lush.
  -- use "minischeme"                                  -- https://github.com/echasnovski/mini.nvim#plugin-colorscheme    | Color scheme of <a href="https://github.com/echasnovski/mini.nvim">echasnovski/mini.nvim</a> which is a variant of base16 with accent colors chosen according to optimal perceptual uniformity.
  -- use "luisiacc/gruvbox-baby"                       -- https://github.com/luisiacc/gruvbox-baby                       | A modern gruvbox theme with full treesitter support.
  -- use "titanzero/zephyrium"                         -- https://github.com/titanzero/zephyrium                         | A zephyr-esque theme, written in Lua, with TreeSitter support.
  --   -- Lua Colorscheme
  -- use "tjdevries/gruvbuddy.nvim"                    -- https://github.com/tjdevries/gruvbuddy.nvim                    | Gruvbox colors.
  -- use "ellisonleao/gruvbox.nvim"                    -- https://github.com/ellisonleao/gruvbox.nvim                    | Gruvbox community colorscheme Lua port.
  -- use "metalelf0/jellybeans-nvim"                   -- https://github.com/metalelf0/jellybeans-nvim                   | A port of jellybeans colorscheme for Neovim.
-- Utility
  -- use "famiu/bufdelete.nvim"                        -- https://github.com/famiu/bufdelete.nvim                        | Delete Neovim buffers without losing your window layout.
  -- use "mini.bufremove"                              -- https://github.com/echasnovski/mini.nvim#minibufremove         | Module of <a href="https://github.com/echasnovski/mini.nvim">echasnovski/mini.nvim</a> for buffer removing (unshow, delete, wipeout) while saving window layout.
  -- use "jghauser/mkdir.nvim"                         -- https://github.com/jghauser/mkdir.nvim                         | Automatically create missing directories when saving files.
  -- use "matbme/JABS.nvim"                            -- https://github.com/matbme/JABS.nvim                            | Pretty and minimal buffer switcher window.
  -- use "clojure-vim/jazz.nvim"                       -- https://github.com/clojure-vim/jazz.nvim                       | Acid + Impromptu = Jazz.
     use "sudormrfbin/cheatsheet.nvim"                 -- https://github.com/sudormrfbin/cheatsheet.nvim                 | Searchable cheatsheet.
  -- use "code-biscuits/nvim-biscuits"                 -- https://github.com/code-biscuits/nvim-biscuits                 | A Neovim port of Assorted Biscuits. Ends up with more supported languages too.
  -- use "Pocco81/AbbrevMan.nvim"                      -- https://github.com/Pocco81/AbbrevMan.nvim                      | A NeoVim plugin for managing vim abbreviations.
  -- use "kazhala/close-buffers.nvim"                  -- https://github.com/kazhala/close-buffers.nvim                  | Delete multiple vim buffers based on different conditions.
  -- use "rktjmp/paperplanes.nvim"                     -- https://github.com/rktjmp/paperplanes.nvim                     | Post selections or buffers to online paste bins.
  -- use "max397574/better-escape.nvim"                -- https://github.com/max397574/better-escape.nvim                | Create shortcuts to escape insert mode without getting delay.
     use "rcarriga/nvim-notify"                        -- https://github.com/rcarriga/nvim-notify                        | A fancy, configurable, notification manager for NeoVim.
  -- use "saifulapm/chartoggle.nvim"                   -- https://github.com/saifulapm/chartoggle.nvim                   | Toggle any character at end of line for Neovim.
  -- use "stevearc/dressing.nvim"                      -- https://github.com/stevearc/dressing.nvim                      | Improve the built-in <code>vim.ui</code> interfaces with telescope, fzf, etc.
-- Icon
     use "kyazdani42/nvim-web-devicons"                -- https://github.com/kyazdani42/nvim-web-devicons                | A Lua fork of <a href="https://github.com/ryanoasis/vim-devicons">vim-devicons</a>.
  -- use "yamatsum/nvim-nonicons"                      -- https://github.com/yamatsum/nvim-nonicons                      | Collection of configurations for nvim-web-devicons.
-- Debugging
  -- use "mfussenegger/nvim-dap"                       -- https://github.com/mfussenegger/nvim-dap                       | Debug Adapter Protocol client implementation for Neovim.
  -- use "sakhnik/nvim-gdb"                            -- https://github.com/sakhnik/nvim-gdb                            | Thin wrapper for GDB, LLDB, PDB/PDB++ and BashDB.
  -- use "rcarriga/nvim-dap-ui"                        -- https://github.com/rcarriga/nvim-dap-ui                        | A UI for nvim-dap.
  -- use "Pocco81/DAPInstall.nvim"                     -- https://github.com/Pocco81/DAPInstall.nvim                     | A NeoVim plugin for managing several debuggers for Nvim-dap.
-- Spellcheck
  -- use "lewis6991/spellsitter.nvim"                  -- https://github.com/lewis6991/spellsitter.nvim                  | Enable Neovim's spell checker with tree-sitter.
-- Neovim Lua Development
  -- use "tjdevries/nlua.nvim"                         -- https://github.com/tjdevries/nlua.nvim                         | Lua Development for Neovim.
  -- use "svermeulen/vimpeccable"                      -- https://github.com/svermeulen/vimpeccable                      | Commands to help write your .vimrc in Lua or any Lua based language.
  -- use "nanotee/nvim-lua-guide"                      -- https://github.com/nanotee/nvim-lua-guide                      | A guide to using Lua in Neovim.
  -- use "rafcamlet/nvim-luapad"                       -- https://github.com/rafcamlet/nvim-luapad                       | Interactive real time Neovim scratchpad for embedded Lua engine - Type and watch!.
  -- use "nvim-lua/plenary.nvim"                       -- https://github.com/nvim-lua/plenary.nvim                       | Plenary: full; complete; entire; absolute; unqualified. All the Lua functions I don't want to write twice.
  -- use "nvim-lua/popup.nvim"                         -- https://github.com/nvim-lua/popup.nvim                         | An implementation of the Popup API from vim in Neovim.
  -- use "tjdevries/vlog.nvim"                         -- https://github.com/tjdevries/vlog.nvim                         | Single file, no dependency, easy copy                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                amp; paste log file to add to your Neovim Lua plugins.
  -- use "bfredl/nvim-luadev"                          -- https://github.com/bfredl/nvim-luadev                          | REPL/debug console for Neovim Lua plugins. The <code>:Luadev</code> command will open an scratch window which will show output from executing Lua code.
  -- use "jbyuki/one-small-step-for-vimkind"           -- https://github.com/jbyuki/one-small-step-for-vimkind           | An adapter for the Neovim Lua language. It allows you to debug any Lua code running in a Neovim instance (A Lua plugin that can debug Neovim Lua plugins).
  -- use "tami5/sqlite.lua"                            -- https://github.com/tami5/sqlite.lua                            | SQLite/LuaJIT binding for Lua and Neovim.
  -- use "folke/lua-dev.nvim"                          -- https://github.com/folke/lua-dev.nvim                          | Dev setup for init.Lua and plugin development with full signature help, docs and completion for the Neovim Lua API.
  -- use "MunifTanjim/nui.nvim"                        -- https://github.com/MunifTanjim/nui.nvim                        | UI Component Library for Neovim.
  -- use "m00qek/plugin-template.nvim"                 -- https://github.com/m00qek/plugin-template.nvim                 | A plugin template that setups test infrastructure and GitHub Actions.
-- Fennel
  -- use "Olical/aniseed"                              -- https://github.com/Olical/aniseed                              | Configure and extend Neovim with Fennel (Lisp to Lua).
  -- use "rktjmp/hotpot.nvim"                          -- https://github.com/rktjmp/hotpot.nvim                          | Seamless, transparent Fennel inside Neovim.
-- Tabline
  -- use "romgrk/barbar.nvim"                          -- https://github.com/romgrk/barbar.nvim                          | The Neovim tabline plugin.
     use "akinsho/bufferline.nvim"                     -- https://github.com/akinsho/bufferline.nvim                     | A snazzy buffer line for Neovim built using Lua.
  -- use "crispgm/nvim-tabline"                        -- https://github.com/crispgm/nvim-tabline                        | Neovim port of tabline.vim with Lua.
  -- use "alvarosevilla95/luatab.nvim"                 -- https://github.com/alvarosevilla95/luatab.nvim                 | A simple tabline written in Lua.
  -- use "johann2357/nvim-smartbufs"                   -- https://github.com/johann2357/nvim-smartbufs                   | Smart buffer management in Neovim.
  -- use "kdheepak/tabline.nvim"                       -- https://github.com/kdheepak/tabline.nvim                       | A "buffer and tab" tabline.
  -- use "noib3/cokeline.nvim"                         -- https://github.com/noib3/cokeline.nvim                         | A Neovim bufferline for people with addictive personalities.
  -- use "mini.tabline"                                -- https://github.com/echasnovski/mini.nvim#minitabline           | Module of <a href="https://github.com/echasnovski/mini.nvim">echasnovski/mini.nvim</a> for minimal tabline showing listed buffers in case of one tab and falling back to default otherwise.
  -- use "rafcamlet/tabline-framework.nvim"            -- https://github.com/rafcamlet/tabline-framework.nvim            | User-friendly framework for building your dream tabline in a few lines of code.
-- Statusline
  -- use "NTBBloodbath/galaxyline.nvim"                -- https://github.com/NTBBloodbath/galaxyline.nvim                | Galaxyline componentizes Vim's statusline by having a provider for each text area. This means you can use the api provided by galaxyline to create the statusline that you want, easily.
  -- use "tjdevries/express_line.nvim"                 -- https://github.com/tjdevries/express_line.nvim                 | Supports co-routines, functions and jobs.
     use "nvim-lualine/lualine.nvim"                   -- https://github.com/nvim-lualine/lualine.nvim                   | A blazing fast and easy to configure Neovim statusline.
  -- use "adelarsq/neoline.vim"                        -- https://github.com/adelarsq/neoline.vim                        | A light statusline/tabline plugin for Neovim using Lua.
  -- use "ojroques/nvim-hardline"                      -- https://github.com/ojroques/nvim-hardline                      | A statusline / bufferline. It is inspired by <a href="https://github.com/vim-airline/vim-airline">vim-airline</a> but aims to be as light and simple as possible.
  -- use "datwaft/bubbly.nvim"                         -- https://github.com/datwaft/bubbly.nvim                         | Bubbly status line for Neovim.
  -- use "beauwilliams/statusline.lua"                 -- https://github.com/beauwilliams/statusline.lua                 | A zero-config minimal statusline for Neovim written in Lua featuring awesome integrations and blazing speed!
  -- use "tamton-aquib/staline.nvim"                   -- https://github.com/tamton-aquib/staline.nvim                   | A modern lightweight statusline for Neovim in Lua. Mainly uses unicode symbols for showing info.
  -- use "Famiu/feline.nvim"                           -- https://github.com/Famiu/feline.nvim                           | A minimal, stylish and customizable statusline for Neovim written in Lua.
  -- use "windwp/windline.nvim"                        -- https://github.com/windwp/windline.nvim                        | The next generation statusline for Neovim. Animation statusline.
  -- use "konapun/vacuumline.nvim"                     -- https://github.com/konapun/vacuumline.nvim                     | A galaxyline configuration inspired by airline.
  -- use "mini.statusline"                             -- https://github.com/echasnovski/mini.nvim#ministatusline        | Module of <a href="https://github.com/echasnovski/mini.nvim">echasnovski/mini.nvim</a> for minimal and fast statusline. Supports content change depending on window width.
-- Statusline component
  -- use "SmiteshP/nvim-gps"                           -- https://github.com/SmiteshP/nvim-gps                           | Simple statusline component that shows what scope you are working inside.
-- Cursorline
  -- use "yamatsum/nvim-cursorline"                    -- https://github.com/yamatsum/nvim-cursorline                    | A plugin for Neovim that highlights cursor words and lines.
  -- use "xiyaowong/nvim-cursorword"                   -- https://github.com/xiyaowong/nvim-cursorword                   | Part of nvim-cursorline. Highlight the word under the cursor.
  -- use "RRethy/vim-illuminate"                       -- https://github.com/RRethy/vim-illuminate                       | Highlight the word under the cursor. Neovim's builtin LSP is available, it can be used to highlight more intelligently.
  -- use "mini.cursorword"                             -- https://github.com/echasnovski/mini.nvim#minicursorword        | Module of <a href="https://github.com/echasnovski/mini.nvim">echasnovski/mini.nvim</a> for automatic highlighting of word under cursor (displayed after customizable delay).
-- Startup
  -- use "glepnir/dashboard-nvim"                      -- https://github.com/glepnir/dashboard-nvim                      | A minimalist dashboard for Neovim, inspired by doom-emacs.
     use "goolord/alpha-nvim"                          -- https://github.com/goolord/alpha-nvim                          | A fast and highly customizable greeter like <a href="https://github.com/mhinz/vim-startify">vim-startify</a>/dashboard-nvim for Neovim.
  -- use "mini.starter"                                -- https://github.com/echasnovski/mini.nvim#ministarter           | Module of <a href="https://github.com/echasnovski/mini.nvim">echasnovski/mini.nvim</a> for start screen. Displayed items are fully customizable, item selection can be done using prefix query with instant visual feedback.
  -- use "henriquehbr/nvim-startup.lua"                -- https://github.com/henriquehbr/nvim-startup.lua                | Displays Neovim startup time.
  -- use "startup-nvim/startup.nvim"                   -- https://github.com/startup-nvim/startup.nvim                   | The fully customizable greeter for neovim.
-- Indent
  -- use "glepnir/indent-guides.nvim"                  -- https://github.com/glepnir/indent-guides.nvim                  | Indent plugin.
     use "lukas-reineke/indent-blankline.nvim"         -- https://github.com/lukas-reineke/indent-blankline.nvim         | IndentLine replacement in Lua with more features and treesitter support.
-- Game
  -- use "ThePrimeagen/vim-be-good"                    -- https://github.com/ThePrimeagen/vim-be-good                    | Vim-be-good is a Neovim plugin designed to make you better at Vim Movements.
  -- use "ThePrimeagen/vim-apm"                        -- https://github.com/ThePrimeagen/vim-apm                        | Vim APM, Actions per minute, is the greatest plugin since vim-slicedbread.
     use "alec-gibson/nvim-tetris"                     -- https://github.com/alec-gibson/nvim-tetris                     | Bringing emacs' greatest feature to Neovim - Tetris!.
     use "seandewar/nvimesweeper"                      -- https://github.com/seandewar/nvimesweeper                      | Play Minesweeper in your favourite text editor.
-- File explorer
     use "kyazdani42/nvim-tree.lua"                    -- https://github.com/kyazdani42/nvim-tree.lua                    | A simple and fast file explorer tree for Neovim !.
  -- use "luukvbaal/nnn.nvim"                          -- https://github.com/luukvbaal/nnn.nvim                          | File explorer powered by <a href="https://github.com/jarun/nnn">nnn</a> and Lua.
  -- use "tamago324/lir.nvim"                          -- https://github.com/tamago324/lir.nvim                          | Simple file explorer.
  -- use "TimUntersberger/neofs"                       -- https://github.com/TimUntersberger/neofs                       | A file manager for Neovim written in Lua.
  -- use "kevinhwang91/rnvimr"                         -- https://github.com/kevinhwang91/rnvimr                         | A simple yet amazing file explorer for Neovim.
  -- use "Xuyuanp/yanil"                               -- https://github.com/Xuyuanp/yanil                               | Yet Another Nerdtree In Lua.
  -- use "ms-jpq/chadtree"                             -- https://github.com/ms-jpq/chadtree                             | File manager for Neovim. Better than NERDTree.
  -- use "is0n/fm-nvim"                                -- https://github.com/is0n/fm-nvim                                | Neovim plugin that lets you use your favorite terminal file managers (and fuzzy finders) from within Neovim.
-- Dependency management
  -- use "akinsho/dependency-assist.nvim"              -- https://github.com/akinsho/dependency-assist.nvim              | Search for and add new dependencies (dart, for now but rust coming soon).
  -- use "vuki656/package-info.nvim"                   -- https://github.com/vuki656/package-info.nvim                   | Display latest package version as virtual text in package.json.
-- Git
  -- use "f-person/git-blame.nvim"                     -- https://github.com/f-person/git-blame.nvim                     | Show git blame info.
     use "lewis6991/gitsigns.nvim"                     -- https://github.com/lewis6991/gitsigns.nvim                     | Git integration: signs, hunk actions, blame, etc.
  -- use "TimUntersberger/neogit"                      -- https://github.com/TimUntersberger/neogit                      | A Magit clone for Neovim that may change some things to fit the Vim philosophy.
  -- use "tveskag/nvim-blame-line"                     -- https://github.com/tveskag/nvim-blame-line                     | A small plugin that uses neovims virtual text to print git blame info at the end of the current line.
  -- use "ruifm/gitlinker.nvim"                        -- https://github.com/ruifm/gitlinker.nvim                        | Generate shareable file permalinks for several git hosts. Inspired by tpope/vim-fugitive's :GBrowse.
  -- use "tanvirtin/vgit.nvim"                         -- https://github.com/tanvirtin/vgit.nvim                         | Visual Git Plugin for Neovim to enhance your git experience.
  -- use "sindrets/diffview.nvim"                      -- https://github.com/sindrets/diffview.nvim                      | Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
     use "kdheepak/lazygit.nvim"                       -- https://github.com/kdheepak/lazygit.nvim                       | Plugin for calling lazygit from within Neovim.
-- Programming languages support
  -- use "go.nvim"                                     -- https://github.com/ray-x/go.nvim                               | Golang plugin based on lsp and Treesitter.
  -- use "akinsho/flutter-tools.nvim"                  -- https://github.com/akinsho/flutter-tools.nvim                  | Build flutter and dart applications in Neovim using the native lsp.
  -- use "crispgm/nvim-go"                             -- https://github.com/crispgm/nvim-go                             | A minimal implementation of Golang development plugin for Neovim.
  -- use "gennaro-tedesco/nvim-jqx"                    -- https://github.com/gennaro-tedesco/nvim-jqx                    | Interactive interface for json files.
  -- use "edolphin-ydf/goimpl.nvim"                    -- https://github.com/edolphin-ydf/goimpl.nvim                    | Generate interface stubs for a type.
  -- use "lean.nvim"                                   -- https://github.com/Julian/lean.nvim                            | Neovim support for the <a href="https://leanprover.github.io/" rel="nofollow">Lean Theorem Prover</a>.
  -- use "rafaelsq/nvim-goc.lua"                       -- https://github.com/rafaelsq/nvim-goc.lua                       | Highlight your buffer with Golang Code Coverage.
-- Comment
     use "numToStr/Comment.nvim"                       -- https://github.com/numToStr/Comment.nvim                       | Smart and Powerful comment plugin for Neovim. Supports commentstring, motions, dot-repeat and more.
  -- use "b3nj5m1n/kommentary"                         -- https://github.com/b3nj5m1n/kommentary                         | Commenting plugin written in Lua.
  -- use "glepnir/prodoc.nvim"                         -- https://github.com/glepnir/prodoc.nvim                         | Comment and support generate annotation.
  -- use "gennaro-tedesco/nvim-commaround"             -- https://github.com/gennaro-tedesco/nvim-commaround             | Fast and light commenting plugin written in Lua.
  -- use "folke/todo-comments.nvim"                    -- https://github.com/folke/todo-comments.nvim                    | Highlight, list and search todo comments in your projects.
  -- use "terrortylor/nvim-comment"                    -- https://github.com/terrortylor/nvim-comment                    | Toggle comments in Neovim using the built-in commentstring option.
  -- use "winston0410/commented.nvim"                  -- https://github.com/winston0410/commented.nvim                  | A commenting plugin that supports counts and multiple comment patterns and much more.
  -- use "s1n7ax/nvim-comment-frame"                   -- https://github.com/s1n7ax/nvim-comment-frame                   | Adds a comment frame based on the source file.
  -- use "danymat/neogen"                              -- https://github.com/danymat/neogen                              | A better annotation generator. Supports multiple languages and annotation conventions.
  -- use "mini.comment"                                -- https://github.com/echasnovski/mini.nvim#minicomment           | Module of <a href="https://github.com/echasnovski/mini.nvim">echasnovski/mini.nvim</a> for per-line commenting. Fully supports dot-repeat.
-- Collaborative Editing
  -- use "jbyuki/instant.nvim"                         -- https://github.com/jbyuki/instant.nvim                         | A collaborative editing plugin for Neovim written in Lua with no dependencies.
-- Quickfix
  -- use "kevinhwang91/nvim-bqf"                       -- https://github.com/kevinhwang91/nvim-bqf                       | The goal of nvim-bqf is to make Neovim's quickfix window better.
  -- use "gitlab.com/yorickpeterse/nvim-pqf"           -- https://gitlab.com/yorickpeterse/nvim-pqf                      | Prettier quickfix/location list windows for Neovim.
  -- use "stevearc/qf_helper.nvim"                     -- https://github.com/stevearc/qf_helper.nvim                     | A collection of improvements for Neovim quickfix.
-- Motion
  -- use "tjdevries/train.nvim"                        -- https://github.com/tjdevries/train.nvim                        | Train yourself with vim motions and make your own train tracks.
  -- use "phaazon/hop.nvim"                            -- https://github.com/phaazon/hop.nvim                            | Hop is an EasyMotion-like plugin allowing you to jump anywhere in a document with as few keystrokes as possible.
  -- use "ggandor/lightspeed.nvim"                     -- https://github.com/ggandor/lightspeed.nvim                     | A Sneak-like plugin offering unparalleled navigation speed via ahead-of-time displayed labels, that eliminate the pause between entering the search pattern and selecting the target.
  -- use "mini.jump"                                   -- https://github.com/echasnovski/mini.nvim#minijump              | Module of <a href="https://github.com/echasnovski/mini.nvim">echasnovski/mini.nvim</a> for smarter jumping to a single character.
  -- use "mfussenegger/nvim-ts-hint-textobject"        -- https://github.com/mfussenegger/nvim-ts-hint-textobject        | Region selection with hints on the AST nodes of a document powered by treesitter.
-- Code Runner
  -- use "michaelb/sniprun"                            -- https://github.com/michaelb/sniprun                            | Run parts of code of any language directly from Neovim.
  -- use "pianocomposer321/yabs.nvim"                  -- https://github.com/pianocomposer321/yabs.nvim                  | Yet Another Build System for Neovim, written in Lua.
  -- use "CRAG666/code_runner.nvim"                    -- https://github.com/CRAG666/code_runner.nvim                    | The best code runner you could have, with super powers.
  -- use "is0n/jaq-nvim"                               -- https://github.com/is0n/jaq-nvim                               | Just Another Quickrun Plugin for Neovim in Lua.
-- GitHub
  -- use "pwntester/octo.nvim"                         -- https://github.com/pwntester/octo.nvim                         | Work with GitHub issues and PRs from Neovim. Just edit the issue description.
  -- use "pwntester/codeql.nvim"                       -- https://github.com/pwntester/codeql.nvim                       | Neovim plugin to help writing and testing CodeQL queries.
-- Search
  -- use "kevinhwang91/nvim-hlslens"                   -- https://github.com/kevinhwang91/nvim-hlslens                   | Helps you better glance searched information, seamlessly jump matched instances.
  -- use "rktjmp/highlight-current-n.nivm"             -- https://github.com/rktjmp/highlight-current-n.nvim             | Highlights the current /, ? or * match under your cursor when pressing n or N and gets out of the way afterwards.
-- Scrollbar
  -- use "Xuyuanp/scrollbar.nvim"                      -- https://github.com/Xuyuanp/scrollbar.nvim                      | Scrollbar for Neovim.
  -- use "dstein64/nvim-scrollview"                    -- https://github.com/dstein64/nvim-scrollview                    | A Neovim plugin that displays interactive scrollbars.
-- Scrolling
  -- use "karb94/neoscroll.nvim"                       -- https://github.com/karb94/neoscroll.nvim                       | Smooth scrolling for Neovim.
-- Mouse
  -- use "notomo/gesture.nvim"                         -- https://github.com/notomo/gesture.nvim                         | Mouse gesture plugin for Neovim.
-- Project
  -- use "windwp/nvim-projectconfig"                   -- https://github.com/windwp/nvim-projectconfig                   | Load Neovim config depend on project directory.
  -- use "windwp/nvim-spectre"                         -- https://github.com/windwp/nvim-spectre                         | Search and replace panel for Neovim.
     use "ahmedkhalf/project.nvim"                     -- https://github.com/ahmedkhalf/project.nvim                     | An all in one Neovim plugin that provides superior project management.
  -- use "klen/nvim-config-local"                      -- https://github.com/klen/nvim-config-local                      | Secure load local config files from working directories.
-- Browser integration
  -- use "glacambre/firenvim"                          -- https://github.com/glacambre/firenvim                          | Embed Neovim right into your browser, no questions asked.
-- Editing support
  -- use "windwp/nvim-ts-autotag"                      -- https://github.com/windwp/nvim-ts-autotag                      | Use treesitter to autoclose and autorename xml,html,jsx tag.
     use "windwp/nvim-autopairs"                       -- https://github.com/windwp/nvim-autopairs                       | A minimalist autopairs for Neovim written by Lua.
  -- use "steelsojka/pears.nvim"                       -- https://github.com/steelsojka/pears.nvim                       | Auto pair plugin for Neovim.
  -- use "mini.pairs"                                  -- https://github.com/echasnovski/mini.nvim#minipairs             | Module of <a href="https://github.com/echasnovski/mini.nvim">echasnovski/mini.nvim</a> for autopairs which has minimal defaults and functionality to do per-key mapping.
  -- use "monaqa/dial.nvim"                            -- https://github.com/monaqa/dial.nvim                            | Extended increment/decrement.
  -- use "p00f/nvim-ts-rainbow"                        -- https://github.com/p00f/nvim-ts-rainbow                        | Rainbow <g-emoji class="g-emoji" alias="rainbow" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f308.png"><img class="emoji" alt="rainbow" height="20" width="20" src="https://github.githubassets.com/images/icons/emoji/unicode/1f308.png"></g-emoji> parentheses for Neovim using tree-sitter <g-emoji class="g-emoji" alias="rainbow" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f308.png"><img class="emoji" alt="rainbow" height="20" width="20" src="https://github.githubassets.com/images/icons/emoji/unicode/1f308.png"></g-emoji>.
  -- use "AckslD/nvim-revJ.lua"                        -- https://github.com/AckslD/nvim-revJ.lua                        | Neovim Lua plugin for doing the opposite of join-line (J) for arguments.
  -- use "edluffy/specs.nvim"                          -- https://github.com/edluffy/specs.nvim                          | A fast and lightweight Neovim Lua plugin to keep an eye on where your cursor has jumped.
     use "JoosepAlviste/nvim-ts-context-commentstring" -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring | A Neovim plugin for setting the <code>commentstring</code> option based on the cursor location in the file. The location is checked via treesitter queries.
  -- use "Pocco81/TrueZen.nvim"                        -- https://github.com/Pocco81/TrueZen.nvim                        | Clean and elegant distraction-free writing for NeoVim.
  -- use "Pocco81/HighStr.nvim"                        -- https://github.com/Pocco81/HighStr.nvim                        | A NeoVim plugin for highlighting visual selections like in a normal document editor!
  -- use "Pocco81/AutoSave.nvim"                       -- https://github.com/Pocco81/AutoSave.nvim                       | A NeoVim plugin for saving your work before the world collapses or you type :qa!
  -- use "folke/zen-mode.nvim"                         -- https://github.com/folke/zen-mode.nvim                         | Distraction-free coding for Neovim.
  -- use "haringsrob/nvim_context_vt"                  -- https://github.com/haringsrob/nvim_context_vt                  | Shows virtual text of the current context.
  -- use "romgrk/nvim-treesitter-context"              -- https://github.com/romgrk/nvim-treesitter-context              | Shows floating hover with the current function/block context.
  -- use "mizlan/iswap.nvim"                           -- https://github.com/mizlan/iswap.nvim                           | Interactively select and swap function arguments, list elements, and more. Powered by tree-sitter.
  -- use "nacro90/numb.nvim"                           -- https://github.com/nacro90/numb.nvim                           | Peek lines in a non-obtrusive way.
  -- use "abecodes/tabout.nvim"                        -- https://github.com/abecodes/tabout.nvim                        | Jump out of brackets, quotes, objects, etc.
  -- use "ethanholz/nvim-lastplace"                    -- https://github.com/ethanholz/nvim-lastplace                    | Reopen files at your last edit position.
  -- use "Allendang/nvim-expand-expr"                  -- https://github.com/AllenDang/nvim-expand-expr                  | Expand and repeat expression to multiple lines.
  -- use "h-hg/fcitx.nvim"                             -- https://github.com/h-hg/fcitx.nvim                             | Switching and restoring fcitx state for each buffer seperately.
  -- use "McAuleyPenney/tidy.nvim"                     -- https://github.com/McAuleyPenney/tidy.nvim                     | Clear trailing whitespace and empty lines at end of file on every save.
  -- use "mini.trailspace"                             -- https://github.com/echasnovski/mini.nvim#minitrailspace        | Module of <a href="https://github.com/echasnovski/mini.nvim">echasnovski/mini.nvim</a> for automatic highlighting of trailing whitespace with functionality to remove it.
  -- use "filipdutescu/renamer.nvim"                   -- https://github.com/filipdutescu/renamer.nvim                   | VS Code-like renaming UI for Neovim, writen in Lua.
  -- use "gbprod/cutlass.nvim"                         -- https://github.com/gbprod/cutlass.nvim                         | Plugin that adds a 'cut' operation separate from 'delete'.
  -- use "gbprod/substitute.nvim"                      -- https://github.com/gbprod/substitute.nvim                      | Neovim plugin introducing a new operator motions to quickly replace text.
  -- use "sQVe/sort.nvim"                              -- https://github.com/sQVe/sort.nvim                              | Sorting plugin that intelligently supports line-wise and delimiter sorting.
-- Formatting
  -- use "mhartington/formatter.nvim"                  -- https://github.com/mhartington/formatter.nvim                  | A format runner for Neovim written in Lua.
  -- use "lukas-reineke/format.nvim"                   -- https://github.com/lukas-reineke/format.nvim                   | Fast asynchronous formatting for Neovim. Supports formatting embedded code blocks.
  -- use "sbdchd/neoformat"                            -- https://github.com/sbdchd/neoformat                            | A (Neo)vim plugin for formatting code.
-- Web development
  -- use "NTBBloodbath/rest.nvim"                      -- https://github.com/NTBBloodbath/rest.nvim                      | A fast Neovim http client written in Lua.
-- Media
  -- use "ekickx/clipboard-image.nvim"                 -- https://github.com/ekickx/clipboard-image.nvim                 | Neovim Lua plugin to paste image from clipboard.
  -- use "gwatcha/reaper-keys"                         -- https://github.com/gwatcha/reaper-keys                         | Modal keybindings for Reaper DAW.
  -- use "madskjeldgaard/reaper-nvim"                  -- https://github.com/madskjeldgaard/reaper-nvim                  | Remote control Reaper DAW from Neovim.
  -- use "davidgranstrom/scnvim"                       -- https://github.com/davidgranstrom/scnvim                       | Neovim frontend for SuperCollider.
-- Discord Rich Presence
  -- use "andweeb/presence.nvim"                       -- https://github.com/andweeb/presence.nvim                       | Fast and lite Discord Rich Presence plugin for Neovim written in Lua.
-- Command Line
     use "notomo/cmdbuf.nvim"                          -- https://github.com/notomo/cmdbuf.nvim                          | Alternative command-line-window plugin.
  -- use "gelguy/wilder.nvim"                          -- https://github.com/gelguy/wilder.nvim                          | A plugin for fuzzy command line autocompletion.
-- Session
  -- use "rmagatti/auto-session"                       -- https://github.com/rmagatti/auto-session                       | A small automated session manager for Neovim.
  -- use "mini.sessions"                               -- https://github.com/echasnovski/mini.nvim#minisessions          | Module of <a href="https://github.com/echasnovski/mini.nvim">echasnovski/mini.nvim</a> for session management (read, write, delete).
-- Test
  -- use "rcarriga/vim-ultest"                         -- https://github.com/rcarriga/vim-ultest                         | The ultimate testing plugin for NeoVim.
  -- use "David-Kunz/jester"                           -- https://github.com/David-Kunz/jester                           | A Neovim plugin to easily run and debug Jest tests.
-- Preconfigured Configuration
  -- use "CosmicNvim/CosmicNvim"                       -- https://github.com/CosmicNvim/CosmicNvim                       | CosmicNvim is a lightweight and opinionated Neovim config for web development, specifically designed to provide a <g-emoji class="g-emoji" alias="dizzy" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f4ab.png"><img class="emoji" alt="dizzy" height="20" width="20" src="https://github.githubassets.com/images/icons/emoji/unicode/1f4ab.png"></g-emoji> COSMIC programming experience!
  -- use "artart222/CodeArt"                           -- https://github.com/artart222/CodeArt                           | A fast general-purpose IDE written entirely in Lua with an installer for Linux/Windows/macOS and built in <code>:CodeArtUpdate</code> command for updating it.
  -- use "NTBBloodbath/doom-nvim"                      -- https://github.com/NTBBloodbath/doom-nvim                      | Port of the doom-emacs framework, its goal is to add useful functions to Neovim to start working in a stable and efficient development environment without spending a lot of time configuring everything.
  -- use "crivotz/nv-ide"                              -- https://github.com/crivotz/nv-ide                              | Neovim custom configuration, oriented for full stack developers (rails, ruby, php, html, css, SCSS, JavaScript).
  -- use "ChristianChiarulli/LunarVim"                 -- https://github.com/ChristianChiarulli/LunarVim                 | This project aims to help one transition away from VSCode, and into a superior text editing experience.
  -- use "hackorum/VapourNvim"                         -- https://github.com/hackorum/VapourNvim                         | A NeoVim config for THE ULTIMATE vim IDE-like experience.
  -- use "vi-tality/neovitality"                       -- https://github.com/vi-tality/neovitality                       | A full-featured NeoVim distribution, packaged with Nix Flake for easy installation and reproducibility.
  -- use "siduck76/NvChad"                             -- https://github.com/siduck76/NvChad                             | An attempt to make Neovim cli as functional as an IDE while being very beautiful and less bloated.
  -- use "ashincoder/StarVim"                          -- https://github.com/ashincoder/StarVim                          | A IDE wrapper which is beyond the moon <g-emoji class="g-emoji" alias="full_moon_with_face" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f31d.png"><img class="emoji" alt="full_moon_with_face" height="20" width="20" src="https://github.githubassets.com/images/icons/emoji/unicode/1f31d.png"></g-emoji> and above the stars <g-emoji class="g-emoji" alias="star" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2b50.png"><img class="emoji" alt="star" height="20" width="20" src="https://github.githubassets.com/images/icons/emoji/unicode/2b50.png"></g-emoji>.
  -- use "mjlbach/defaults.nvim"                       -- https://github.com/mjlbach/defaults.nvim                       | An extremely small, single file, and commented configuration template demonstrating LSP integration, autocompletion, snippets, treesitter, and more.
  -- use "cstsunfu/.sea.nvim"                          -- https://github.com/cstsunfu/.sea.nvim                          | A modular NeoVim configuration with beautiful UI and some useful features(Pomodoro Clock, Window Number).
  -- use "shaeinst/roshnivim"                          -- https://github.com/shaeinst/roshnivim                          | Roshnivim, can be called neovim's distro, is a predefined configs so that you don't need 1000hr to setup neovim as an IDE.
-- Keybinding
  -- use "AckslD/nvim-whichkey-setup.lua"              -- https://github.com/AckslD/nvim-whichkey-setup.lua              | Plugin that wraps vim-which-key to simplify setup in Lua.
     use "folke/which-key.nvim"                        -- https://github.com/folke/which-key.nvim                        | Neovim plugin that shows a popup with possible keybindings of the command you started typing.
  -- use "Iron-E/nvim-cartographer"                    -- https://github.com/Iron-E/nvim-cartographer                    | a more convenient <code>:map</code>ping syntax for Lua environments.
  -- use "b0o/mapx.nvim"                               -- https://github.com/b0o/mapx.nvim                               | A simpler key mapping API that mimics Neovim's <code>:map</code>-family of commands. Integrates with which-key.nvim.
  -- use "LionC/nest.nvim"                             -- https://github.com/LionC/nest.nvim                             | Lua utility to map keys concisely using cascading trees. Also allows binding Lua functions to keys.
  -- use "LinArcX/telescope-command-palette.nvim"      -- https://github.com/LinArcX/telescope-command-palette.nvim      | Lua plugin to create key-bindings and watch them with telescope.
-- Tmux
  -- use "aserowy/tmux.nvim"                           -- https://github.com/aserowy/tmux.nvim                           | Tmux integration for Neovim features pane movement and resizing from within Neovim.
  -- use "danielpieper/telescope-tmuxinator.nvim"      -- https://github.com/danielpieper/telescope-tmuxinator.nvim      | Integration for tmuxinator with telescope.nvim.
  -- use "hkupty/nvimux"                               -- https://github.com/hkupty/nvimux                               | Neovim as tmux replacement.
  -- use "numToStr/Navigator.nvim"                     -- https://github.com/numToStr/Navigator.nvim                     | Smoothly navigate between Neovim splits and Tmux panes.
-- Remote Development
  -- use "chipsenkbeil/distant.nvim"                   -- https://github.com/chipsenkbeil/distant.nvim                   | Edit files, run programs, and work with LSP on a remote machine from the comfort of your local environment.
  -- use "jamestthompson3/nvim-remote-containers"      -- https://github.com/jamestthompson3/nvim-remote-containers      | Develop inside docker containers, just like VSCode.
-- Split and Window
  -- use "henriquehbr/ataraxis.lua"                    -- https://github.com/henriquehbr/ataraxis.lua                    | A zen mode for improving code readability on Neovim.
  -- use "gitlab.com/yorickpeterse/nvim-window"        -- https://gitlab.com/yorickpeterse/nvim-window                   | Easily jump between Neovim windows.</li>
  -- use "sindrets/winshift.nvim"                      -- https://github.com/sindrets/winshift.nvim                      | Rearrange your windows with ease.
  -- use "beauwilliams/focus.nvim"                     -- https://github.com/beauwilliams/focus.nvim                     | Auto-Focusing and Auto-Resizing Splits/Windows for Neovim written in Lua! Vim splits on steroids.
  -- use "luukvbaal/stabilize.nvim"                    -- https://github.com/luukvbaal/stabilize.nvim                    | Stabilized window content on window open/close events.
-- External
-- These tools are used externally to Neovim to enhance the experience
-- Version Manager
  -- use "NTBBloodbath/nvenv"                          -- https://github.com/NTBBloodbath/nvenv                          | A lightweight and blazing fast Neovim version manager.
  -- use "shohi/neva"                                  -- https://github.com/shohi/neva                                  | A Neovim version manager written in Lua.
-- Boilerplate
  -- use "gennaro-tedesco/boilit"                      -- https://github.com/gennaro-tedesco/boilit                      | Create boilerplate structure for Neovim plugins.
-- other plugins
     use "antoinemadec/FixCursorHold.nvim"             -- https://github.com/antoinemadec/FixCursorHold.nvim             | This is needed to fix lsp doc highlight
     use "moll/vim-bbye"                               -- https://github.com/moll/vim-bbye                               |
     use "lewis6991/impatient.nvim"                    -- https://github.com/lewis6991/impatient.nvim                    |

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
