return {
	{
		import = "nvchad.blink.lazyspec",
		opts_extend = { "sources.default" },
		opts = {
			completion = {
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
		},
	},
	-- Disable NvChad's nvim-cmp (replaced by blink.cmp)
	{ "hrsh7th/nvim-cmp", enabled = false },
	{ "saadparwaiz1/cmp_luasnip", enabled = false },
	{ "hrsh7th/cmp-nvim-lua", enabled = false },
	{ "hrsh7th/cmp-nvim-lsp", enabled = false },
	{ "hrsh7th/cmp-buffer", enabled = false },
	{ "hrsh7th/cmp-path", enabled = false },
	-- Disable NvChad's telescope (replaced by snacks.nvim picker)
	{ "nvim-telescope/telescope.nvim", enabled = false },
	-- Disable NvChad's nvim-tree (replaced by snacks.nvim explorer)
	{ "nvim-tree/nvim-tree.lua", enabled = false },
	-- Disable NvChad's indent-blankline
	{ "lukas-reineke/indent-blankline.nvim", enabled = false },

	-- Laravel
	{
		"adalessa/laravel.nvim",
		dependencies = {
			"tpope/vim-dotenv",
			"nvim-telescope/telescope.nvim",
			"MunifTanjim/nui.nvim",
			"kevinhwang91/promise-async",
		},
		event = { "VeryLazy" },
		opts = {
			lsp_server = "intelephense",
			features = {
				null_ls = {
					enabled = false,
				},
			},
		},
		config = true,
	},

	-- Rust
	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
		config = function()
			vim.g.rustaceanvim = {
				server = {
					on_attach = function(client, bufnr)
						-- register which-key mappings if needed
					end,
					default_settings = {
						["rust-analyzer"] = {
							cargo = { allFeatures = true },
							checkOnSave = { command = "clippy" },
						},
					},
				},
			}
		end,
	},

	-- Go
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()',
	},

	-- C/C++ extensions
	{
		"p00f/clangd_extensions.nvim",
		lazy = true,
		config = function() end,
		opts = {
			extensions = {
				autoSetHints = true,
			},
		},
	},

	-- Neotest Adapters
	{ "olimorris/neotest-phpunit", lazy = true },
	{ "Issafalcon/neotest-dotnet", lazy = true },
	{ "fredrikaverpil/neotest-golang", lazy = true },
	{ "rouge8/neotest-rust", lazy = true },
}
