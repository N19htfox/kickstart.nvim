--=============================================================================.
--== lazydev.lua
--== -------------------------------------------------------------------------
--== Plugin specific configuration for lazydev plugin in this neovim
--== environment.
--==
--==  Project: Neovim Configuration
--==   Author: Wesley DeMarco
--==     Date: 2024-12-23
--== Revision: 1
--==...........................................................................=
-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
-- used for completion, annotations and signatures of Neovim apis
return
{
    ft = 'lua',
    opts =
    {
        library =
        {
            -- Load luvit types when the `vim.uv` word is found
            {
                path = 'luvit-meta/library',
                words = { 'vim%.uv' }
            },
        },
    },
}
