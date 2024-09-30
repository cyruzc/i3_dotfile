return {
    -- Colorscheme: TokyoNight
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end,
    },

    -- -- nvim-web-devicons: 图标插件
    -- {
    --     "nvim-tree/nvim-web-devicons",
    --     lazy = true
    -- },


    -- -- Gitsigns: Git 集成插件
    -- {
    --     "lewis6991/gitsigns.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require('gitsigns').setup()
    --     end,
    -- },
}
