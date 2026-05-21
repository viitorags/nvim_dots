return {
	"hrsh7th/nvim-cmp",
	name = "nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()

		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local nvchad_cmp = require("nvchad.cmp")

		cmp.setup({
			performance = {
				debounce = 60,
				throttle = 30,
				fetching_timeout = 200,
				max_view_entries = 10,
			},

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),

			sources = cmp.config.sources({
				{
					name = "nvim_lsp",
					max_item_count = 20,
					entry_filter = function(entry)
						return entry:get_completion_item().label ~= "{}"
					end,
				},
				{ name = "luasnip", max_item_count = 10 },
				{ name = "buffer", keyword_length = 4, max_item_count = 5 },
				{ name = "path", max_item_count = 5 },
			}),

			formatting = nvchad_cmp.formatting,

			completion = {
				completeopt = "menu,menuone",
			},

			window = nvchad_cmp.window,

			preselect = cmp.PreselectMode.Item,
		})
	end,
}
