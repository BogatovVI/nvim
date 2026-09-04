local telescope_layout = {
  preset = "default",
  layout = {
    box = "horizontal",
    width = 0.8,
    height = 0.8,
    backdrop = false,
    {
      box = "vertical",
      border = "rounded",
      title = "{title} {opts}",
      { win = "input", height = 1, border = "bottom" },
      { win = "list" },
    },
    { win = "preview", title = "{preview}", border = "rounded", width = 0.55 },
  },
}

local function with_layout(extra)
  return vim.tbl_deep_extend("force", { layout = telescope_layout }, extra or {})
end

local my_logo = [[
 ██████╗ ██████╗ ██████╗ ███████╗
██╔════╝██╔═══██╗██╔══██╗██╔════╝
██║     ██║   ██║██║  ██║█████╗  
██║     ██║   ██║██║  ██║██╔══╝  
╚██████╗╚██████╔╝██████╔╝███████╗
 ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝]]

local function snacks()
  return require("snacks")
end

local function smart_explorer()
  if vim.bo.filetype == "snacks_dashboard" then
    snacks().picker.files()
  else
    snacks().explorer()
  end
end

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      picker = {
        enabled = true,
        actions = {
          focus_list = function(picker)
            if picker:empty() then
              picker:close()
              return
            end
            picker.input:stopinsert()
            vim.schedule(function()
              picker:focus("list", { show = true })
            end)
          end,
          toggle_focus = function(picker)
            if vim.api.nvim_get_current_win() == picker.input.win.win then
              if picker:empty() then
                return
              end
              picker.input:stopinsert()
              vim.schedule(function()
                picker:focus("list", { show = true })
              end)
            else
              picker:focus("input", { show = true })
            end
          end,
        },
        sources = {
          select = {
            preview = false,
            layout = { preset = "select", width = 0.4, height = 0.3 },
          },
          explorer = {
            layout = {
              preview = false,
              layout = {
                backdrop = false,
                width = 0.4,
                min_width = 48,
                height = 0.7,
                border = "rounded",
                box = "vertical",
                title = "{title} {live} {flags}",
                title_pos = "center",
                { win = "input", height = 1, border = "bottom" },
                { win = "list", border = "none" },
              },
            },
            auto_close = true,
            jump = { close = true },
            win = {
              list = {
                keys = {
                  ["/"] = "focus_input",
                  ["<CR>"] = "confirm",
                  ["l"] = "confirm",
                  ["h"] = "explorer_close",
                  ["s"] = "edit_split",
                  ["v"] = "edit_vsplit",
                  ["<c-s>"] = "edit_split",
                  ["<c-v>"] = "edit_vsplit",
                },
              },
              input = {
                keys = {
                  ["<Esc>"] = { "focus_list", mode = { "i", "n" } },
                  ["<c-s>"] = { "edit_split", mode = { "i", "n" } },
                  ["<c-v>"] = { "edit_vsplit", mode = { "i", "n" } },
                },
              },
            },
          },
          files = with_layout(),
          grep = with_layout(),
          buffers = with_layout(),
          help = with_layout(),
          git_status = with_layout(),
          diagnostics = with_layout(),
          lsp_symbols = with_layout(),
          lsp_definitions = with_layout(),
          lsp_declarations = with_layout(),
          lsp_references = with_layout(),
          lsp_implementations = with_layout(),
        },
        win = {
          input = {
            keys = {
              ["<Esc>"] = { "focus_list", mode = { "i", "n" } },
              ["<C-j>"] = { "list_down", mode = { "i", "n" } },
              ["<C-k>"] = { "list_up", mode = { "i", "n" } },
              ["<c-s>"] = { "edit_split", mode = { "i", "n" } },
              ["<c-v>"] = { "edit_vsplit", mode = { "i", "n" } },
            },
          },
          list = {
            keys = {
              ["<Esc>"] = "cancel",
              ["i"] = false,
              ["<c-s>"] = "edit_split",
              ["<c-v>"] = "edit_vsplit",
            },
          },
        },
      },
      explorer = { enabled = true },
      dashboard = {
        enabled = true,
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1, align = "center" },
          { section = "startup", padding = 1 },
        },
        preset = {
          header = my_logo,
          keys = {
            { icon = "\u{f002} ", key = "f", desc = "Find files", action = ":lua Snacks.picker.files()" },
            { icon = "\u{f0a35} ", key = "g", desc = "Grep text", action = ":lua Snacks.picker.grep()" },
            { icon = "\u{f015b} ", key = "n", desc = "New file", action = ":ene | startinsert" },
            { icon = "\u{f01c3} ", key = "e", desc = "Explorer", action = ":lua Snacks.explorer()" },
            { icon = "\u{f135} ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = "\u{f085} ", key = "m", desc = "Mason", action = ":Mason" },
            { icon = "\u{f017} ", key = "s", desc = "Session", action = ":lua require('persistence').load()" },
            { icon = "\u{f08b} ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
      notifier = {
        enabled = true,
        style = "compact",
        timeout = 3000,
      },
      indent = {
        enabled = true,
        indent = {
          char = "│",
          only_scope = false,
          only_current = false,
        },
        scope = {
          enabled = true,
          char = "│",
        },
        animate = {
          enabled = false,
        },
      },
      scroll = { enabled = true },
      terminal = {
        enabled = true,
        win = {
          position = "float",
          border = "rounded",
          width = 0.7,
          height = 0.55,
          backdrop = false,
        },
      },
      bigfile = { enabled = true },
      quickfile = { enabled = true },
    },
    config = function(_, opts)
      require("snacks").setup(opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "snacks_dashboard",
        callback = function()
          vim.opt_local.cursorline = true
        end,
      })
    end,
    keys = {
      { "<leader>e", smart_explorer, desc = "Explorer" },
      { "<leader>ff", function() snacks().picker.files() end, desc = "Найти файлы" },
      { "<leader>fg", function() snacks().picker.grep() end, desc = "Найти текст" },
      { "<leader>fb", function() snacks().picker.buffers() end, desc = "Найти буферы" },
      { "<leader>fh", function() snacks().picker.help() end, desc = "Поиск по help" },
      { "<leader>gs", function() snacks().picker.git_status() end, desc = "Git status" },
      { "<leader>sd", function() snacks().picker.diagnostics() end, desc = "Поиск диагностик" },
      { "<leader>ss", function() snacks().picker.lsp_symbols() end, desc = "LSP symbols" },
      { "<leader>bd", function() snacks().bufdelete() end, desc = "Удалить буфер" },
      { "<leader>bc", function() snacks().bufdelete.other() end, desc = "Удалить другие буферы" },
      { "<leader>bX", function() snacks().bufdelete.all() end, desc = "Удалить все буферы" },
      {
        [[<C-\>]],
        function()
          snacks().terminal()
        end,
        mode = { "n", "t", "i" },
        desc = "Терминал (toggle)",
      },
      { "<leader>rg", function() snacks().terminal("go test ./...") end, desc = "go test ./..." },
      { "<leader>rt", function() snacks().terminal("cargo test") end, desc = "cargo test" },
      { "<leader>rb", function() snacks().terminal("cargo build") end, desc = "cargo build" },
    },
  },
}
