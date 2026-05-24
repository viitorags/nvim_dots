-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "rosepine",

	changed_themes = {
		rosepine = {
			base_30 = {
				white = "#ffffff",
				darker_black = "#080808",
				black = "#0d0d0d",
				black2 = "#141414",
				one_bg = "#1a1a1a",
				one_bg2 = "#262626",
				one_bg3 = "#333333",
				grey = "#404040",
				grey_fg = "#666666",
				grey_fg2 = "#8c8c8c",
				light_grey = "#b3b3b3",
				red = "#ff3333",
				baby_pink = "#ff8080",
				pink = "#ff7edb",
				line = "#262626",
				green = "#33ff99",
				vibrant_green = "#2ecc71",
				blue = "#cc0000",
				nord_blue = "#0097b2",
				yellow = "#e60000",
				sun = "#ff5500",
				purple = "#990000",
				dark_purple = "#4a3568",
				teal = "#ff4d4d",
				cyan = "#03edf9",
				statusline_bg = "#141414",
				lightbg = "#1a1a1a",
				pmenu_bg = "#141414",
				folder_bg = "#cc0000",
			},
			base_16 = {
				base00 = "#0d0d0d",
				base01 = "#1a1a1a",
				base02 = "#262626",
				base03 = "#404040",
				base04 = "#8c8c8c",
				base05 = "#e6e6e6",
				base06 = "#f5f5f5",
				base07 = "#ffffff",
				base08 = "#ff3333",
				base09 = "#ff5500",
				base0A = "#e60000",
				base0B = "#33ff99",
				base0C = "#ff4d4d",
				base0D = "#cc0000",
				base0E = "#990000",
				base0F = "#ff8080",
			},
		},
	},
	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.ui = {
	tabufline = {
		enabled = false,
	},
	statusline = {
		theme = "minimal",
		separator_style = "round",
	},
	cmp = {
		style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
		icons_left = false,
	},
}

return M
