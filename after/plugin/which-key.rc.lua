local status, wk = pcall(require, 'which-key')
if not status then
  print("Which key not found")
  return
end

local Terminal = require('toggleterm.terminal').Terminal
local toggle_float = function()
  local float = Terminal:new({ direction = "float" })
  return float:toggle()
end

wk.register({
  f = {
    name = "files",
    f = { "<cmd>Telescope file_browser<cr>", "File browser" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
  },
  t = {
    name = "telescope",
    g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
    f = { "<cmd>Telescope find_files<cr>", "Find Files" },
    b = { "<cmd>Telescope buffers<cr>", "Show buffers" },
  },
  g = {
    name = "lspsaga",
    k = { "<cmd>Lspsaga hover_doc<cr>", "Hover doucmentation" },
    d = { "<cmd>Lspsaga peek_definition<cr>", "View the doucmentation" },
    r = { "<cmd>Lspsaga rename<cr>", "Power rename" },
    l = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show line diagnostics" },
  },
  w = {
    name = "Window manager",
    v = { "<cmd>:vsplit<cr>", "Vertical split" },
    h = { "<cmd>:split<cr>", "Horizontal split" }
  },
  o = {
    name = "open",
    t = { "<cmd>:ToggleTerm<cr>", "terminal" },
    f = { toggle_float, "floating Terminal" },
  }
}, { prefix = "<leader>" })
