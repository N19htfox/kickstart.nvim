--=============================================================================.
--== settings.lua
--== -------------------------------------------------------------------------
--== Main settings file for this neovim environment.
--==
--==  Project: Neovim Configuration
--==   Author: Wesley DeMarco
--==     Date: 2024-12-23
--== Revision: 0
--==...........................................................................=
-- Line Numbering --
vim.opt.number = true
vim.opt.relativenumber = false

-- Encoding --
vim.scriptencoding   = 'utf-8'
vim.opt.encoding     = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- prevent extends and precedes from permanently hiding text
vim.opt.sidescrolloff = math.max( vim.o.sidescrolloff, 5 )

-- Search Highlighting --
vim.opt.hlsearch  = true
vim.opt.incsearch = true

-- Case-insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Allow usage of the mouse in all modes --
vim.opt.mouse = 'a'

-- Default yank uses system clipboard --
vim.opt.clipboard = 'unnamedplus'

-- Tabs --
vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true

-- Disable Word Wrapping --
vim.wo.wrap = false

-- Use block cursor in all modes --
vim.o.guicursor = 'a:block'

-- Make autocompletion case insensitive --
vim.opt.ignorecase = true
vim.opt.smartcase  = true

-- Swap files --
vim.opt.swapfile = true     -- Use swap files
vim.opt.autoread = false    -- Don't automatically update buffers when changed on disk

-- Save undo history
vim.opt.undofile = true

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Enable the use of the sign column --
vim.opt.signcolumn = 'yes'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Display only one status line for the entire neovim instance --
vim.opt.laststatus = 3

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars =
{
    tab      = "⇥ ",
    eol      = "↲",
    precedes = "❮",
    extends  = "❯",
    --precedes = "❬",
    --extends  = "❭",
    trail    = "·",
    space    = "·",
    nbsp     = "·",
}

-- Enable highlighting of the current cursor line --
vim.opt.cursorline = true

-- Enable 24bit Colors --
vim.opt.termguicolors = true

-- Disable netrw in favor of nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
