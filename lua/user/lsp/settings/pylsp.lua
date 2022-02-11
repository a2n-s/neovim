--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __   __                 __             __  __  _                        __               __                    __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  / /________       _/_/  ________  / /_/ /_(_)___  ____ ______     _/_/  ____  __  __/ /________           / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   / / ___/ __ \    _/_/   / ___/ _ \/ __/ __/ / __ \/ __ `/ ___/   _/_/   / __ \/ / / / / ___/ __ \         / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/    / (__  ) /_/ /  _/_/    (__  )  __/ /_/ /_/ / / / / /_/ (__  )  _/_/    / /_/ / /_/ / (__  ) /_/ /   _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/     /_/____/ .___/  /_/     /____/\___/\__/\__/_/_/ /_/\__, /____/  /_/     / .___/\__, /_/____/ .___/   (_)  /_/\__,_/\__,_/
--                                                                                 /_/                                         /____/               /_/    /____/      /_/
-- Description:  settings for python pylsp completion.
-- Dependencies:
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

return {
	settings = {
    cmd = { "pylsp" },
    filetypes = { "python" },
    root_dir = function(fname)
          local root_files = {
            'pyproject.toml',
            'setup.py',
            'setup.cfg',
            'requirements.txt',
            'Pipfile',
          }
          return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
        end,
    single_file_support = true
	},
}
