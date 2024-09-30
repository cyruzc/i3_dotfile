return {
    -- tmux 窗口导航插件
    -- {
    --     "christoomey/vim-tmux-navigator",
    --     event = "VeryLazy",
    -- },
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local conform = require("conform")

            conform.setup({
                formatters_by_ft = {
                    json = { "clang-format" },
                    lua = { "stylua" },
                    c = { "clang-format" },
                    rust = { "rust-format" }
                },
                format_on_save = {
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 1000,
                },
            })

            vim.keymap.set({ "n", "v" }, "<leader>mp", function()
                conform.format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 1000,
                })
            end, { desc = "Format file or range (in visual mode)" })
        end,
    },
    -- {
    --     "mfussenegger/nvim-lint",
    --     event = {
    --         "BufReadPre",
    --         "BufNewFile",
    --     },
    --     config = function()
    --         local lint = require("lint")

    --         lint.linters_by_ft = {
    --             python = { "pylint" },
    --         }

    --         local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    --         vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    --             group = lint_augroup,
    --             callback = function()
    --                 lint.try_lint()
    --             end,
    --         })
    --     end,
    -- },
    -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true,         -- use a classic bottom cmdline for search
                command_palette = true,       -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false,       -- add a border to hover docs and signature help
            },

        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            -- "rcarriga/nvim-notify",
        }
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
    },
    -- -- lualine: 状态栏插件
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require('lualine').setup {
                options = { theme = 'tokyonight' },
            }
        end,
    },

    -- Bufferline: 缓冲区线插件
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        version = "*",
        opts = {
            options = {
                mode = "tabs",
            },
        },
    },
    -- comment
    {
        'numToStr/Comment.nvim',
        event = { "BufReadPre", "BufNewFile" },
        config = true
    },
    -- -- nvim-treesitter 高亮解析器
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = {
            "windwp/nvim-ts-autotag",
        },
        config = function()
            -- import nvim-treesitter plugin
            local treesitter = require("nvim-treesitter.configs")

            -- configure treesitter
            treesitter.setup({ -- enable syntax highlighting
                highlight = {
                    enable = true,
                },
                -- enable indentation
                indent = { enable = true },
                -- enable autotagging (w/ nvim-ts-autotag plugin)
                autotag = {
                    enable = true,
                },
                -- ensure these language parsers are installed
                ensure_installed = {
                    "json",
                    "toml",
                    "yaml",
                    "markdown",
                    "markdown_inline",
                    "bash",
                    "lua",
                    "vim",
                    "dockerfile",
                    "gitignore",
                    "vimdoc",
                    "c",
                    "lua",
                    "rust",
                    "go"
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                        node_decremental = "<bs>",
                    },
                },
            })
        end,
    }
}
