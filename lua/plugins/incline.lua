return {
	"b0o/incline.nvim",
	event = "User FilePost",
	dependencies = {
		"lewis6991/gitsigns.nvim",
	},
	config = function()
		local devicons = require("nvim-web-devicons")
		require("incline").setup({
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				if filename == "" then
					filename = "[No Name]"
				end
				local ft_icon, ft_color = devicons.get_icon_color(filename)

				return {
					{ (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" },
					{ filename .. " ", gui = vim.bo[props.buf].modified and "bold,italic" or "bold" },
					{ "┊  " .. vim.api.nvim_win_get_number(props.win), group = "DevIconWindows" },
				}
			end,
		})
	end,
}
