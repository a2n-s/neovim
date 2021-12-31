--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __               __  _                           __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  ____  ____  / /_(_)___  ____  _____         / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   / __ \/ __ \/ __/ / __ \/ __ \/ ___/        / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/    / /_/ / /_/ / /_/ / /_/ / / / (__  )   _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/      \____/ .___/\__/_/\____/_/ /_/____/   (_)  /_/\__,_/\__,_/
--                                                                                /_/
-- Description:  define basic options for neovim, such as how to split windows, whether to create backup, swap or undo files, shapes of things, ...
-- Dependencies:
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

-- options definition.
local options = {
  -- visual options to make basic things look pretty.
  showcmd        = true,                      -- show partial commands in the command lines when typing key strokes.
  cmdheight      = 1,                         -- more space in the neovim command line for displaying messages.
  pumheight      = 10,                        -- pop up maximum menu height.
  showmode       = false,                     -- to see things like -- INSERT --.
  showtabline    = 2,                         -- always show tabs.
  cursorline     = true,                      -- highlight the current line.
  cursorcolumn   = true,                      -- highlight the current column.
  number         = true,                      -- set numbered lines.
  list           = true,                      -- set invisible characters.
  relativenumber = false,                     -- set relative numbered lines.
  numberwidth    = 4,                         -- set number column width to 4 {default 4}.
  signcolumn     = "yes",                     -- show the sign column, otherwise it would shift the text each time.
  guifont        = "monospace:h17",           -- the font used in graphical neovim applications.
  wrap           = false,                     -- display lines as one long line.
  showbreak      = "+++ ",                    -- when wrap is enabled, indicate the start of a wrapped line with showbreak.
  visualbell     = true,                      -- triggers the visual bell instead of the usual beeping.
  -- showmatch      = true,                      -- preview matching strings when doing a search.
  conceallevel   = 0,                         -- so that `` is visible in markdown files.
  -- more options to make the life easier.
  clipboard      = "unnamedplus",             -- allows neovim to access the system clipboard.
  completeopt    = { "menuone", "noselect" }, -- mostly just for cmp.
  fileencoding   = "utf-8",                   -- the encoding written to a file.
  hlsearch       = true,                      -- highlight all matches on previous search pattern.
  ignorecase     = true,                      -- ignore case in search patterns.
  mouse          = "a",                       -- allow the mouse to be used in neovim.
  smartcase      = true,                      -- smart case.
  smartindent    = true,                      -- make indenting smarter again.
  splitbelow     = true,                      -- force all horizontal splits to go below current window.
  splitright     = true,                      -- force all vertical splits to go to the right of current window.
  termguicolors  = true,                      -- set term gui colors (most terminals support this).
  timeoutlen     = 100,                       -- time to wait for a mapped sequence to complete (in milliseconds).
  updatetime     = 300,                       -- faster completion (4000ms default).
  expandtab      = true,                      -- convert tabs to spaces.
  shiftwidth     = 2,                         -- the number of spaces inserted for each indentation.
  tabstop        = 2,                         -- insert 2 spaces for a tab.
  scrolloff      = 8,                         -- the number of lines to keep below and above when scrolling.
  sidescrolloff  = 8,                         -- the number of columns to keep left and write when scrolling sideway when wrapping is disabled.
  -- files generated by neovim when editing buffers.
  backup         = false,                     -- creates a backup file.
  swapfile       = false,                     -- creates a swapfile.
  undofile       = true,                      -- enable persistent undo.
  writebackup    = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited.
}
vim.opt.shortmess:append "c"

-- add all previously defined options to the vim options.
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- some more final options.
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work.
