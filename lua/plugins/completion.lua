return{
	"hrsh7th/nvim-cmp",
	lazy= false,
	dependencies = {
		{"hrsh7th/cmp-buffer"},
		{"hrsh7th/cmp-path"},
		{"L3MON4D3/LuaSnip"},
		{"saadparwaiz1/cmp_luasnip"},
		{"rafamadriz/friendly-snippets"},
		{"onsails/lspkind.nvim"},
		{"hrsh7th/cmp-nvim-lsp"},
		{"nvim-tree/nvim-web-devicons"}
	},
	config = function()
		local cmp_status, cmp = pcall(require, "cmp")
		if not cmp_status then
			return
		end

		local luasnip_status, luasnip = pcall(require, "luasnip")
		if not luasnip_status then
			return
		end

		--loading friendly-snippets
		require("luasnip/loaders/from_vscode").lazy_load()

		require("lspkind").init({
 symbol_map = {
      Text = "🖋",
      Method = "۸",
      Function = "ƒ",
      Constructor = "",
      Field = "🛨",
      Variable = "",
      Class = "🏛",
      Interface = "",
      Module = "",
      Property = "※",
      Unit = "𐄹",
      Value = "฿",
      Enum = "",
      Keyword = "⍞",
      Snippet = "",
      Color = "🖌",
      File = "🖺",
      Reference = "🖇",
      Folder = "🗀 ",
      EnumMember = "",
      Constant = "ℇ",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },

		})
		
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({
				-- C-n and C-p are good for me which are the default bindings
				["<C-j>"] = cmp.mapping.scroll_docs(4),
				["<C-k>"] = cmp.mapping.scroll_docs(-4),
				["<C-Space>"] = cmp.mapping.complete(), -- show suggestions
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({select = false}),
			}),
			sources = cmp.config.sources({
				{name = "nvim_lsp"},
				{name = "luasnip"}, --snippets
				{name = "buffer"}, -- texts within current buffer
				{name = "path"}, -- file system paths
			}),
			formatting = {
			format = require("lspkind").cmp_format({
				maxwidth = 50,
				ellipsis_char = "...",
				}),
			},

		})
	end,
}
