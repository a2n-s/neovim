--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __                                             __           __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  _________  ____ ___  ____ ___  ___  ____  / /_         / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   / ___/ __ \/ __ `__ \/ __ `__ \/ _ \/ __ \/ __/        / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/    / /__/ /_/ / / / / / / / / / / /  __/ / / / /_    _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/      \___/\____/_/ /_/ /_/_/ /_/ /_/\___/_/ /_/\__/   (_)  /_/\__,_/\__,_/
--
-- Description:  Allow to comment automatically lines with one key stroke or combination.
--               see https://github.com/numToStr/Comment.nvim
-- Dependencies:
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  vim.notify("Could not load properly 'Comment' inside 'comment.lua'", "error", { title="numToStr/Comment.nvim" })
  return
end

comment.setup {
  pre_hook = function(ctx)
    local U = require "Comment.utils"

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring {
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location,
    }
  end,
}
