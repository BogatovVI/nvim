return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate", "MasonToolsInstall" },
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "gopls", "rust_analyzer" },
        automatic_enable = false,
      })

      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",
          "goimports",
          "gofumpt",
          "golangci-lint",
          "gotestsum",
        },
        run_on_start = false,
      })
      require("mason-tool-installer").check_install(false)

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }

          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
          end

          map("n", "gd", function()
            require("snacks").picker.lsp_definitions()
          end, "Перейти к определению")
          map("n", "gD", function()
            require("snacks").picker.lsp_declarations()
          end, "Перейти к объявлению")
          map("n", "gr", function()
            require("snacks").picker.lsp_references()
          end, "Найти ссылки")
          map("n", "gi", function()
            require("snacks").picker.lsp_implementations()
          end, "Перейти к реализации")
          map("n", "K", vim.lsp.buf.hover, "Документация")
          map("n", "<leader>rn", vim.lsp.buf.rename, "Переименовать")
          map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("n", "gl", function()
            vim.diagnostic.open_float(nil, { border = "rounded", source = "always", scope = "cursor" })
          end, "Показать диагностику")
          map("n", "<leader>ih", function()
            if not vim.lsp.inlay_hint then
              return
            end
            local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf })
            vim.lsp.inlay_hint.enable(not enabled, { bufnr = ev.buf })
          end, "Вкл/выкл inlay hints")

          if vim.lsp.inlay_hint then
            pcall(vim.lsp.inlay_hint.enable, true, { bufnr = ev.buf })
          end
        end,
      })

      local capabilities = require("blink.cmp").get_lsp_capabilities()

      vim.diagnostic.config({
        virtual_text = { spacing = 4, prefix = "■" },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "\u{f015a}",
            [vim.diagnostic.severity.WARN] = "\u{f002a}",
            [vim.diagnostic.severity.INFO] = "\u{f1035}",
            [vim.diagnostic.severity.HINT] = "\u{f0336}",
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      vim.keymap.set("n", "]d", function()
        vim.diagnostic.jump({ count = 1, float = true })
      end, { desc = "Следующая диагностика" })
      vim.keymap.set("n", "[d", function()
        vim.diagnostic.jump({ count = -1, float = true })
      end, { desc = "Предыдущая диагностика" })

      local function setup_server(server_name, config_path)
        local has_mod, mod = pcall(require, config_path)
        local user_config = (has_mod and mod.get_config) and mod.get_config(capabilities)
          or { capabilities = capabilities }
        vim.lsp.config(server_name, user_config)
        vim.lsp.enable(server_name)
      end

      setup_server("lua_ls", "plugins.lsp.lua")
      setup_server("gopls", "plugins.lsp.go")
      setup_server("rust_analyzer", "plugins.lsp.rust")
    end,
  },
}
