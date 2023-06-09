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
local status, packer = pcall(require, 'packer')
if (not status) then
  print("packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- packer is self managed
  use 'wbthomason/packer.nvim'


  -- neosolarized theme for nvim
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }


  -- vim-tmux navigation
  use { "christoomey/vim-tmux-navigator" }

  -- treesitter gives us highlighting features
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'David-Kunz/markid' -- Markid mutes down the bright colors of treesitter

  -- devicons for telescope and lualine
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'

  -- For autocompletion
  use 'L3MON4D3/LuaSnip' -- snippets
  use 'onsails/lspkind-nvim' -- vscode like autocompletion
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'neovim/nvim-lspconfig' -- LSP
  use 'williamboman/mason.nvim' -- LSP server installer
  use 'williamboman/mason-lspconfig.nvim'

  -- autoparis and autotag
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- Telescope a fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1', -- telescope fuzzy finder
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } } -- common utilities
  }
  use "nvim-telescope/telescope-file-browser.nvim" -- synchronized creation, deletion, renaming and moving of files and folders

  -- bufferline gives us the tab view for nvim
  use 'akinsho/nvim-bufferline.lua'

  -- colorizer to view what the color looks like on the editor like in vs code
  use 'norcalli/nvim-colorizer.lua'

  -- Some LSP extenders
  use 'jose-elias-alvarez/null-ls.nvim' -- Use neovim as a language server to inject LSP disagnostics, code actions, and more via LUA
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for NVIM's built in LSP client
  use 'glepnir/lspsaga.nvim' -- provides the diagnostics functions for nvim

  -- tree-siter-markdown for lspsaga
  use 'MDeiml/tree-sitter-markdown'

  -- gitsigns on gutter
  use 'lewis6991/gitsigns.nvim'

  -- commenting shortcuts for nvim
  use 'tpope/vim-commentary'

  -- some plugins for markdown files
  use 'preservim/vim-markdown'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end, -- For markdown preview
  })
  use 'dhruvasagar/vim-table-mode' -- Markdown tables made simple
end)
