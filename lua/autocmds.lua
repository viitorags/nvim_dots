require("nvchad.autocmds")

vim.api.nvim_create_autocmd("DirChanged", {
	callback = function()
		vim.g.wezterm_cwd = vim.fn.getcwd()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "jsonq", "json", "nix", "lua" },
	callback = function()
		vim.bo.expandtab = true
		vim.bo.shiftwidth = 2
		vim.bo.tabstop = 2
	end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.ejs",
	command = "set filetype=html",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "make",
	callback = function()
		vim.opt_local.expandtab = false
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
	end,
})
