-- Mason for managing LSP servers, formatters, and linters
return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "pyright",
        "rust_analyzer",
        "gopls",
        "clangd",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "eslint_d",
        "black",
        "pylint",
        "isort",
        "clang-format",
        "gofumpt",
        "goimports",
        "golangci-lint",
        "rustfmt",
      },
    })

    -- Setup handlers for automatic LSP configuration
    mason_lspconfig.setup_handlers({
      -- Default handler for all servers
      function(server_name)
        require("lspconfig")[server_name].setup({})
      end,
    })
  end,
}
