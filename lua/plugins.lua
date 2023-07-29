--      *************************************************************************************
--      ___          ___          ___       ___                     ___          ___
--     /\  \        /\  \        /\  \     /\  \         ___       /\__\        /\  \
--    /::\  \      /::\  \      /::\  \    \:\  \       /\  \     /:/  /       /::\  \
--   /:/\:\  \    /:/\:\  \    /:/\:\  \    \:\  \      \:\  \   /:/  /       /:/\ \  \
--  /:/  \:\__\  /::\~\:\  \  /::\~\:\  \   /::\  \     /::\__\ /:/  /  ___  _\:\~\ \  \
-- /:/__/ \:|__|/:/\:\ \:\__\/:/\:\ \:\__\ /:/\:\__\ __/:/\/__//:/__/  /\__\/\ \:\ \ \__\
-- \:\  \ /:/  /\/__\:\/:/  /\/_|::\/:/  //:/  \/__//\/:/  /   \:\  \ /:/  /\:\ \:\ \/__/
--  \:\  /:/  /      \::/  /    |:|::/  //:/  /     \::/__/     \:\  /:/  /  \:\ \:\__\
--   \:\/:/  /       /:/  /     |:|\/__/ \/__/       \:\__\      \:\/:/  /    \:\/:/  /
--    \::/__/       /:/  /      |:|  |                \/__/       \::/  /      \::/  /
--     ~~           \/__/        \|__|                             \/__/        \/__/
--     ************************************************************************************
--     ------------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '


require("lazy").setup({


  -- neosolarized theme for nvim
  {
    'svrana/neosolarized.nvim',
    dependencies = { 'tjdevries/colorbuddy.nvim' }
  },


  -- vim-tmux navigation
  "christoomey/vim-tmux-navigator",

  -- treesitter gives us highlighting features
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  'David-Kunz/markid', -- Markid mutes down the bright colors of treesitter

  -- devicons for telescope and lualine
  'nvim-lualine/lualine.nvim',

  -- For autocompletion
  'L3MON4D3/LuaSnip',                         -- snippets
  'onsails/lspkind-nvim',                     -- vscode like autocompletion
  'hrsh7th/cmp-buffer',                       -- nvim-cmp source for buffer words
  'hrsh7th/cmp-nvim-lsp',                     -- nvim-cmp source for neovim's built-in LSP
  'hrsh7th/nvim-cmp',                         -- Completion
  'neovim/nvim-lspconfig',                    -- LSP
  { 'williamboman/mason.nvim', lazy = true }, -- LSP server installer
  'williamboman/mason-lspconfig.nvim',

  -- autoparis and autotag
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',

  -- Telescope a fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    version = '0.1.1',                             -- telescope fuzzy finder
    -- or                            , branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } } -- common utilities
  },
  "nvim-telescope/telescope-file-browser.nvim",    -- synchronized creation, deletion, renaming and moving of files and folders



  -- bufferline gives us the tab view for nvim
  'akinsho/nvim-bufferline.lua',

  -- colorizer to view what the color looks like on the editor like in vs code
  'norcalli/nvim-colorizer.lua',

  -- Some LSP extenders
  'jose-elias-alvarez/null-ls.nvim', -- Use neovim as a language server to inject LSP disagnostics, code actions, and more via LUA
  'MunifTanjim/prettier.nvim',       -- Prettier plugin for NVIM's built in LSP client
  'glepnir/lspsaga.nvim',            -- provides the diagnostics functions for nvim

  -- tree-siter-markdown for lspsaga
  'MDeiml/tree-sitter-markdown',

  -- gitsigns on gutter
  'lewis6991/gitsigns.nvim',

  -- commenting shortcuts for nvim
  'tpope/vim-commentary',

  -- using which key
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timoutlen = 1
    end
  },
  -- toggle term, terminal for neovim
  'akinsho/toggleterm.nvim',

  -- Dashboard for neovim
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  }

}, {})
