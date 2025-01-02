--=============================================================================.
--== keymaps.lua
--== -------------------------------------------------------------------------
--== Keymap configuration for this neovim environment.
--==
--==  Project: Neovim Configuration
--==   Author: Wesley DeMarco
--==     Date: 2024-12-23
--== Revision: 1
--==...........................................................................=
-- Set <space> as the leader key
-- NOTE: Must happen before plugins are loaded
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--=============================================================================.
--==                          Editor Commands
--==...........................................................................=
-- Normal Mode Commands --
vim.keymap.set( 'n', 'Q',         '<cmd>qa<cr>'   ) -- Quit all buffers
vim.keymap.set( 'n', 'W',         '<cmd>wa<cr>'   ) -- Save all buffers
vim.keymap.set( 'n', 'X',         '<cmd>xa<cr>'   ) -- Save and quit all buffers
vim.keymap.set( 'n', '<C-Q>',     '<cmd>qa!<cr>'  ) -- Force quit all buffers
vim.keymap.set( 'n', '<C-W>',     '<cmd>wa!<cr>'  ) -- Force save all buffers
vim.keymap.set( 'n', '<C-X>',     '<cmd>xa!<cr>'  ) -- Force save and quit all
vim.keymap.set( 'n', '<leader>q', '<cmd>q<cr>'    ) -- Quit current buffer
vim.keymap.set( 'n', '<leader>w', '<cmd>w<cr>'    ) -- Save current buffer
vim.keymap.set( 'n', '<leader>x', '<cmd>x<cr>'    ) -- Save and quit current
vim.keymap.set( 'n', '<leader>Q', '<cmd>q!<cr>'   ) -- Force Quit current
vim.keymap.set( 'n', '<leader>W', '<cmd>w!<cr>'   ) -- Force Save current
vim.keymap.set( 'n', '<leader>X', '<cmd>x!<cr>'   ) -- Force Save & quit current

-- Clear highlight on escape --
vim.keymap.set( 'n', '<esc>', '<silent><cmd>noh<cr><esc>' )

-- Cut to Register instead of clipboard --
vim.keymap.set( { 'n', 'v' }, 'd', '"xd' )
vim.keymap.set( { 'n', 'v' }, 'D', '"xD' )
vim.keymap.set( { 'n', 'v' }, 'x', '"xx' )

-- Change to C Register --
vim.keymap.set( { 'n', 'v' } , 'c', '"cc' )

-- Paste overwrite to null Register --
vim.keymap.set( 'v', 'p', '"_dp' )
vim.keymap.set( 'v', 'P', '"_dP' )

-- Maintain visual selection on indent change --
vim.keymap.set( 'v', '>', '>gv' )
vim.keymap.set( 'v', '<', '<gv' )

-- Terminal insert mode to normal mode --
vim.keymap.set( 't', '<esc>', '<C-\\><C-n>' )

--=============================================================================.
--==                            Split Navigation
--==...........................................................................=
-- Inc/Dev Split Size --
-- TODO: Implement this cleanly

-- Move to split left  --
vim.keymap.set( { 'n', 'v', 'i', 't' }, '<c-w><c-h>', '<cmd>wincmd h<cr>' )

-- Move to split down  --
vim.keymap.set( { 'n', 'v', 'i', 't' }, '<c-w><c-j>', '<cmd>wincmd j<cr>' )

-- Move to split up --
vim.keymap.set( { 'n', 'v', 'i', 't' }, '<c-w><c-k>', '<cmd>wincmd k<cr>' )

-- Move to split right --
vim.keymap.set( { 'n', 'v', 'i', 't' }, '<c-w><c-l>', '<cmd>wincmd l<cr>' )

--=============================================================================.
--==                             Tab Navigation
--==...........................................................................=
vim.keymap.set( 'n', '<leader>td', '<cmd>tabclose<cr>'  ) -- Close current tab
vim.keymap.set( 'n', '<leader>tD', '<cmd>tabclose!<cr>' ) -- Close current tab
vim.keymap.set( 'n', '<leader>tn', '<cmd>tabnew<cr>'    ) -- Create new tab

--=============================================================================.
--==                            Buffer Navigation
--==...........................................................................=
vim.keymap.set( 'n', 'L', '<cmd>bnext<cr>'             ) -- Next Buffer
vim.keymap.set( 'n', 'H', '<cmd>bprev<cr>'             ) -- Previous Buffer
vim.keymap.set( 'n', '<leader>bd', '<cmd>bdelete<cr>'  ) -- Close current buffer
vim.keymap.set( 'n', '<leader>bD', '<cmd>bdelete!<cr>' ) -- Close current buffer
vim.keymap.set( 'n', '<leader>bn', '<cmd>enew<cr>'     ) -- Create new buffer

--=============================================================================.
--==                           NvimTree Navigation
--==...........................................................................=
-- Open/Close NvimTree --
vim.keymap.set( { 'n', 'v', 'i', 't' }, '<c-e>', '<cmd>NvimTreeToggle<cr>' )

--=============================================================================.
--==                          Toggle Terminal Window
--==...........................................................................=
vim.keymap.set( { 'n' }, '<leader>\\', '<cmd>ToggleTerm<cr>' )

--=============================================================================.
--==                              Argument Swap
--==...........................................................................=
vim.keymap.set( 'n', '[a', '<cmd>SidewaysLeft<cr>'      ) -- Swap with arg left
vim.keymap.set( 'n', ']a', '<cmd>SidewaysRight<cr>'     ) -- Swap with arg right
vim.keymap.set( 'n', '[[', '<cmd>SidewaysJumpLeft<cr>'  ) -- Jump to arg left
vim.keymap.set( 'n', ']]', '<cmd>SidewaysJumpRight<cr>' ) -- Jump to arg right

--=============================================================================.
--==                              Cursor Navigation
--==...........................................................................=
-- Allow cursor navigation in edit modes via ctrl + hjkl    --
-- NOTE: Normal and Visual modes can just use hjkl normally --
vim.keymap.set( { 'i', 't', 'c' }, '<c-h>', '<Left>'  )
vim.keymap.set( { 'i', 't', 'c' }, '<c-j>', '<Down>'  )
vim.keymap.set( { 'i', 't', 'c' }, '<c-k>', '<Up>'    )
vim.keymap.set( { 'i', 't', 'c' }, '<c-l>', '<Right>' )

-- Disable Arrow Keys ( hjkl is superior. Arrow keys are for the weak ) --
vim.keymap.set( { 'n', 'v', 'i', 't', 'c' }, '<Left>',  '' )
vim.keymap.set( { 'n', 'v', 'i', 't', 'c' }, '<Down>',  '' )
vim.keymap.set( { 'n', 'v', 'i', 't', 'c' }, '<Up>',    '' )
vim.keymap.set( { 'n', 'v', 'i', 't', 'c' }, '<Right>', '' )

--=============================================================================.
--==                            Toggle Colorizer
--==...........................................................................=
vim.keymap.set( { 'n' }, '<leader>ct', '<cmd>ColorizerToggle<cr>' )

--=============================================================================.
--==                            Toggle Alternate
--==...........................................................................=
-- TODO: Come up with a keybind for this
-- vim.keymap.set( { 'n' }, '???', '<cmd>ToggleAlternate' )

--=============================================================================.
--==                             Open Lazy Menu
--==...........................................................................=
vim.keymap.set( { 'n' }, '<leader>l', '<cmd>Lazy<cr>' )

--=============================================================================.
--==                            Open Themery Menu
--==...........................................................................=
vim.keymap.set( { 'n' }, '<leader>ch', '<cmd>Themery<cr>' )
