--=============================================================================.
--== $Module: init.lua                                                         $
--== -------------------------------------------------------------------------
--== Main initialization script for the configuration of this neovim
--== environment.
--==
--== $  Author: Wesley DeMarco                                                 $
--== $ Project: Neovim Configuration                                           $
--== $    Date: 2024-12-14 22:54:00                                            $
--== $Revision: r0                                                             $
--==...........................................................................=
-- Load Settings --
require( 'settings' )

-- Load Keymaps --
require( 'keymaps' )

-- Load Scripts --
require( 'scripts' )

-- Load Plugins --
require( 'plugins' )
