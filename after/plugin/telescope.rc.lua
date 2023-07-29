local status, telescope = pcall(require, 'telescope')
if (not status) then
  print("Telescope not found")
  return
end

local utils = require "telescope.utils"

local actions = require("telescope.actions")
function Telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require 'telescope'.extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close
      }
    }
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      -- disables netrw and uses telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        --your custom insert mode mappings
        ['i'] = {
          ['<C-w>'] = function() vim.cmd('normal vdb') end,
        },
        ['n'] = {
          ['N'] = fb_actions.create,
          ['h'] = fb_actions.goto_parent_dir,
          ['/'] = function()
            vim.cmd('startinsert')
          end
        }
      }
<<<<<<< HEAD
    }
=======
    },
    recent_files = {},
>>>>>>> master
  }
}
telescope.load_extension('file_browser')

<<<<<<< HEAD
local opts = { noremap = true, silent = true }
vim.keymap.set('n', ';f', '<cmd> lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true})<cr>',
  opts)
vim.keymap.set('n', ';r', '<cmd> lua require("telescope.builtin").live_grep()<cr>',
  opts)
vim.keymap.set('n', '////', '<cmd> lua require("telescope.builtin").buffers()<cr>',
  opts)
vim.keymap.set('n', '<C-t>',
  '<cmd> lua require("telescope").extensions.file_browser.file_browser({path = "%:p:h", cwd = Telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, initial_mode = "normal"})<cr>',
  opts)
=======
-- local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', ';f', '<cmd> lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true})<cr>',
--   opts)
-- vim.keymap.set('n', ';r', '<cmd> lua require("telescope.builtin").live_grep()<cr>',
--   opts)
-- vim.keymap.set('n', '////', '<cmd> lua require("telescope.builtin").buffers()<cr>',
--   opts)
-- vim.keymap.set('n', '<C-t>',
--   '<cmd> lua require("telescope").extensions.file_browser.file_browser({path = "%:p:h", cwd = Telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, initial_mode = "normal"})<cr>',
--   opts)
>>>>>>> master


-- For searching in the current working project
function project_files()
  local _, ret, stderr = utils.get_os_command_output {
    "git",
    "rev-parse",
    "--is-inside-work-tree",
  }

  local gopts = {}
  local fopts = {}

  gopts.prompt_title = " Find"
  gopts.prompt_prefix = "  "
  gopts.results_title = " Repo Files"

  fopts.hidden = true
  fopts.file_ignore_patterns = {
    ".vim/",
    ".local/",
    ".cache/",
    "Downloads/",
    ".git/",
    "Dropbox/.*",
    "Library/.*",
    ".rustup/.*",
    "Movies/",
    ".cargo/registry/",
  }
  if ret == 0 then
    require("telescope.builtin").git_files(gopts)
  else
    fopts.results_title = "CWD: " .. vim.fn.getcwd()
    require("telescope.builtin").find_files(fopts)
  end
end

vim.api.nvim_set_keymap("n", ",<space>", [[<Cmd>lua project_files()<cr>]], { noremap = true, silent = true })
