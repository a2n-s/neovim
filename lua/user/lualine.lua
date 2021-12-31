--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __   __            ___                     __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  / /_  ______ _/ (_)___  ___           / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   / / / / / __ `/ / / __ \/ _ \         / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/    / / /_/ / /_/ / / / / / /  __/   _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/     /_/\__,_/\__,_/_/_/_/ /_/\___/   (_)  /_/\__,_/\__,_/
--
-- Description:  A blazing fast and easy to configure statusline written in lua.
--               see https://github.com/nvim-lualine/lualine.nvim
-- Dependencies:
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  vim.notify("Could not load properly 'lualine' inside 'lualine.lua'")
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources          = { "nvim_diagnostic" },
	sections         = { "error", "warn" },
	symbols          = { error = " ", warn = " " },
	colored          = false,
	update_in_insert = true,
	always_visible   = true,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = "+ ", modified = "* ", removed = "- " }, -- changes diff symbols
  cond    = hide_in_width
}

local mode = {
	"mode",
	fmt = function(str)
		return "--" .. str .. "--"
	end,
}

local fileformat = {
  'fileformat',
  symbols = {
    unix = '', -- e712
    dos  = '', -- e70f
    mac  = '', -- e711
  }
}
local filename = {
  'filename',
  file_status     = true,   -- Displays file status (readonly status, modified status)
  path            = 1,      -- 0: Just the filename -- 1: Relative path -- 2: Absolute path
  shorting_target = 40,     -- Shortens path to leave 40 spaces in the window for other components. (terrible name, any suggestions?)
  symbols = {
    modified = '[+]',       -- Text to show when the file is modified
    readonly = '[-]',       -- Text to show when the file is non-modifiable or readonly
    unnamed  = '[No Name]', -- Text to show for unnamed buffers
  }
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon          = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon          = "",
}

local location = {
	"location",
	padding = 0,
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines  = vim.fn.line("$")
	local chars        = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio   = current_line / total_lines
	local index        = math.ceil(line_ratio * #chars)
	return chars[index]
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options                = {
		icons_enabled        = true,
		theme                = "auto",
		component_separators = { left = "", right = "" },
		section_separators   = { left = "", right = "" },
		disabled_filetypes   = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { branch, diagnostics },
		lualine_b = { mode },
		lualine_c = {fileformat, filetype, filename},
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { diff, spaces, "encoding", filetype },
		lualine_y = { location },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline    = {},
	extensions = {},
})
