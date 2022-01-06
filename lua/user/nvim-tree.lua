--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __              _                       __                          __
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  ____ _   __(_)___ ___              / /_________  ___           / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   / __ \ | / / / __ `__ \   ______   / __/ ___/ _ \/ _ \         / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/    / / / / |/ / / / / / / /  /_____/  / /_/ /  /  __/  __/   _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/     /_/ /_/|___/_/_/ /_/ /_/            \__/_/   \___/\___/   (_)  /_/\__,_/\__,_/
--
-- Description:  Creates a nice file explorer, to open, create, delete, move, see, ... files.
--               see https://github.com/kyazdani42/nvim-tree.lua
-- Dependencies:
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged  = "",
    staged    = "S",
    unmerged  = "",
    renamed   = "➜",
    deleted   = "",
    untracked = "U",
    ignored   = "◌",
  },
  folder = {
    default    = "",
    open       = "",
    empty      = "",
    empty_open = "",
    symlink    = "",
  },
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  vim.notify("Could not load properly 'nvim-tree' inside 'nvim-tree.lua'", "error", { title="kyazdani42/nvim-tree.lua" })
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  vim.notify("Could not load properly 'nvim-tree.config' inside 'nvim-tree.lua'", "error", { title="kyazdani42/nvim-tree.lua" })
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  disable_netrw = true,
  hijack_netrw  = true,
  open_on_setup = false,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  auto_close    = true,
  open_on_tab   = false,
  hijack_cursor = false,
  update_cwd    = true,
  update_to_buf_dir = {
    enable    = true,
    auto_open = true,
  },
  diagnostics = {
    enable    = true,
    icons = {
      hint    = "",
      info    = "",
      warning = "",
      error   = "",
    },
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {},
  },
  system_open = {
    cmd  = "kitty",
    args = {"lf"},
  },
  filters = {
    dotfiles = false,
    custom   = {},
  },
  git = {
    enable  = true,
    ignore  = true,
    timeout = 500,
  },
  view = {
    width            = 30,
    height           = 30,
    hide_root_folder = false,
    side             = "left",
    auto_resize      = true,
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
        { key = {"<C-v>", "v"},                 cb = tree_cb("vsplit") },
        { key = {"<C-x>", "s"},                 cb = tree_cb("split") },
        { key = "<C-t>",                        cb = tree_cb("tabnew") },
        { key = "<",                            cb = tree_cb("prev_sibling") },
        { key = ">",                            cb = tree_cb("next_sibling") },
        { key = "P",                            cb = tree_cb("parent_node") },
        { key = {"<BS>", "h"},                  cb = tree_cb("close_node") },
        { key = "<Tab>",                        cb = tree_cb("preview") },
        { key = "K",                            cb = tree_cb("first_sibling") },
        { key = "J",                            cb = tree_cb("last_sibling") },
        { key = "I",                            cb = tree_cb("toggle_ignored") },
        { key = "H",                            cb = tree_cb("toggle_dotfiles") },
        { key = "R",                            cb = tree_cb("refresh") },
        { key = "a",                            cb = tree_cb("create") },
        { key = "d",                            cb = tree_cb("remove") },
        { key = "D",                            cb = tree_cb("trash") },
        { key = "r",                            cb = tree_cb("rename") },
        { key = "<C-r>",                        cb = tree_cb("full_rename") },
        { key = "x",                            cb = tree_cb("cut") },
        { key = "c",                            cb = tree_cb("copy") },
        { key = "p",                            cb = tree_cb("paste") },
        { key = "y",                            cb = tree_cb("copy_name") },
        { key = "Y",                            cb = tree_cb("copy_path") },
        { key = "gy",                           cb = tree_cb("copy_absolute_path") },
        { key = "[c",                           cb = tree_cb("prev_git_item") },
        { key = "]c",                           cb = tree_cb("next_git_item") },
        { key = "-",                            cb = tree_cb("dir_up") },
        { key = "S",                            cb = tree_cb("system_open") },
        { key = "q",                            cb = tree_cb("close") },
        { key = "?",                            cb = tree_cb("toggle_help") },
      },
    },
    number         = false,
    relativenumber = false,
  },
  trash = {
    cmd             = "trash",
    require_confirm = true,
  },
  quit_on_open          = 0,
  git_hl                = 1,
  disable_window_picker = 0,
  root_folder_modifier  = ":t",
  show_icons = {
    git           = 1,
    folders       = 1,
    files         = 1,
    folder_arrows = 1,
    tree_width    = 30,
  },
}
