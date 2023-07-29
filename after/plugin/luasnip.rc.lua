local status, ls = pcall(require, 'luasnip')
if (not status) then
  print("Luasnip not found")
  return
end

<<<<<<< HEAD
local ls = require "luasnip"
=======
>>>>>>> master
local types = require "luasnip.util.types"

ls.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,
  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,

  ext_opts = nil,
}
-- Demo of one snippet sets
-- ls.parser.parse_snippet("whatmd", "This is in md"),
ls.add_snippets("all", {
})
ls.add_snippets("markdown", {
  ls.parser.parse_snippet("/toggle", "<details> \n<summary> $1 </summary>\n$0 \n</details>")
})
ls.add_snippets("cpp", {
  ls.parser.parse_snippet("/template", "#include <bits/stdc++.h>\nusing namespace std;\nint main(){$1}")
})
ls.add_snippets("javascriptreact", {
  ls.parser.parse_snippet("rce", "class $1 extends React.Component {\n  render() {\n    return $2;}}")
})
ls.add_snippets("html", {
<<<<<<< HEAD
  ls.parser.parse_snippet("!", "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<meta charset=\"UTF-8\">\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<title>$1</title>\n</head>\n<body>\n$0\n</body>\n</html>")
=======
  ls.parser.parse_snippet("!",
    "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<meta charset=\"UTF-8\">\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<title>$1</title>\n</head>\n<body>\n$0\n</body>\n</html>")
>>>>>>> master
})

-- Keymaps

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-j>", function()
<<<<<<< HEAD
  if ls.jumpable( -1) then
    ls.jump( -1)
=======
  if ls.jumpable(-1) then
    ls.jump(-1)
>>>>>>> master
  end
end, { silent = true })

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set("i", "<c-u>", require "luasnip.extras.select_choice")

-- shorcut to source my luasnips file again, which will reload my snippets
vim.keymap.set("n", ";;s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.rc.lua<CR>")
