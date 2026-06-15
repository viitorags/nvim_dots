require("nvchad.options")

local o = vim.opt

o.clipboard = "unnamedplus"
o.mouse = "a"
o.expandtab = false
o.shiftwidth = 4
o.tabstop = 4
o.cursorline = true
o.number = true
o.relativenumber = true
o.numberwidth = 4
o.termguicolors = true
o.wrap = false
o.smartindent = true
o.showmatch = true
o.completeopt = { "menuone", "noselect" }
o.foldenable = true
o.foldlevel = 99
o.foldlevelstart = 99
o.foldcolumn = "1"
o.signcolumn = "yes"
o.statuscolumn = [[%!v:lua.Snacks.statuscolumn()]]
o.fillchars = "eob: "
o.listchars = {
	space = "·",
	tab = "··",
	lead = "·",
	trail = "·",
	eol = "↴",
}
o.list = false
o.wildmenu = true
o.wildmode = "longest:full,full"
o.backup = false
o.swapfile = false
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.scrolloff = 8
o.sidescrolloff = 8
o.hlsearch = true
o.updatetime = 100
o.timeoutlen = 200
o.redrawtime = 1500
o.conceallevel = 1
