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
