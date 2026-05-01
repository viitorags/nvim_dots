vim.pack.add({
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/lewis6991/gitsigns.nvim",
})

local lualine = require("lualine")

local function gitsigns_diff()
	local signs = vim.b.gitsigns_status_dict
	if not signs then
		return ""
	end
	local parts = {}
	if signs.added and signs.added > 0 then
		table.insert(parts, "%#GitSignsAdd#+" .. signs.added)
	end
	if signs.changed and signs.changed > 0 then
		table.insert(parts, "%#GitSignsChange#~" .. signs.changed)
	end
	if signs.removed and signs.removed > 0 then
		table.insert(parts, "%#GitSignsDelete#-" .. signs.removed)
	end
	return #parts > 0 and ("[MOD:" .. table.concat(parts, " ") .. "%*]") or ""
end

local function lsp_status()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		return "[SYSTEM:OFFLINE]"
	end
	local names = {}
	for _, client in ipairs(clients) do
		table.insert(names, string.upper(client.name))
	end
	return "[SYS:" .. table.concat(names, ",") .. "]"
end

vim.api.nvim_set_hl(0, "LualineIcon", {})

lualine.setup({
	options = {
		theme = "gruvbox-material",
		icons_enabled = true,
		component_separators = "",
		section_separators = "",
		globalstatus = true,
		refresh = { statusline = 100, tabline = 100, winbar = 100 },
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str)
					return "󰣚 " .. str:upper()
				end,
			},
		},
		lualine_b = {
			{ "branch", icon = "" },
			{ lsp_status, color = { gui = "bold" } },
		},
		lualine_c = {
			{ "filename", path = 1, symbols = { modified = " 󰶐", readonly = " " } },
		},
		lualine_x = {
			{ "diagnostics", symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " } },
		},
		lualine_y = {
			function()
				return require("direnv").statusline()
			end,
			{ "encoding", fmt = string.upper },
			{
				function()
					return ""
				end,
				color = "LualineIcon",
			},
			{ "progress" },
		},
		lualine_z = {
			{
				function()
					return ""
				end,
				color = "LualineIcon",
			},
			{ "location" },
		},
	},
	-- tabline = {
	-- 	lualine_a = {
	-- 		{
	-- 			"filename",
	-- 			path = 0,
	-- 			fmt = function(name)
	-- 				return "󰈚 " .. name:upper()
	-- 			end,
	-- 		},
	-- 	},
	-- 	lualine_x = {
	-- 		{ gitsigns_diff, padding = { right = 1 } },
	-- 	},
	-- 	lualine_z = {
	-- 		{
	-- 			"branch",
	-- 			icon = "",
	-- 			fmt = function(str)
	-- 				return str:upper()
	-- 			end,
	-- 			color = { gui = "bold" },
	-- 		},
	-- 	},
	-- },
	extensions = { "neo-tree", "quickfix", "fugitive" },
})
