--=============================================================================.
--== themery.lua
--== -------------------------------------------------------------------------
--== Configuration for themery plugin for this neovim environment.
--==
--==  Project: Neovim Configuration
--==   Author: Wesley DeMarco
--==     Date: 2024-12-24
--== Revision: 1
--==...........................................................................=
return {
    lazy = false,
    config = function()
        -- Gather the available colorschemes from vim --
        local available_themes = vim.fn.getcompletion( "", "color" )

        -- Populate a table with the discovered colorschemes --
        local colorschemes = {}
        for _, colorscheme in ipairs( available_themes ) do
            table.insert( colorschemes, colorscheme )
        end

        -- Initialize Themery plugin with the available colorschemes --
        require( 'themery' ).setup(
        {
            themes = colorschemes,
            globalbefore = [[ -- Executed before each.]],
            globalAfter = [[ -- Executed after each. ]]
        })
    end
}
