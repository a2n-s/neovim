--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __         __      __                   __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  ____ _/ /___  / /_  ____ _         / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   / __ `/ / __ \/ __ \/ __ `/        / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/    / /_/ / / /_/ / / / / /_/ /   _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/      \__,_/_/ .___/_/ /_/\__,_/   (_)  /_/\__,_/\__,_/
--                                                                                  /_/
-- Description:  TODO
-- Dependencies: TODO
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  vim.notify("Could not load properly 'alpha' inside 'alpha.lua'")
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[                               __                ]],
	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "chrisatmachine.com"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
