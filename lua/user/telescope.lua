--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __   __       __                                         __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  / /____  / /__  ______________  ____  ___           / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   / __/ _ \/ / _ \/ ___/ ___/ __ \/ __ \/ _ \         / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/    / /_/  __/ /  __(__  ) /__/ /_/ / /_/ /  __/   _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/      \__/\___/_/\___/____/\___/\____/ .___/\___/   (_)  /_/\__,_/\__,_/
--                                                                                                          /_/
-- Description:  telescope configuration.
--               see https://github.com/nvim-telescope/telescope.nvim
-- Dependencies: telescope media files.
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  local err_opts = { title="nvim-telescope/telescope.nvim", timeout=5000 }
  vim.notify("Could not load properly 'telescope' inside 'telescope.lua'", "error", err_opts)
  return
end

telescope.load_extension('media_files')
telescope.load_extension('notify')

local actions = require "telescope.actions"

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-n>"]      = actions.cycle_history_next,
        ["<C-p>"]      = actions.cycle_history_prev,
        ["<C-j>"]      = actions.move_selection_next,
        ["<C-k>"]      = actions.move_selection_previous,
        ["<C-c>"]      = actions.close,
        ["<Down>"]     = actions.move_selection_next,
        ["<Up>"]       = actions.move_selection_previous,
        ["<CR>"]       = actions.select_default,
        ["<C-x>"]      = actions.select_horizontal,
        ["<C-v>"]      = actions.select_vertical,
        ["<C-t>"]      = actions.select_tab,
        ["<C-u>"]      = actions.preview_scrolling_up,
        ["<C-d>"]      = actions.preview_scrolling_down,
        ["<PageUp>"]   = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,
        ["<Tab>"]      = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"]    = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"]      = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"]      = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"]      = actions.complete_tag,
        ["<C-_>"]      = actions.which_key, -- keys from pressing <C-/>
      },
      n = {
        ["<esc>"]      = actions.close,
        ["<CR>"]       = actions.select_default,
        ["<C-x>"]      = actions.select_horizontal,
        ["<C-v>"]      = actions.select_vertical,
        ["<C-t>"]      = actions.select_tab,
        ["<Tab>"]      = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"]    = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"]      = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"]      = actions.send_selected_to_qflist + actions.open_qflist,
        ["j"]          = actions.move_selection_next,
        ["k"]          = actions.move_selection_previous,
        ["H"]          = actions.move_to_top,
        ["M"]          = actions.move_to_middle,
        ["L"]          = actions.move_to_bottom,
        ["<Down>"]     = actions.move_selection_next,
        ["<Up>"]       = actions.move_selection_previous,
        ["gg"]         = actions.move_to_top,
        ["G"]          = actions.move_to_bottom,
        ["<C-u>"]      = actions.preview_scrolling_up,
        ["<C-d>"]      = actions.preview_scrolling_down,
        ["<PageUp>"]   = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,
        ["?"]          = actions.which_key,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    media_files = {
        -- filetypes whitelist
        -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        filetypes = {"png", "webp", "jpg", "jpeg"},
        find_cmd = "rg" -- find command (defaults to `fd`)
      }
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
}
