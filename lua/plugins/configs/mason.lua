local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("Problem with mason")
  return
end

mason.setup({
  ui = {
    border = "single",
    width = 0.8,
    height = 0.5
  }
})

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  vim.notify("Problem with mason-lspconfig")
  return
end

mason_lspconfig.setup {
  automatic_installation = true
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("Problems with lspconfig")
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local navic = require("nvim-navic")

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" }),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
      end,
      flags = lsp_flags,
      capabilities = capabilities,
      handlers = handlers
    }
  end,
}

require 'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
