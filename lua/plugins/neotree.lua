return {
    {
        "nvim-neo-tree/neo-tree.nvim",
         keys = {
            { "<leader>e", "<cmd>Neotree toggle filesystem left<CR>", desc = "Проводник файлов" },
            { "<leader>be", "<cmd>Neotree toggle buffers left<CR>", desc = "Проводник открытых буферов" },
        },
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                hide_root_node = false,
                retain_hidden_root_indent = true,

                source_selector = {
                    winbar = true,
                    statusline = false,
                    show_scrolled_off_parent_node = false,
                    sources = {
                        { source = "filesystem", display_name = "\u{f07c} Files" },
                        { source = "buffers",    display_name = "\u{f0c9} Buffers" },
                    },
                    content_layout = "center",
                    tabs_layout = "equal",
                },

                window = {
                    width = 36,
                    position = "left",
                    mappings = {
                        ["<space>"] = "none",
                        ["<cr>"] = "open",
                        ["S"] = "open_split",
                        ["s"] = "open_vsplit",
                        ["<"] = "prev_source",
                        [">"] = "next_source",
                    },
                },

                filesystem = {
                    bind_to_cwd = true,
                    follow_current_file = { enabled = true },
                    use_libuv_file_watcher = true,
                    filtered_items = {
                        visible = false,
                        show_hidden_count = false,
                        hide_dotfiles = false,
                        hide_gitignored = false,
                        hide_by_name = { ".DS_Store", "thumbs.db", ".git" },
                    },
                },

                event_handlers = {
                  {
                    event = "neo_tree_buffer_enter",
                    handler = function()
                    vim.opt_local.number = true
                    vim.opt_local.relativenumber = true
                    end,
                  },
                },

                default_component_configs = {
                    container = { enable_character_fade = true },
                    indent = {
                        indent_size = 2,
                        padding = 1,
                        with_markers = true,
                        indent_marker = "│",
                        last_indent_marker = "└",
                        highlight = "NeoTreeIndentMarker",
                    },
                    icon = {
                        folder_closed = "",
                        folder_open = "",
                        folder_empty = "  ",
                        default = "  ",
                        highlight = "NeoTreeFileIcon",
                    },
                    name = {
                        trailing_slash = false,
                        use_git_status_colors = true,
                    },
                    git_status = {
                        symbols = {
                            added     = "✚",
                            modified  = "",
                            deleted   = "✖",
                            renamed   = "  ",
                            untracked = "",
                            ignored   = "",
                            unstaged  = "  ",
                            staged    = "",
                            conflict  = "",
                        },
                    },
                },
            })
        end,
    },
}
