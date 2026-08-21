return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
			"jay-babu/mason-nvim-dap.nvim",
			"leoluz/nvim-dap-go",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("mason-nvim-dap").setup({
				ensure_installed = { "codelldb", "delve" },
				automatic_installation = true,
			})

			require("dap-go").setup()

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
					name = "Запустить отладку Rust (CodeLLDB)",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input(
							"Путь к бинарнику: ",
							vim.fn.getcwd() .. "/target/debug/",
							"file"
						)
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}

			-- Автоматически открывать панели отладки при старте и закрывать при выходе
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

			vim.fn.sign_define(
				"DapBreakpoint",
				{ text = "\u{f192}", texthl = "DiagnosticError", linehl = "", numhl = "" }
			)
			vim.fn.sign_define(
				"DapStopped",
				{ text = "\u{f061}", texthl = "DiagnosticWarn", linehl = "Visual", numhl = "DiagnosticWarn" }
			)

			-- Поставить/снять точку останова (Breakpoint) на строке
			vim.keymap.set(
				"n",
				"<leader>db",
				dap.toggle_breakpoint,
				{ desc = "Поставить точку останова" }
			)

			-- Запустить отладку / Продолжить до следующей точки (Continue)
			vim.keymap.set(
				"n",
				"<leader>dc",
				dap.continue,
				{ desc = "Запуск / Продолжить отладку" }
			)

			-- Шаг без захода внутрь функции, на следующую строку (Step Over)
			vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Шаг через (Step Over)" })

			-- Шаг с заходом внутрь функции (Step Into)
			vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Шаг внутрь (Step Into)" })

			-- Полностью остановить отладку (Stop)
			vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "Остановить отладку" })
		end,
	},
}
