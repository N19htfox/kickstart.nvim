--=============================================================================.
--== flashyank.lua
--== -------------------------------------------------------------------------
--== Script defining a behavior to flash the visual selection of yanked text to
--== make it clear what text your just yanked.
--==
--==  Project: Neovim Configuration
--==   Author: Wesley DeMarco
--==     Date: 2024-12-23
--== Revision: 1
--==...........................................................................=
-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd( 'TextYankPost',
{
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup( 'kickstart-highlight-yank', { clear = true } ),
    callback = function()
        vim.highlight.on_yank()
    end,
} )
