--=============================================================================.
--== neominimap.lua
--== -------------------------------------------------------------------------
--== Configuration for the neominimap plugin for this neovim environment.
--==
--==  Project: Neovim Configuration
--==   Author: Wesley DeMarco
--==     Date: 2024-12-26
--== Revision: 0
--==...........................................................................=
return
{
    version = "v3.*.*",
    enabled = true,
    lazy = false, -- NOTE: NO NEED to Lazy load
    -- Optional
    keys = {
        -- Global Minimap Controls
        { "<leader>nm", "<cmd>Neominimap toggle<cr>", desc = "Toggle global minimap" },
        { "<leader>no", "<cmd>Neominimap on<cr>", desc = "Enable global minimap" },
        { "<leader>nc", "<cmd>Neominimap off<cr>", desc = "Disable global minimap" },
        { "<leader>nr", "<cmd>Neominimap refresh<cr>", desc = "Refresh global minimap" },

        -- Window-Specific Minimap Controls
        { "<leader>nwt", "<cmd>Neominimap winToggle<cr>", desc = "Toggle minimap for current window" },
        { "<leader>nwr", "<cmd>Neominimap winRefresh<cr>", desc = "Refresh minimap for current window" },
        { "<leader>nwo", "<cmd>Neominimap winOn<cr>", desc = "Enable minimap for current window" },
        { "<leader>nwc", "<cmd>Neominimap winOff<cr>", desc = "Disable minimap for current window" },

        -- Tab-Specific Minimap Controls
        { "<leader>ntt", "<cmd>Neominimap tabToggle<cr>", desc = "Toggle minimap for current tab" },
        { "<leader>ntr", "<cmd>Neominimap tabRefresh<cr>", desc = "Refresh minimap for current tab" },
        { "<leader>nto", "<cmd>Neominimap tabOn<cr>", desc = "Enable minimap for current tab" },
        { "<leader>ntc", "<cmd>Neominimap tabOff<cr>", desc = "Disable minimap for current tab" },

        -- Buffer-Specific Minimap Controls
        { "<leader>nbt", "<cmd>Neominimap bufToggle<cr>", desc = "Toggle minimap for current buffer" },
        { "<leader>nbr", "<cmd>Neominimap bufRefresh<cr>", desc = "Refresh minimap for current buffer" },
        { "<leader>nbo", "<cmd>Neominimap bufOn<cr>", desc = "Enable minimap for current buffer" },
        { "<leader>nbc", "<cmd>Neominimap bufOff<cr>", desc = "Disable minimap for current buffer" },

        ---Focus Controls
        { "<leader>nf", "<cmd>Neominimap focus<cr>", desc = "Focus on minimap" },
        { "<leader>nu", "<cmd>Neominimap unfocus<cr>", desc = "Unfocus minimap" },
        { "<leader>ns", "<cmd>Neominimap toggleFocus<cr>", desc = "Switch focus on minimap" },
    },

    init = function()
        -- Main configuration --
        vim.g.neominimap =
        {
            -- Enable the plugin by default
            auto_enable = true,

            -- Log level
            log_level = vim.log.levels.OFF,

            -- Notification level
            notification_level = vim.log.levels.INFO,

            -- Path to the log file
            log_path = vim.fn.stdpath( 'data' ) .. "/neominimap.log",

            -- Minimap will not be created for buffers of these types
            exclude_filetypes =
            {
                "help",
                "bigfile",
            },

            -- Minimap will not be created for buffers of these types
            exclude_buftypes =
            {
                "nofile",
                "nowrite",
                "quickfix",
                "terminal",
                "prompt",
            },

            -- When false is returned, the minimap will not be created for this buffer
            buf_filter = function()
                return true
            end,

            -- When false is returned, the minimap will not be created for this window
            win_filter = function()
                return true
            end,

            -- When false is returned, the minimap will not be created for this tab
            tab_filter = function()
                return true
            end,

            -- How many columns a dot should span
            x_multiplier = 4, ---@type integer

            -- How many rows a dot should span
            y_multiplier = 1, ---@type integer

            -- Either `split` or `float`
            -- When layout is set to `float`,
            -- the minimap will be created in floating windows attached to all suitable windows
            -- When layout is set to `split`,
            -- the minimap will be created in one split window
            layout = "float",

            --- Used when `layout` is set to `split`
            split =
            {
                minimap_width = 20,

                -- Always fix the width of the split window
                fix_width = false,

                -- Split Direction - left or right
                direction = "right",

                ---Automatically close the split window when it is the last window
                close_if_last_window = false,
            },

            --- Used when `layout` is set to `float`
            float =
            {
                minimap_width = 20,

                --- If set to nil, there is no maximum height restriction
                max_minimap_height = nil,

                margin =
                {
                    right = 0,
                    top = 0,
                    bottom = 0,
                },

                z_index = 1,

                --- Border style of the floating window.
                --- Accepts all usual border style options (e.g., "single", "double")
                window_border = "single",
            },

            -- For performance issue, when text changed,
            -- minimap is refreshed after a certain delay
            -- Set the delay in milliseconds
            delay = 200,

            -- Sync the cursor position with the minimap
            sync_cursor = true,

            click = {
                -- Enable mouse click on minimap
                enabled = false,

                -- Automatically switch focus to minimap when clicked
                auto_switch_focus = true,
            },

            diagnostic =
            {
                enabled = true,
                severity = vim.diagnostic.severity.WARN,
                mode = "line",
                priority = {
                    ERROR = 100,
                    WARN = 90,
                    INFO = 80,
                    HINT = 70,
                },
                icon = {
                    ERROR = "󰅚 ",
                    WARN = "󰀪 ",
                    INFO = "󰌶 ",
                    HINT = " ",
                },
            },

            git =
            {
                enabled = true,
                mode = "sign",
                priority = 6,
                icon =
                {
                    add = "+ ",
                    change = "~ ",
                    delete = "- ",
                },
            },

            search =
            {
                enabled = false,
                mode = "line",
                priority = 20,
                icon = "󰱽 ",
            },

            treesitter =
            {
                enabled = true,
                priority = 200,
            },

            mark =
            {
                enabled = false,
                mode = "icon",
                priority = 10,
                key = "m",
                show_builtins = false,
            },

            fold =
            {
                -- Considering fold when rendering minimap
                enabled = true,
            },

            ---Overrite the default winopt
            winopt = function( opt, winid )
            end,

            ---Overrite the default bufopt
            bufopt = function( opt, bufnr )
            end,

            handlers = {},
        }

        -- The following options are recommended when layout == "float" --
        vim.opt.wrap = false

        -- Set scrolloff to a value larger than the width of the minimap --
        -- Note: Include the character on each side for the border (+2) --
        vim.opt.sidescrolloff = vim.g.neominimap.float.minimap_width + 2

    end,
}
