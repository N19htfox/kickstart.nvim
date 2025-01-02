--=============================================================================.
--== scripts.lua
--== -------------------------------------------------------------------------
--== Module to load any small scripts to use in this neovim environment.
--==
--==  Project: Neovim Configuration
--==   Author: Wesley DeMarco
--==     Date: 2024-12-23
--== Revision: 1
--==...........................................................................=
-- Script to briefly flash highlight on yanked text --
require( 'scripts.flashyank' )

-- Script to clear highlight search automatically when you're done with it --
require( 'scripts.clear_hlsearch' )
