--=============================================================================.
--== themery.lua
--== -------------------------------------------------------------------------
--== Configuration for themery plugin for this neovim environment.
--==
--==  Project: Neovim Configuration
--==   Author: Wesley DeMarco
--==     Date: 2024-12-24
--== Revision: 0
--==...........................................................................=
return {
    lazy = false,
    config = function()
        local available_themes = vim.fn.getcompletion( "", "color" )
        local colorschemes = {}
        for _, colorscheme in ipairs( available_themes ) do
            table.insert( colorschemes, colorscheme )
        end

        require( 'themery' ).setup(
        {
            themes = colorschemes,
            globalbefore = [[ -- Executed before each.]],
            globalAfter = [[ -- Executed after each. ]]
        })
    end
}
