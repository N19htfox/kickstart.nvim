--=============================================================================.
--== plugins.lua
--== -------------------------------------------------------------------------
--== Script containing references for each plugin to be loaded for this neovim
--== environment and functions to assist LazyVim plugin manager in loading the
--== plugins and invoking any plugin specific configuration files should they
--== exist.
--==
--==  Project: Neovim Configuration
--==   Author: Wesley DeMarco
--==     Date: 2024-12-23
--== Revision: 1
--==...........................................................................=
--=============================================================================.
--==                     Install LazyVim Package Manager
--==...........................................................................=
-- See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
-- Establish the path where LazyVim should reside --
local lazypath = vim.fn.stdpath( 'data' ) .. '/lazy/lazy.nvim'

-- If LazyVim is not already installed, install it --
if not ( vim.uv or vim.loop ).fs_stat( lazypath ) then

    -- LazyVim github repo url --
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'

    -- Build git command to pull LazyVim --
    local out = vim.fn.system
    {
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable',
        lazyrepo,
        lazypath
    }

    -- If LazyVim failed to clone from github, Display an error --
    if vim.v.shell_error ~= 0 then
        error( 'Error cloning lazy.nvim:\n' .. out )
    end
end

-- Give vim the path to the package manager --
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend( lazypath )

--=============================================================================.
--==                          List Plugins to Include
--==...........................................................................=
local include =
{
    'lewis6991/gitsigns.nvim',
    'folke/which-key.nvim',
    'nvim-telescope/telescope.nvim',
    'folke/lazydev.nvim',
    'Bilal2453/luvit-meta',
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'folke/todo-comments.nvim',
    'L3MON4D3/LuaSnip',
    'nvim-treesitter/nvim-treesitter',
    'echasnovski/mini.nvim',
    'zaldih/themery.nvim',
    'numToStr/Comment.nvim',
    'nvim-tree/nvim-tree.lua',
    'Isrothy/neominimap.nvim',

    --TODO: Enable these one by one
    -- 'rmagatti/alternate-toggler',
    -- 'windwp/nvim-autopairs',
    -- 'mg979/vim-visual-multi',
    -- 'gcmt/wildfire.vim',
    -- 'tpope/vim-surround',
    -- 'nvim-lualine/lualine.nvim',
    -- 'norcalli/nvim-colorizer.lua',
    -- 'akinsho/toggleterm.nvim',
    -- 'windwp/nvim-ts-autotag',
    -- 'j-hui/fidget.nvim',
    -- 'AndrewRadev/sideways.vim'
    -- 'rktjmp/lush.nvim'
}

-- Define logfile for any errors that may occur when installing plugins --
local log_file = vim.fn.stdpath( 'data' ) .. '/lazy_errors.log'

-- Count errors that may show up so we can display the count later --
local err_count = 0

--=============================================================================.
--== log_errors
--== -------------------------------------------------------------------------
--== Function to log errors to the file defined above.
--==
--== Input:
--==    string message    | Error message to write to the log file
--==
--== Output:
--==    N / A
--==...........................................................................=
local function log_error( message )
    -- Open the log file for appending --
    local file = io.open( log_file, 'a' )

    -- If the file succesfully opened, write the error --
    if file then
        -- Include the date and time --
        local date_str = '[' .. os.date '%Y-%m-%d %H:%M:%S' .. '] '

        -- Write the message string --
        file:write( date_str .. message .. '\n' )

        -- Close the file --
        file:close()
    end
end

--=============================================================================.
--== srequire
--== -------------------------------------------------------------------------
--== Function to safely require a plugin and load its config file if and only
--== if it is present. The config file is not required so we want to gracefully
--== load the plugin successfully if the config file is not found.
--==
--== Input:
--==    string module     | Locator / Path of the module to load
--==
--== Output:
--==    table             | Contents of the configuration loaded
--==...........................................................................=
local function srequire( module )
    -- Get config module path --
    local config = 'plugins.' .. module:match( '.*/(.*)' )
                                       :gsub( '%.(.*)$', '' )
                                       :gsub( '%.', '_' )
    -- Call require on this config catching any error message --
    local success, result = pcall( require, config )

    -- Config was found and loaded successfully, return the config table --
    if success then
      return result
    end

    -- If config was found but it has errors, log them --
    local msg = ( "module '%s' not found:" ):format( config:gsub( '-', '%%-' ) )
    if not result:find( msg ) then
        log_error( result )
        err_count = err_count + 1
    end

    -- If config was not found, return nil to indicate default configuration --
    return nil
end

-- Parse Include plugins looking for config --
local plugins = {}
for i, plugin in ipairs( include ) do
    if type( plugin ) == 'string' then
        plugins[i] = { plugin }
    elseif type( plugin ) == 'table' then
        plugins[i] = plugin
    end

    local config = srequire( plugins[i][1] )

    if config ~= nil then
        plugins[i] = vim.tbl_extend( 'force', plugins[i], config )
    end
end

--=============================================================================.
--==                         Call Lazy to load plugins
--==...........................................................................=
require( 'lazy' ).setup(plugins,
{
    ui =
    {
        icons = {},
    },
})

-- After lazy completes, notify of errors if any --
if err_count > 0 then
    vim.api.nvim_echo(
    {
         {
             'Failed to load ' .. err_count .. ' plugins.' ..
             'See ' .. log_file .. ' for details.\n',
             'ErrorMsg'
         }
    }, true, {} )
end
