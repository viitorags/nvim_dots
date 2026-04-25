if require("nixCatsUtils").isNixCats then
	return
else
	vim.pack.add({
		"https://github.com/williamboman/mason.nvim",
		"https://github.com/williamboman/mason-lspconfig.nvim",
		"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	})

	require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})

	require("mason-lspconfig").setup({
		ensure_installed = {
			"cmake",
			"pyright",
			"html",
			"cssls",
			"emmet_ls",
			"lua_ls",
			"gopls",
			"bashls",
			"vtsls",
			"vue_ls",
			"dockerls",
			"docker_compose_language_service",
			"marksman",
			"qmlls",
			"intelephense",
			"rust_analyzer",
			"jdtls",
		},
		automatic_installation = true,
	})

	require("mason-tool-installer").setup({
		ensure_installed = {
			"prettier",
			"stylua",
			"black",
			"shfmt",
			"php-cs-fixer",
			"pint",
		},
		auto_update = false,
		run_on_start = true,
	})
end
