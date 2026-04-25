vim.pack.add({
	"https://github.com/anuvyklack/windows.nvim",
	"https://github.com/anuvyklack/middleclass",
	"https://github.com/anuvyklack/animation.nvim",
})

vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false

require("windows").setup({
	ignore = {
		buftype = { "quickfix" },
		filetype = { "NvimTree", "neo-tree", "undotree", "gundo", "snacks_layout_box" },
	},
	animation = {
		enable = true,
		duration = 300,
		fps = 30,
		easing = "in_out_sine",
	},
})
