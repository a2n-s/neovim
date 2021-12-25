--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __   __                 __             __  __  _                        __                                    __                     __                     __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  / /________       _/_/  ________  / /_/ /_(_)___  ____ ______     _/_/   _______  ______ ___  ____  ___  / /______              / /_  ______ _         / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   / / ___/ __ \    _/_/   / ___/ _ \/ __/ __/ / __ \/ __ `/ ___/   _/_/    / ___/ / / / __ `__ \/ __ \/ _ \/ //_/ __ \            / / / / / __ `/        / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/    / (__  ) /_/ /  _/_/    (__  )  __/ /_/ /_/ / / / / /_/ (__  )  _/_/     (__  ) /_/ / / / / / / / / /  __/ ,< / /_/ /           / / /_/ / /_/ /   _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/     /_/____/ .___/  /_/     /____/\___/\__/\__/_/_/ /_/\__, /____/  /_/      /____/\__,_/_/ /_/ /_/_/ /_/\___/_/|_|\____/  ______   /_/\__,_/\__,_/   (_)  /_/\__,_/\__,_/
--                                                                                 /_/                                         /____/                                                              /_____/
-- Description:  TODO
-- Dependencies: TODO
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

return {
	settings = {

		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
