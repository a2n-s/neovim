--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __                                   __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  _   _____  ____  ____           / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   | | / / _ \/ __ \/ __ \         / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/     | |/ /  __/ / / / / / /   _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/       |___/\___/_/ /_/_/ /_/   (_)  /_/\__,_/\__,_/
--
-- Description:  Draws boxes and arrows in visual mode.
--               see https://github.com/jbyuki/venn.nvim
-- Dependencies:
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

-- venn.nvim: enable or disable keymappings
function _G.Toggle_venn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == "nil" then
        vim.b.venn_enabled = true
        vim.cmd[[setlocal ve=all]]
        -- draw a line on HJKL keystokes
        vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
        -- draw a box by pressing "1", "2", "3", "4", "5" or "6" with visual selection
        vim.api.nvim_buf_set_keymap(0, "v", "1", ":VBox<CR>",   {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "v", "2", ":VBoxD<CR>",  {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "v", "3", ":VBoxH<CR>",  {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "v", "4", ":VBoxO<CR>",  {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "v", "5", ":VBoxHO<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "v", "6", ":VBoxDO<CR>", {noremap = true})
    else
        vim.cmd[[setlocal ve=]]
        vim.cmd[[mapclear <buffer>]]
        vim.b.venn_enabled = nil
    end
end
-- toggle keymappings for venn using <leader>v
vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", { noremap = true})
