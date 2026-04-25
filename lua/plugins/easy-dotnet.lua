vim.pack.add({
	"https://github.com/GustavEikaas/easy-dotnet.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
})

if vim.fn.executable("dotnet") == 1 then
	require("easy-dotnet").setup()
end
