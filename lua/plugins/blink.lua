vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", name = "blink", version = "v1.10.2" },
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/echasnovski/mini.icons",
})

vim.api.nvim_create_autocmd("InsertEnter", {
	once = true,
	callback = function()
		-- Clean up package.cpath from codesnap pollution before loading blink
		local clean_cpath = {}
		for p in string.gmatch(package.cpath, "[^;]+") do
			if string.find(p, "?", 1, true) or not string.match(p, "^/") then
				table.insert(clean_cpath, p)
			end
		end
		package.cpath = table.concat(clean_cpath, ";")

		require("luasnip.loaders.from_vscode").lazy_load()

		vim.api.nvim_set_hl(0, "CmpMenu", { bg = "none" })
		vim.api.nvim_set_hl(0, "CmpItemKind", { link = "Comment" })

		require("blink.cmp").setup({
			keymap = {
				preset = "default",
				["<CR>"] = {
					"accept",
					"fallback",
				},
				["<Tab>"] = {},
				["<S-Tab>"] = {},
				["<Down>"] = {},
				["<Up>"] = {},
			},

			appearance = {
				use_nvim_cmp_as_default = false,
			},

			completion = {
				menu = {
					winhighlight = "Normal:BlinkMenu,FloatBorder:BlinkMenu,CursorLine:Visual,Search:None",
					draw = {
						columns = {
							{ "kind_icon", "kind", gap = 1 },
							{ "label", "label_description" },
						},
					},
				},
				list = {
					selection = {
						preselect = true,
						auto_insert = false,
					},
				},
				documentation = {
					auto_show = true,
					window = {
						winhighlight = "Normal:BlinkMenu,FloatBorder:BlinkMenu,CursorLine:Visual,Search:None",
					},
				},
				trigger = {
					show_on_blocked_trigger_characters = function()
						local chars = { "'", '"', "(", "{", "[" }
						local target_fts = { "html", "php", "vue", "reactjs", "javascriptreact", "typescriptreact" }
						if vim.tbl_contains(target_fts, vim.bo.filetype) then
							table.insert(chars, ">")
						end
						return chars
					end,
				},
			},

			snippets = {
				preset = "luasnip",
			},

			sources = {
				providers = {
					lsp = {
						transform_items = function(_, items)
							return vim.tbl_filter(function(item)
								return item.label ~= "{}"
							end, items)
						end,
					},
				},
			},
		})
	end,
})
