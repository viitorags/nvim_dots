return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("snacks").setup({
			dashboard = {
				enabled = true,
				preset = {
					header = [[
     ██╗ ██████╗ ██╗   ██╗██████╗  ██████╗ ██╗   ██╗
     ██║██╔═══██╗╚██╗ ██╔╝██╔══██╗██╔═══██╗╚██╗ ██╔╝
     ██║██║   ██║ ╚████╔╝ ██████╔╝██║   ██║ ╚████╔╝
██   ██║██║   ██║  ╚██╔╝  ██╔══██╗██║   ██║  ╚██╔╝
╚█████╔╝╚██████╔╝   ██║   ██████╔╝╚██████╔╝   ██║
 ╚════╝  ╚═════╝    ╚═╝   ╚═════╝  ╚═════╝    ╚═╝
        ]],
					keys = {
						{
							icon = "󰈞 ",
							key = "f",
							desc = "Find File",
							action = ":lua Snacks.dashboard.pick('smart')",
						},
						-- { icon = ' ', key = 'e', desc = 'New File', action = ':ene | startinsert' },
						-- {
						--   icon = ' ',
						--   key = 'g',
						--   desc = 'Find Text',
						--   action = ":lua Snacks.dashboard.pick('live_grep')",
						-- },
						{
							function()
								if require("nixCatsUtils").isNixCats == true then
									return {
										icon = " ",
										key = "c",
										desc = "Dotfiles Folder",
										action = ":tcd $HOME/dotfiles/ | :e .",
									}
								else
									return {}
								end
							end,
						},
						{
							icon = " ",
							key = "r",
							desc = "Recent Files",
							action = ":lua Snacks.dashboard.pick('oldfiles')",
						},
						{
							icon = " ",
							key = "p",
							desc = "Project Folder",
							action = ":tcd $HOME/Workspace/Projects/ | :e .",
						},
						{
							function()
								if require("nixCatsUtils").isNixCats == true then
									return {}
								else
									return {
										icon = " ",
										key = "s",
										desc = "Settings",
										action = ":e $MYVIMRC | :tcd %:p:h",
									}
								end
							end,
						},
						{
							icon = "󰒲 ",
							key = "L",
							desc = "Lazy",
							action = ":Lazy",
							enabled = package.loaded.lazy ~= nil,
						},
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
				},
				sections = {
					{ section = "header" },
					{ section = "keys", padding = 2, gap = 0 },
				},
			},
			indent = {
				priority = 1,
				enabled = true,
				indent = {
					hl = {
						"SnacksIndent1",
						"SnacksIndent2",
						"SnacksIndent3",
						"SnacksIndent4",
						"SnacksIndent5",
						"SnacksIndent6",
						"SnacksIndent7",
						"SnacksIndent8",
					},
				},
				scope = {
					enabled = true,
					priority = 200,
					underline = false,
					only_current = false,
					hl = "SnacksIndentScope",
				},
			},
			statuscolumn = {
				enabled = true,
				left = {},
				right = { "fold", "git" },
				folds = {
					open = true,
					git_hl = true,
				},
				git = {
					patterns = { "GitSign", "MiniDiffSign" },
				},
				refresh = 50,
			},
			terminal = { enabled = true },
			input = { enabled = true },
			explorer = {
				enabled = true,
				replace_netrw = true,
				tree = true,
				follow_file = true,
			},
			picker = {
				enabled = true,
				ui_select = true,
				layout = {
					layout = {
						preset = "vscode",
						backdrop = false,
					},
				},
				sources = {
					files = {
						ignored = true,
						exclude = {
							"**/.DS_Store",
							"**/node_modules/**",
							"**/.vscode",
						},
						include = {
							".env",
							".direnv",
							".envrc",
							"Dockerfile",
							"docker-compose.yml",
						},
					},
					explorer = {
						replace_netrw = true,
						tree = true,
						follow_file = true,
						focus = "list",
						watch = true,
						diagnostics = false,
						diagnostics_open = false,
						git_status = true,
						git_status_open = false,
						git_untracked = true,
						exclude = {
							".DS_Store",
							"node_modules",
							".vscode",
							".git",
						},
						include = {
							".env",
							".direnv",
							".envrc",
							"Dockerfile",
							"docker-compose.yml",
							"tests/",
						},
						layout = {
							preset = "sidebar",
							layout = {
								position = "right",
								box = "vertical",
							},
							preview = false,
						},
					},
				},
			},
			image = { enabled = false },
			notifier = { enabled = true },
			quickfile = { enabled = false },
			scope = { enabled = true },
			scroll = { enabled = true },
			words = { enabled = false },
			bigfile = { enabled = false },
			git = { enabled = true },
			gitbrowser = { enabled = true },
			zen = { enabled = false },
			styles = {
				input = {
					backdrop = false,
					position = "float",
					border = "rounded",
					title_pos = "center",
					height = 1,
					width = 60,
					relative = "editor",
					noautocmd = true,
					row = 2,
					wo = {
						winhighlight = "NormalFloat:SnacksInputNormal,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle",
						cursorline = false,
					},
					bo = {
						filetype = "snacks_input",
						buftype = "prompt",
					},
					b = {
						completion = false,
					},
					blame_line = {
						width = 0.6,
						height = 0.6,
						border = "rounded",
						title = " Git Blame ",
						title_pos = "center",
						ft = "git",
					},
					keys = {
						n_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "n", expr = true },
						i_esc = { "<esc>", { "cmp_close", "stopinsert" }, mode = "i", expr = true },
						i_cr = { "<cr>", { "cmp_accept", "confirm" }, mode = { "i", "n" }, expr = true },
						i_tab = { "<tab>", { "cmp_select_next", "cmp" }, mode = "i", expr = true },
						i_ctrl_w = { "<c-w>", "<c-s-w>", mode = "i", expr = true },
						i_up = { "<up>", { "hist_up" }, mode = { "i", "n" } },
						i_down = { "<down>", { "hist_down" }, mode = { "i", "n" } },
						q = "cancel",
					},
				},

				float = {
					position = "float",
					backdrop = 60,
					height = 0.9,
					width = 0.9,
					zindex = 50,
				},

				zoom_indicator = {
					text = "▍ zoom  󰊓  ",
					minimal = true,
					enter = false,
					focusable = false,
					height = 1,
					row = 0,
					col = -1,
					backdrop = false,
				},

				help = {
					position = "float",
					backdrop = false,
					border = "top",
					row = -1,
					width = 0,
					height = 0.3,
				},
			},
		})
	end,
}
