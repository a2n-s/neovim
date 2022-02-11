--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __   __                 __             __  __  _                        __                    _       __    __           __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  / /________       _/_/  ________  / /_/ /_(_)___  ____ ______     _/_/  ____  __  _______(_)___ _/ /_  / /_         / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   / / ___/ __ \    _/_/   / ___/ _ \/ __/ __/ / __ \/ __ `/ ___/   _/_/   / __ \/ / / / ___/ / __ `/ __ \/ __/        / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/    / (__  ) /_/ /  _/_/    (__  )  __/ /_/ /_/ / / / / /_/ (__  )  _/_/    / /_/ / /_/ / /  / / /_/ / / / / /_    _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/     /_/____/ .___/  /_/     /____/\___/\__/\__/_/_/ /_/\__, /____/  /_/     / .___/\__, /_/  /_/\__, /_/ /_/\__/   (_)  /_/\__,_/\__,_/
--                                                                                 /_/                                         /____/               /_/    /____/       /____/
-- Description:  settings for python pyright lsp completion.
-- Dependencies:
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

return {
	settings = {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_dir = function(startpath)
        return M.search_ancestors(startpath, matcher)
      end,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true,
          typeCheckingMode = "off",
        }
      }
    },
    single_file_support = true,
	},
}
