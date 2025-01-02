--=============================================================================.
--== clear_hlsearch.lua
--== -------------------------------------------------------------------------
--== Script to automatically hide the highlighting from the last search pattern
--== when we're done with the search. Highlighting can be restored by requesting
--== the next match again or starting a new search.
--==
--==  Project: Neovim Environment
--==   Author: Wesley DeMarco
--==     Date: 2025-01-02
--== Revision: 0
--==...........................................................................=
--=============================================================================.
--== manage_hlsearch
--== -------------------------------------------------------------------------
--== Function to monitor keystrokes and determine if we should show or clear
--== search highlighting.
--==
--== Input:
--==    char    | The keyboard character received
--==
--== Output:
--==    N / A
--==...........................................................................=
local function manage_hlsearch( char )
    local key = vim.fn.keytrans( char )

    -- Patterns to show search highlight on --
    local show_keys =
    {
        'n', 'N',
        '*', '#',
        '?', '/',
    }

    -- Patterns to clear search highlight on --
    local clear_keys =
    {
        'a', 'A',
        'i', 'I',
        'd', 'D',
        'c', 'C',
        's', 'S',
        'x', 'X',
        'p', 'P',
        'u', 'U',
        '<C-R>',
        '<C-A>', '<C-X>',
        '.',
        'J',
        'o', 'O',
        '~',
        '<', '>',
        '=',
    }

    -- Check if the observed keystroke is in either of the tables --
    if vim.fn.mode() == 'n' or vim.fn.mode() == 'v' then
        -- Keystrokes to clear highlight --
        if vim.tbl_contains( clear_keys, key ) then
            vim.cmd( [[ :set nohlsearch ]] )

        -- Keystrokes to show highlight --
        elseif vim.tbl_contains( show_keys, key ) then
            vim.cmd( [[ :set hlsearch ]] )

        end
    end
end

-- Create a namespace for the listener --
local clearhl_ns = vim.api.nvim_create_namespace( 'clear_hlsearch' )

-- Add the manage_hlsearch() function as a keyboard listener in vim --
vim.on_key( manage_hlsearch, clearhl_ns )
