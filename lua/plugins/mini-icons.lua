return {
	"echasnovski/mini.icons",
	config = function()
		local icons = require("mini.icons")
		icons.setup({
			directory = {
				["cmd"] = { glyph = "󰢬", hl = "MiniIconsBlue" },
				["public"] = { glyph = "󰉌", hl = "MiniIconsGreen" },
				["images"] = { glyph = "󰉏", hl = "MiniIconsPurple" },
				["icons"] = { glyph = "󰉏", hl = "MiniIconsPurple" },
				["audio"] = { glyph = "󱍙", hl = "MiniIconsRed" },
				["models"] = { glyph = "󱋣", hl = "MiniIconsRed" },
				["Models"] = { glyph = "󱋣", hl = "MiniIconsRed" },
				["model"] = { glyph = "󱋣", hl = "MiniIconsRed" },
				["Model"] = { glyph = "󱋣", hl = "MiniIconsRed" },
				["schemas"] = { glyph = "󱋣", hl = "MiniIconsRed" },
				["Schemas"] = { glyph = "󱋣", hl = "MiniIconsRed" },
				["Schema"] = { glyph = "󱋣", hl = "MiniIconsRed" },
				["schema"] = { glyph = "󱋣", hl = "MiniIconsRed" },
				["pages"] = { glyph = "󰴉", hl = "MiniIconsOrange" },
				["Pages"] = { glyph = "󰴉", hl = "MiniIconsOrange" },
				["views"] = { glyph = "󰴉", hl = "MiniIconsOrange" },
				["Views"] = { glyph = "󰴉", hl = "MiniIconsOrange" },
				["controllers"] = { glyph = "󰢬", hl = "MiniIconsYellow" },
				["Controllers"] = { glyph = "󰢬", hl = "MiniIconsYellow" },
				["handlers"] = { glyph = "󰢬", hl = "MiniIconsYellow" },
				["Handlers"] = { glyph = "󰢬", hl = "MiniIconsYellow" },
				["handler"] = { glyph = "󰢬", hl = "MiniIconsYellow" },
				["Handler"] = { glyph = "󰢬", hl = "MiniIconsYellow" },
				["routes"] = { glyph = "󱉭", hl = "MiniIconsYellow" },
				["Routes"] = { glyph = "󱉭", hl = "MiniIconsYellow" },
				["routers"] = { glyph = "󱉭", hl = "MiniIconsYellow" },
				["Routers"] = { glyph = "󱉭", hl = "MiniIconsYellow" },
				["router"] = { glyph = "󱉭", hl = "MiniIconsYellow" },
				["Router"] = { glyph = "󱉭", hl = "MiniIconsYellow" },
				["js"] = { hl = "MiniIconsYellow" },
				["services"] = { glyph = "󱧼", hl = "MiniIconsPurple" },
				["Services"] = { glyph = "󱧼", hl = "MiniIconsPurple" },
				["config"] = { glyph = "󱁿", hl = "MiniIconsGreen" },
				["Config"] = { glyph = "󱁿", hl = "MiniIconsGreen" },
				["test"] = { hl = "MiniIconsRed" },
				[".git"] = { glyph = "", hl = "MiniIconsOrange" },
				["scripts"] = { glyph = "󱁽", hl = "MiniIconsYellow" },
			},

			file = {
				-- PHP / Laravel
				["artisan"] = { glyph = "󰠄", hl = "MiniIconsRed" },
				["phpunit.xml"] = { glyph = "󰙨", hl = "MiniIconsGreen" },
				["CMakeLists.txt"] = { glyph = "", hl = "MiniIconsBlue" },
				-- C#
				["*.sln"] = { glyph = "󰌛", hl = "MiniIconsPurple" },
				["*.csproj"] = { glyph = "󰌛", hl = "MiniIconsBlue" },

				["docker-composer.yml"] = { glyph = "󰡨", hl = "MiniIconsRed" },
				["docker-compose.yml"] = { glyph = "󰡨", hl = "MiniIconsRed" },
				["go.mod"] = { glyph = "", hl = "MiniIconsPurple" },
				["go.sum"] = { glyph = "", hl = "MiniIconsGreen" },
				[".env"] = { glyph = "󰁿", hl = "MiniIconsYellow" },
			},

			filetype = {
				["javascript"] = { glyph = "", hl = "MiniIconsYellow" },
				["css"] = { glyph = "", hl = "MiniIconsBlue" },
				["go"] = { glyph = "", hl = "MiniIconsBlue" },
			},

			extension = {
				["php"] = { glyph = "", hl = "MiniIconsBlue" },
				["blade.php"] = { glyph = "󰠄", hl = "MiniIconsRed" },
				["cs"] = { glyph = "󰌛", hl = "MiniIconsBlue" },
				["rs"] = { glyph = "", hl = "MiniIconsOrange" },
				["c"] = { glyph = "", hl = "MiniIconsBlue" },
				["h"] = { glyph = "", hl = "MiniIconsBlue" },
				["cpp"] = { glyph = "", hl = "MiniIconsBlue" },
				["hpp"] = { glyph = "", hl = "MiniIconsBlue" },
				["ejs"] = { glyph = " ", hl = "MiniIconsYellow" },
				["rest"] = { glyph = "󱂛", hl = "MiniIconsRed" },
			},
		})
	end,
}
