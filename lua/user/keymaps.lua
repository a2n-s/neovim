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

-- Remap space as leader key.
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local modes = {
  normal       = "n",
  insert       = "i",
  visual       = "v",
  visual_block = "x",
  terminal     = "t",
  -- add more mode here if you want
}

function set_keymap(keys)
  for mode, map in pairs(keys) do
      local key_mode = modes[mode]
      for key, value in pairs(map) do
        vim.api.nvim_set_keymap(key_mode, key, value, opts)
      end
  end
end

local mappings = {
  normal = {
      ["<C-s>"]     = ":w<CR>",
      ["<Tab>"]     = ":bnext<CR>",
      ["<S-Tab>"]   = ":bprevious<CR>",
      ["<C-e>"]     = ":bdelete<CR>",
      ["<C-b>"]     = ":NvimTreeToggle<CR>",
      ["<C-p>"]     = ":Telescope find_files<CR>",
      ["<C-h>"]     = "<C-w>h",                              -- Better window navigation with ctrl+vim keys.
      ["<C-j>"]     = "<C-w>j",
      ["<C-k>"]     = "<C-w>k",
      ["<C-l>"]     = "<C-w>l",
      ["o"]         = "o<Esc>",                              -- below.-- do not go into insert more when creating line above or below.
      ["O"]         = "O<Esc>",                              -- above.
      -- ["<leader>s"] = ":luafile $MYVIMRC<CR>:luafile %<CR>", -- sources the config.
      -- ["<leader>e"] = ":Lex 30<CR>",                         -- open and close the explorer window.
      -- ["<leader>c"] = ":nohlsearch<CR>",                     -- clears the highlight.
      ["<C-Up>"]    = ":resize -2<CR>",                      -- Resize with ctrl+arrows.
      ["<C-Down>"]  = ":resize +2<CR>",
      ["<C-Left>"]  = ":vertical resize -2<CR>",
      ["<C-Right>"] = ":vertical resize +2<CR>",
      ["<S-l>"]     = ":bnext<CR>",                          -- Navigate buffers with shift+h/l
      ["<S-h>"]     = ":bprevious<CR>",
  },
  insert = {
      ["jk"] = "<ESC>", -- Press jk fast to quit insert mode.
  },
  visual = {
      [">"]     = ">gv",          -- Stay in indent mode while changing tab alignment.
      ["<"]     = "<gv",
      ["<A-j>"] = ":m .+1<CR>==", -- Move text up and down with shift+j/k
      ["<A-k>"] = ":m .-2<CR>==",
      ["p"]     = '"_dP'          -- paste.
  },
  visual_block = {
      ["J"]     = ":move '>+1<CR>gv-gv", -- Move text up and down whith shift+j/k
      ["K"]     = ":move '<-2<CR>gv-gv",
      ["<A-j>"] = ":move '>+1<CR>gv-gv",
      ["<A-k>"] = ":move '<-2<CR>gv-gv",
  },
  terminal = {
      ["<Esc>"] = "<Nop>",  -- disable the escape key in terminal mode as it conflicts with features from terminal apps.
  },
}

set_keymap(mappings)
