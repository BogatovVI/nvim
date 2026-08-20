return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "gopls",
          "rust_analyzer",
        },
      })

      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",     -- Для Lua
          "goimports",  -- Для Go
          "prettier",   -- Для Web (JS/TS/HTML/CыSS/JSON)
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        end,
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      vim.diagnostic.config({
        virtual_text = {
          spacing = 4,
          prefix = "■",
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "\u{f015a}",
            [vim.diagnostic.severity.WARN]  = "\u{f002a}",
            [vim.diagnostic.severity.INFO]  = "\u{f1035}",
            [vim.diagnostic.severity.HINT]  = "\u{f0336}",
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      vim.api.nvim_create_autocmd("CursorHold", {
        group = vim.api.nvim_create_augroup("LspDiagnosticsHover", {}),
        callback = function()
          local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = "rounded",
            source = "always",
            prefix = " ",
            scope = "cursor",
          }
          vim.diagnostic.open_float(nil, opts)
        end,
      })

      vim.o.updatetime = 400

      local function setup_server(server_name, config_path)
        local has_mod, mod = pcall(require, config_path)
        local user_config = (has_mod and mod.get_config) and mod.get_config(capabilities) or { capabilities = capabilities }

        vim.lsp.config(server_name, user_config)
        vim.lsp.enable(server_name)
      end

      setup_server("lua_ls", "plugins.lsp.lua")
      setup_server("gopls", "plugins.lsp.go")
      setup_server("rust_analyzer", "plugins.lsp.rust")
    end,
  }
}
