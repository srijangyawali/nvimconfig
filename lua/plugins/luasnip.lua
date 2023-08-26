return {
	"L3MON4D3/LuaSnip",
	event = "BufEnter",
	config = function()
		local status, ls = pcall(require, "luasnip")
		if not status then
			print("Luasnip not found")
			return
		end

		local types = require("luasnip.util.types")

		ls.config.set_config({
			history = true,
			-- dynamically update snippet as we type
			updateevents = "TextChanged, TextChangedI",

			enable_autosnippets = true,
			ext_opts = nil,
		})

		-- snippets for different file types
		ls.add_snippets("all", {})

		ls.add_snippets("markdown", {
			ls.parser.parse_snippet("<toggle", "<details> \n<summary> $1 </summary>\n$0 \n</details>"),
			ls.parser.parse_snippet("<question", "> ❓ $0"),
		})

		ls.add_snippets("cpp", {
			ls.parser.parse_snippet("<template", "#include<iostream>\nusing namespace std;\nint main(){$1}"),
		})

		-- jump forward
		vim.keymap.set({ "i", "s" }, "<C-k>", function()
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			end
		end, { silent = true })

		-- jump backward
		vim.keymap.set({ "i", "s" }, "<C-j>", function()
			if ls.expand_or_jumpable(-1) then
				ls.expand_or_jump(-1)
			end
		end, { silent = true })
	end,
}