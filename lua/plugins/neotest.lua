vim.pack.add({
	"https://github.com/nvim-neotest/neotest",
	"https://github.com/nvim-neotest/nvim-nio",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/antoinemadec/FixCursorHold.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/marilari88/neotest-vitest",
	"https://github.com/nvim-neotest/neotest-jest",
	"https://github.com/rcasia/neotest-java",
})

require("neotest").setup({
	adapters = {
		require("neotest-vitest"),
		require("neotest-jest")({
			jestCommand = "npm test --",
			jestConfigFile = "jest.config.js",
			env = { CI = true },
			cwd = function(_)
				return vim.fn.getcwd()
			end,
		}),
		require("neotest-java"),
	},
})
