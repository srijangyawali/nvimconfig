local M = {

  "karb94/neoscroll.nvim",
}

function M.config()
  vim.cmd [[
  nnoremap <C-j> <C-D>
  vnoremap <C-j> <C-D>

  nnoremap <C-k> <C-U>
  vnoremap <C-k> <C-U>
]]

  require("neoscroll").setup {
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = { "<A-u>", "<A-d>", "<A-b>", "<A-f>", "<A-y>", "<A-e>", "zt", "zz", "zb", "A-k", "A-j" },
    hide_cursor = true, -- Hide cursor while scrolling
    stop_eof = true, -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further

    easing_function = nil, -- Default easing function
    pre_hook = nil, -- Function to run before the scrolling animation starts
    post_hook = nil, -- Function to run after the scrolling animation ends
    performance_mode = false, -- Disable "Performance Mode" on all buffers.
  }


  local t = {}
  -- Syntax: t[keys] = {function, {function arguments}}
  t["<A-u>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
  t["<A-d>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
  t["<A-k>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
  t["<A-j>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
  t["<A-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450" } }
  t["<A-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450" } }
  t["<A-y>"] = { "scroll", { "-0.10", "false", "100" } }

  t["<A-e>"] = { "scroll", { "0.10", "false", "100" } }
  t["zt"] = { "zt", { "250" } }
  t["zz"] = { "zz", { "250" } }
  t["zb"] = { "zb", { "250" } }

  require("neoscroll.config").set_mappings(t)
end

return M
