--=============================================================================.
--== gitsigns.lua
--== -------------------------------------------------------------------------
--== Plugin specific configuration for gitsigns plugin in this neovim
--== environment.
--==
--==  Project: Neovim Configuration
--==   Author: Wesley DeMarco
--==     Date: 2024-12-23
--== Revision: 1
--==...........................................................................=
-- See `:help gitsigns` to understand what the configuration keys do
-- Adds git related signs to the gutter, as well as utilities for managing changes
return
{
    opts =
    {
        signs =
        {
            add          = { text = '+' },
            change       = { text = '~' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
        },
    },
}
