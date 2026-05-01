require("nixCatsUtils").setup({
	non_nix_value = true,
})

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = nixCats("have_nerd_font")

require("config.options")
require("config.keymaps")

-- Plugins import
require("plugins.blink")
require("plugins.conform")
require("plugins.dadbod")
require("plugins.easy-dotnet")
require("plugins.flutter-tools")
require("plugins.go-nvim")
require("plugins.java")
require("plugins.kulala")
require("plugins.laravel")
require("plugins.lsp")
require("plugins.lualine")
require("plugins.incline")
require("plugins.noice")
require("plugins.neotest")
require("plugins.nvim-dap")
require("plugins.nvim-lint")
require("plugins.nvim-ufo")
require("plugins.package-info")
require("plugins.roslyn")
require("plugins.rustaceanvim")
require("plugins.surround")
require("plugins.telescope")
require("plugins.terminal")
require("plugins.treesitter")
require("plugins.trouble")
require("plugins.twilight")
require("plugins.vimtex")
require("plugins.windows")
require("plugins.colorscheme")
require("plugins.mini-icons")
require("plugins.extras")
require("plugins.snacks")

-- local function getlockfilepath()
-- 	if require("nixCatsUtils").isNixCats and type(nixCats.settings.unwrappedCfgPath) == "string" then
-- 		return nixCats.settings.unwrappedCfgPath .. "/lazy-lock.json"
-- 	else
-- 		return vim.fn.stdpath("config") .. "/lazy-lock.json"
-- 	end
-- end

local nixCatsUtils = require("nixCatsUtils")
if not nixCatsUtils.isNixCats then
	require("plugins.mason")
end
