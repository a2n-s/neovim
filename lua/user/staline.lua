--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __   __                      _ __  __                     __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  / /_________  ___  _____(_) /_/ /____  _____         / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   / __/ ___/ _ \/ _ \/ ___/ / __/ __/ _ \/ ___/        / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/    / /_/ /  /  __/  __(__  ) / /_/ /_/  __/ /      _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/      \__/_/   \___/\___/____/_/\__/\__/\___/_/      (_)  /_/\__,_/\__,_/
--
-- Description:  statusline
--               see https://github.com/tamton-aquib/staline.nvim
-- Dependencies:
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine

local status_ok, staline = pcall(require, "staline")
if not status_ok then
  vim.notify("Could not load properly 'staline' inside 'staline.lua'", "error", { title="tamton-aquib/staline.nvim" })
  return
end

local simple = {
	sections = {
		left = { '  ', 'mode', ' ', 'branch', ' ', 'lsp' },
		mid = {},
		right = {'-file_name', 'line_column' }
	},
	mode_colors = {
		i = "#d4be98",
		n = "#84a598",
		c = "#8fbf7f",
		v = "#fc802d",
	},
	defaults = {
		true_colors = true,
		line_column = " [%l/%L] :%c  ",
		branch_symbol = " "
  }
}

local evil = {
	sections = {
		left = {
			'▊', ' ', { 'Evil', ' ' }, ' ',         -- The mode and evil sign
			'file_size', ' ',                        -- Filesize
			{ 'StalineFile', 'file_name' }, ' '       -- Filename in different highlight
		},
		mid = { ' ', 'lsp_name' },                      -- "lsp_name" is still a little buggy
		right = {
			{ 'StalineEnc', vim.bo.fileencoding:upper() }, '  ',  -- Example for custom section
			{ 'StalineEnc', 'cool_symbol' }, ' ',                 -- the cool_symbol for your OS
			{ 'StalineGit', 'branch' }, ' ', '▊'                  -- Branch Name in different highlight
		}
	},
	defaults = {
		bg = "#202328",
		branch_symbol = " "
	},
	mode_colors = {
		n = "#38b1f0",
		i = "#9ece6a",       -- etc mode
	}
}
vim.cmd [[hi Evil        guifg=#f36365 guibg=#202328]]       -- Higlight for Evil symbol
vim.cmd [[hi StalineEnc  guifg=#7d9955 guibg=#202328]]       -- Encoding Highlight
vim.cmd [[hi StalineGit  guifg=#8583b3 guibg=#202328]]       -- Branch Name Highlight
vim.cmd [[hi StalineFile guifg=#c37cda guibg=#202328]]       -- File name Highlight

local pebble = {
	sections = {
		left = {
			' ', 'right_sep_double', '-mode', 'left_sep_double', ' ',
			'right_sep', '-file_name', 'left_sep', ' ',
			'right_sep_double', '-branch', 'left_sep_double', ' ',
		},
		mid  = {'lsp'},
		right= {
			'right_sep', '-cool_symbol', 'left_sep', ' ',
			'right_sep', '- ', '-lsp_name', '- ', 'left_sep',
			'right_sep_double', '-line_column', 'left_sep_double', ' ',
		}
	},

	defaults={
		fg = "#986fec",
		cool_symbol = "  ",
		left_separator = "",
		right_separator = "",
		-- line_column = "%l:%c [%L]",
		true_colors = true,
		line_column = "[%l:%c] 並%p%% "
		-- font_active = "bold"
	},
	mode_colors = {
		n  = "#181a23",
		i  = "#181a23",
		ic = "#181a23",
		c  = "#181a23",
		v  = "#181a23"       -- etc
	}
}

local color = {
	sections = { 
		left = { ("▁"):rep(vim.o.columns) }, -- change thickness: "_", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"
		mid = {},
		right = {}
	},
}

-- staline.setup(simple)
-- staline.setup(evil)
-- staline.setup(pebble)
staline.setup(color)
