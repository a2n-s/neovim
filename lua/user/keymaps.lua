--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __   __                                                  __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  / /_____  __  ______ ___  ____ _____  _____         / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   / //_/ _ \/ / / / __ `__ \/ __ `/ __ \/ ___/        / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/    / ,< /  __/ /_/ / / / / / / /_/ / /_/ (__  )   _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/     /_/|_|\___/\__, /_/ /_/ /_/\__,_/ .___/____/   (_)  /_/\__,_/\__,_/
--                                                                                     /____/               /_/
-- Description:  defines all the basic keymaps used in neovim.
-- Dependencies:
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

-- options for the keymaps.
local opts = { noremap = true, silent = true }
local term_opts = { noremap = true, silent = true }

-- Shorten function name.
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key.
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation with ctrl+vim keys.
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- do not go into insert more when creating line above or below.
keymap("n", "o", "o<Esc>", opts)  -- below.
keymap("n", "O", "O<Esc>", opts)  -- above.
-- -- leader maps.
-- keymap("n", "<leader>s", ":luafile $MYVIMRC<CR>:luafile %<CR>",  opts)  -- sources the config.
-- keymap("n", "<leader>e", ":Lex 30<CR>",                          opts)  -- open and close the explorer window.
-- keymap("n", "<leader>c", ":nohlsearch<CR>",               opts)  -- clears the highlight.
-- Resize with ctrl+arrows.
keymap("n", "<C-Up>",    ":resize -2<CR>",          opts)
keymap("n", "<C-Down>",  ":resize +2<CR>",          opts)
keymap("n", "<C-Left>",  ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Navigate buffers with shift+h/l
keymap("n", "<S-l>",   ":bnext<CR>",                opts)
keymap("n", "<C-S-l>", ":BufferLineMoveNext<CR>",   opts)
keymap("n", "<S-h>",   ":bprevious<CR>",            opts)
keymap("n", "<C-S-h>", ":BufferLineMovePrev<CR>",   opts)

-- Insert --
-- Press jk fast to quit insert mode.
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode while changing tab alignment.
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Move text up and down with shift+j/k
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- paste.
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down whith shift+j/k
keymap("x", "J",     ":move '>+1<CR>gv-gv", opts)
keymap("x", "K",     ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- disable the escape key in terminal mode as it conflicts with features from terminal apps.
keymap("t", "<Esc>", "<Nop>", term_opts)
