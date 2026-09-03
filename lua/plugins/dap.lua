return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
      "jay-babu/mason-nvim-dap.nvim",
      "leoluz/nvim-dap-go",
    },
    keys = {
      { "<leader>db", desc = "Точка останова" },
      { "<leader>dc", desc = "Запуск / продолжить" },
      { "<leader>do", desc = "Шаг через" },
      { "<leader>di", desc = "Шаг внутрь" },
      { "<leader>dq", desc = "Остановить отладку" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("mason-nvim-dap").setup({
        ensure_installed = { "codelldb", "delve" },
        automatic_installation = true,
      })

      require("dap-go").setup()

      local function rust_debug_program()
        local cwd = vim.fn.getcwd()
        local fallback = function()
          return vim.fn.input("Путь к бинарнику: ", cwd .. "/target/debug/", "file")
        end

        local metadata_json = vim.fn.system({ "cargo", "metadata", "--no-deps", "--format-version", "1" })
        if vim.v.shell_error ~= 0 then
          return fallback()
        end

        local ok, metadata = pcall(vim.json.decode, metadata_json)
        if not ok or type(metadata) ~= "table" then
          return fallback()
        end

        local members = {}
        for _, id in ipairs(metadata.workspace_members or {}) do
          members[id] = true
        end

        local bins = {}
        for _, pkg in ipairs(metadata.packages or {}) do
          if members[pkg.id] then
            for _, target in ipairs(pkg.targets or {}) do
              if vim.tbl_contains(target.kind or {}, "bin") then
                table.insert(bins, cwd .. "/target/debug/" .. target.name)
              end
            end
          end
        end

        if #bins == 1 then
          return bins[1]
        end
        if #bins > 1 then
          local choices = { "Выбери бинарник:" }
          vim.list_extend(choices, bins)
          local choice = vim.fn.inputlist(choices)
          if choice > 0 and bins[choice] then
            return bins[choice]
          end
        end

        return fallback()
      end

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
        detached = false,
      }

      dap.configurations.rust = {
        {
          name = "Rust (CodeLLDB)",
          type = "codelldb",
          request = "launch",
          program = rust_debug_program,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      dapui.setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      vim.fn.sign_define("DapBreakpoint", {
        text = "\u{f192}",
        texthl = "DiagnosticError",
      })
      vim.fn.sign_define("DapStopped", {
        text = "\u{f061}",
        texthl = "DiagnosticWarn",
        linehl = "Visual",
        numhl = "DiagnosticWarn",
      })

      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Точка останова" })
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Запуск / продолжить" })
      vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Шаг через" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Шаг внутрь" })
      vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "Остановить отладку" })
    end,
  },
}
