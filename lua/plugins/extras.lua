return {
	{
		"mistricky/codesnap.nvim",
		cmd = { "CodeSnap", "CodeSnapSave" },
		opts = {},
	},
	{ "HiPhish/rainbow-delimiters.nvim", event = "User FilePost" },
	{
		"brenoprata10/nvim-highlight-colors",
		event = "User FilePost",
		opts = {
			enable_tailwind = true,
			render = "virtual",
			virtual_symbol = "",
		},
	},
	{
		"nvimdev/lspsaga.nvim",
		event = "User FilePost",
		opts = {},
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{ "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown" } },
	{ "windwp/nvim-ts-autotag", event = "User FilePost", opts = {} },
	{ "nvim-tree/nvim-web-devicons", lazy = false, opts = {} },
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
	{ "stevearc/overseer.nvim", event = "VeryLazy", opts = {} },
	{ "folke/which-key.nvim", event = "VeryLazy", opts = {} },
	{
		"folke/todo-comments.nvim",
		event = "User FilePost",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{ "nvim-lua/plenary.nvim", lazy = true },
	{
		"rachartier/tiny-code-action.nvim",
		event = "User FilePost",
		opts = { picker = "buffer" },
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "User FilePost",
		opts = {},
	},
	{
		"sphamba/smear-cursor.nvim",
		event = "VeryLazy",
		opts = {
			stiffness = 0.5,
			trailing_stiffness = 0.49,
			never_draw_over_target = false,
			legacy_computing_symbols_support = true,
			distance_stop_animating_vertical_bar = 0.1,
			smear_insert_mode = true,
		},
	},
	{ "RRethy/vim-illuminate", event = "User FilePost" },
	{
		"NotAShelf/direnv.nvim",
		lazy = false,
		config = function()
			require("direnv").setup({
				autoload_direnv = true,
				notifications = {
					level = vim.log.levels.INFO,
					silent_autoload = false,
				},
			})
		end,
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "personal",
					path = "~/Workspace/Brain",
				},
				{
					name = "work",
					path = "~/Workspace/Brain",
				},
			},
		},
	},
}
