vim.pack.add({
	"https://github.com/adalessa/laravel.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/tpope/vim-dotenv",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
})

if vim.fn.filereadable("artisan") == 1 then
	local ok, laravel = pcall(require, "laravel")
	if ok then
		laravel.setup({
			lsp_server = "intelephense",
			features = {
				null_ls = { enabled = false },
				route_info = { enabled = false },
				model_info = { enabled = false },
				composer_info = { enabled = false },
			},
		})
	end
end

vim.keymap.set("n", "<leader>laa", ":Laravel artisan<cr>", { desc = "Laravel Artisan picker" })
vim.keymap.set("n", "<leader>lar", ":Laravel routes<cr>", { desc = "Laravel Route list" })
vim.keymap.set("n", "<leader>lam", ":Laravel related<cr>", { desc = "Laravel Model info" })
vim.keymap.set("n", "<leader>lat", ":Laravel tinker<cr>", { desc = "Laravel Tinker" })
