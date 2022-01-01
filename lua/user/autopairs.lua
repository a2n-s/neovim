--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __               __                    _                    __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  ____ ___  __/ /_____  ____  ____ _(_)_________         / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   / __ `/ / / / __/ __ \/ __ \/ __ `/ / ___/ ___/        / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/    / /_/ / /_/ / /_/ /_/ / /_/ / /_/ / / /  (__  )   _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/      \__,_/\__,_/\__/\____/ .___/\__,_/_/_/  /____/   (_)  /_/\__,_/\__,_/
--                                                                                                /_/
-- Description:  enable to expand brackets and parentheses automatically when pressing enter,
--               see https://github.com/windwp/nvim-autopairs
-- Dependencies:
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

local notify_ok, notify = pcall(require, "notify")
local plugin            = "windwp/nvim-autopairs"
local error_timeout     = 5000
local err_opts          = { title=plugin, timeout=error_timeout }

local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  local err_msg = "Could not load properly 'nvim-autopairs' inside 'autopairs.lua'"
  if not notify_ok then vim.notify(err_msg) else notify(err_msg, "error", err_opts) end
  return
end

npairs.setup {
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
}

plugin   = "windwp/nvim-autopairs"
err_opts = { title=plugin, timeout=error_timeout }
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  local err_msg = "Could not load properly 'cmp' inside 'autopairs.lua'"
  if not notify_ok then vim.notify(err_msg) else notify(err_msg, "error", err_opts) end
  return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
