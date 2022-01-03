--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __   __                    __     __                               __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  / /_____  ____ _____ _/ /__  / /____  _________ ___           / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   / __/ __ \/ __ `/ __ `/ / _ \/ __/ _ \/ ___/ __ `__ \         / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/    / /_/ /_/ / /_/ / /_/ / /  __/ /_/  __/ /  / / / / / /   _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/      \__/\____/\__, /\__, /_/\___/\__/\___/_/  /_/ /_/ /_/   (_)  /_/\__,_/\__,_/
--                                                                                     /____//____/
-- Description:  manages terminals inside neovim.
--               see https://github.com/akinsho/toggleterm.nvim
-- Dependencies:
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  vim.notify("Could not load properly 'toggleterm' inside 'toggleterm.lua'", "error", { title="akinsho/toggleterm.nvim" })
  return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', "<cmd>close<CR>", opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
function _LAZYGIT_TOGGLE()  lazygit:toggle() end

local tig = Terminal:new({ cmd = "tig --all", hidden = true, direction = "float" })
function _TIG_TOGGLE()  tig:toggle() end

local cfg_lazygit = Terminal:new({ cmd = "lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME", hidden = true, direction = "float" })
function _CFG_LAZYGIT_TOGGLE()  cfg_lazygit:toggle() end

-- local cfg_tig = Terminal:new({ cmd = "GIT_DIR=$HOME/.dotfiles tig -C $HOME/.dotfiles --all", hidden = true, direction = "float" })
local cfg_tig = Terminal:new({ cmd = "GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME tig --all", hidden = true, direction = "float" })
function _CFG_TIG_TOGGLE()  cfg_tig:toggle() end

local node = Terminal:new({ cmd = "node", hidden = true })
function _NODE_TOGGLE()  node:toggle() end

local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
function _NCDU_TOGGLE()  ncdu:toggle() end

local htop = Terminal:new({ cmd = "htop", hidden = true })
function _HTOP_TOGGLE()  htop:toggle() end

local python = Terminal:new({ cmd = "python", hidden = true })
function _PYTHON_TOGGLE()  python:toggle() end
