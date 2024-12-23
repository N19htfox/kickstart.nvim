--=============================================================================.
--== todo-comments.lua
--== -------------------------------------------------------------------------
--== Plugin specific configuration for todo-comments plugin in this neovim
--== environment.
--==
--==  Project: Neovim Configuration
--==   Author: Wesley DeMarco
--==     Date: 2024-12-23
--== Revision: 1
--==...........................................................................=
return
{
    event = 'VimEnter',
    dependencies =
    {
        'nvim-lua/plenary.nvim'
    },
    opts =
    {
        signs = false,
    },
}
