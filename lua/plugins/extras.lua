vim.pack.add({
	{ src = "https://github.com/mistricky/codesnap.nvim", version = "v1.6.3" },
	"https://github.com/HiPhish/rainbow-delimiters.nvim",
	"https://github.com/brenoprata10/nvim-highlight-colors",
	"https://github.com/nvimdev/lspsaga.nvim",
	"https://github.com/iamcco/markdown-preview.nvim",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
	"https://github.com/NotAShelf/direnv.nvim",
	"https://github.com/windwp/nvim-ts-autotag",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/stevearc/overseer.nvim",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/rachartier/tiny-code-action.nvim",
	"https://github.com/rachartier/tiny-inline-diagnostic.nvim",
	"https://github.com/sphamba/smear-cursor.nvim",
})

local function safe_require(module, config)
	local ok, mod = pcall(require, module)
	if ok and mod.setup then
		mod.setup(config or {})
	end
end

-- Individual setups
safe_require("nvim-web-devicons")
safe_require("codesnap")
safe_require("rainbow-delimiters")
safe_require("tiny-code-action", { picker = "buffer" })
safe_require("todo-comments")
safe_require("nvim-highlight-colors", {
	enable_tailwind = true,
	render = "virtual",
	virtual_symbol = "",
})
safe_require("lspsaga")
safe_require("render-markdown")
safe_require("direnv", { autoload_direnv = true })
safe_require("nvim-ts-autotag")
safe_require("nvim-autopairs")
safe_require("overseer")
safe_require("which-key")
safe_require("tiny-inline-diagnostic")
safe_require("smear_cursor", {
	stiffness = 0.5,
	trailing_stiffness = 0.49,
	never_draw_over_target = false,
	legacy_computing_symbols_support = true,
	distance_stop_animating_vertical_bar = 0.1,
	smear_insert_mode = true,
})

-- Vim globals
vim.g.mkdp_filetypes = { "markdown" }
