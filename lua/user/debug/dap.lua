local M = {
  "mfussenegger/nvim-dap",
  event = "BufEnter",
}

function M.config()
  local wk = require "which-key"

  wk.register {
    ["<leader>d"] = {
      name = "+debugging",
      b = { "<cmd>DapToggleBreakpoint<cr>", "Add a breakpoint" },
      r = { "<cmd>DapContinue<cr>", "Start or continue debugger" },
    },
  }

  local dap = require "dap"
  dap.adapters.cppdbg = {
    type = "executable",
    command = "/home/creatio/.local/share/nvim/mason/bin/OpenDebugAD7",
    id = "cppdbg",
    -- name = "cpptools",
    -- args = {},
    -- attach = {
    -- 	pidProperty = "processId",
    -- 	pidSelect = "ask",
    -- }
  }

  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "cppdbg",
      request = "launch",
      -- MIMode = "gdb",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",

      setupCommands = {
        {
          text = "-enable-pretty-printing",
          description = "enable pretty printing",
          ignoreFailures = false,
        },
      },
      stopOnEntry = true,
      -- args = {},
      -- runInTerminal = false,
      -- program = "main",
    },
    {
      name = "Attach to gdbserver: 1234",
      type = "cppdbg",
      request = "launch",
      MIMode = "gdb",
      miDebuggerServerAddress = "localhost:1234",
      miDebuggerPath = "/usr/bin/gdb",
      cwd = "${workspaceFolder}",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
    },
  }
  dap.configurations.c = dap.configurations.cpp
end

return M
