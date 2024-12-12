-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

local include =
{
    { 'tpope/vim-sleuth', enabled = false },
    'lewis6991/gitsigns.nvim',
    'folke/which-key.nvim',
    'nvim-telescope/telescope.nvim',
    'folke/lazydev.nvim',
    'Bilal2453/luvit-meta',
    'neovim/nvim-lspconfig',
    'stevearc/conform.nvim',
    'hrsh7th/nvim-cmp',
    { 'folke/tokyonight.nvim', enabled = false },
    'folke/todo-comments.nvim',
    'nvim-treesitter/nvim-treesitter',
    'echasnovski/mini.nvim',
}

local log_file = vim.fn.stdpath 'data' .. '/lazy_errors.log'
local err_count = 0

-- Function to log errors --
local function log_error(message)
  local file = io.open(log_file, 'a')

  if file then
    local date_str = '[' .. os.date '%Y-%m-%d %H:%M:%S' .. '] '
    file:write(date_str .. message .. '\n')
    file:close()
  end
end

-- Function to safely require a plugin and load its config if present --
local function srequire(module)
  -- Get config module path --
  local config = 'plugins.' .. module:match('.*/(.*)'):gsub('%.(.*)$', ''):gsub('%.', '_')
  local success, result = pcall(require, config)

  -- Config was found and loaded successfully, return the config table --
  if success then
    return result
  end

  -- If config was found but it has errors, log them --
  local msg = ("module '%s' not found:"):format(config:gsub('-', '%%-'))
  if not result:find(msg) then
    log_error(result)
    err_count = err_count + 1
  end

  -- If config was not found, return nil to indicate default configuration --
  return nil
end

-- Parse Include plugins looking for config --
local plugins = {}
for i, plugin in ipairs(include) do
  if type(plugin) == 'string' then
    plugins[i] = { plugin }
  elseif type(plugin) == 'table' then
    plugins[i] = plugin
  end

  local config = srequire(plugins[i][1])

  if config ~= nil then
    plugins[i] = vim.tbl_extend('force', plugins[i], config)
  end
end

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
require('lazy').setup(plugins, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- After lazy completes, notify of errors if any --
if err_count > 0 then
    vim.api.nvim_echo(
    {
         {
             'Failed to load ' .. err_count .. ' plugins.' ..
             'See ' .. log_file .. ' for details.\n',
             'ErrorMsg'
         }
    }, true, {} )
end
