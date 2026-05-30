return {
	{ "nvzone/volt", lazy = true },
	{
		"nvzone/typr",
		dependencies = "nvzone/volt",
		opts = {},
		cmd = { "Typr", "TyprStats" },
	},
	{
		"nvzone/timerly",
		dependencies = "nvzone/volt",
		cmd = "TimerlyToggle",
		opts = {},
	},
	{ "nvzone/menu", lazy = true },
	{
		"nvzone/minty",
		cmd = { "Shades", "Huefy" },
	},
}
