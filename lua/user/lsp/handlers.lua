--             ___
--       ____ |__ \ ____              _____      personal page: https://a2n-s.github.io/ 
--      / __ `/_/ // __ \   ______   / ___/      github   page: https://github.com/a2n-s 
--     / /_/ / __// / / /  /_____/  (__  )       my   dotfiles: https://github.com/a2n-s/dotfiles 
--     \__,_/____/_/ /_/           /____/
--                 __   __                  __                              __   __                 __   __                    ____                        __ 
--               _/_/  / /_  ______ _     _/_/  __  __________  _____     _/_/  / /________       _/_/  / /_  ____ _____  ____/ / /__  __________         / /_  ______ _
--             _/_/   / / / / / __ `/   _/_/   / / / / ___/ _ \/ ___/   _/_/   / / ___/ __ \    _/_/   / __ \/ __ `/ __ \/ __  / / _ \/ ___/ ___/        / / / / / __ `/
--      _    _/_/    / / /_/ / /_/ /  _/_/    / /_/ (__  )  __/ /     _/_/    / (__  ) /_/ /  _/_/    / / / / /_/ / / / / /_/ / /  __/ /  (__  )   _    / / /_/ / /_/ /
--     (_)  /_/     /_/\__,_/\__,_/  /_/      \__,_/____/\___/_/     /_/     /_/____/ .___/  /_/     /_/ /_/\__,_/_/ /_/\__,_/_/\___/_/  /____/   (_)  /_/\__,_/\__,_/
--                                                                                 /_/
-- Description:  defines a handler for all lsp configurations, see
--               https://github.com/neovim/nvim-lspconfig#readme
-- Dependencies:
-- License:      https://github.com/a2n-s/dotfiles/blob/main/LICENSE 
--               original license at https://github.com/LunarVim/Neovim-from-scratch/blob/master/LICENSE 
-- Contributors: Stevan Antoine
--               adapted from the work of Christian Chiarulli at https://github.com/LunarVim/Neovim-from-scratch 

local M = {}

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn",  text = "" },
    { name = "DiagnosticSignHint",  text = "" },
    { name = "DiagnosticSignInfo",  text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style     = "minimal",
      border    = "rounded",
      source    = "always",
      header    = "",
      prefix    = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local keymap = vim.api.nvim_buf_set_keymap
local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  keymap(bufnr, "n", "gD",         "<cmd>lua vim.lsp.buf.declaration()<CR>",                                        opts)
  keymap(bufnr, "n", "gd",         "<cmd>lua vim.lsp.buf.definition()<CR>",                                         opts)
  keymap(bufnr, "n", "K",          "<cmd>lua vim.lsp.buf.hover()<CR>",                                              opts)
  keymap(bufnr, "n", "gi",         "<cmd>lua vim.lsp.buf.implementation()<CR>",                                     opts)
  keymap(bufnr, "n", "<C-k>",      "<cmd>lua vim.lsp.buf.signature_help()<CR>",                                     opts)
  keymap(bufnr, "n", "gr",         "<cmd>lua vim.lsp.buf.references()<CR>",                                         opts)
  keymap(bufnr, "n", "gl",         '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>', opts)
  keymap(bufnr, "n", "[d",         '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',                 opts)
  keymap(bufnr, "n", "]d",         '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',                 opts)
  keymap(bufnr, "n", "<leader>q",  "<cmd>lua vim.diagnostic.setloclist()<CR>",                                      opts)
  keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>",                                        opts)
  keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>",                                             opts)
  keymap(bufnr, "n", "<leader>f",  "<cmd>lua vim.diagnostic.open_float()<CR>",                                      opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  vim.notify("Could not load properly 'cmp_nvim_lsp' inside 'lsp/handlers.lua'")
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
