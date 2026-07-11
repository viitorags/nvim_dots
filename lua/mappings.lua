require("nvchad.mappings")

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map({ "n", "v" }, "<RightMouse>", function()
	require("menu.utils").delete_old_menus()
	vim.cmd.exec('"normal! \\<RightMouse>"')

	local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
	local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"
	require("menu").open(options, { mouse = true })
end, opts)

map({ "n", "v" }, "<C-t>", function()
	require("menu").open("default")
end, opts)

-- Snacks keymaps (override NvChad's NvimTree/Telescope defaults)
map("n", "<leader>e", function()
	local explorer_pickers = Snacks.picker.get({ source = "explorer" })
	for _, v in pairs(explorer_pickers) do
		if v:is_focused() then
			v:close()
		else
			v:focus()
		end
	end
	if #explorer_pickers == 0 then
		Snacks.picker.explorer()
	end
end, { desc = "Open Explorer", noremap = true, silent = true })
map("n", "<leader>f", function()
	Snacks.picker.smart()
end, { desc = "Smart Find Files", noremap = true, silent = true })
map("n", "<leader>b", function()
	Snacks.picker.buffers()
end, { desc = "Buffers", noremap = true, silent = true })
map("n", "<leader>/", function()
	Snacks.picker.grep()
end, { desc = "Grep", noremap = true, silent = true })
map("n", "<leader>:", function()
	Snacks.picker.command_history()
end, { desc = "Command History", noremap = true, silent = true })
map("n", "<leader>n", function()
	Snacks.picker.notifications()
end, { desc = "Notification History", noremap = true, silent = true })
map("n", "<leader>v", function()
	Snacks.terminal()
end, { desc = "Open terminal", noremap = true, silent = true })
map("n", "<leader>g", function()
	Snacks.lazygit()
end, { desc = "Open lazygit", noremap = true, silent = true })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<C-a>", ":normal ggVG<CR>", opts)

map("n", "<C-c>", '"+y', opts)
map("v", "<C-c>", '"+y', opts)

map("n", "<C-s>", ":w<CR>", opts)
map("i", "<C-s>", "<C-o>:w<CR>", opts)

map("n", "<C-f>", ":%s/foo/bar", opts)
map("v", "<C-f>", ":s/foo/bar", opts)

map("n", "<leader>t", ":OverseerRun<CR>", opts)
map("n", "<leader>T", ":OverseerToggle<CR>", opts)

map("n", "<leader>ca", function()
	require("tiny-code-action").code_action()
end, opts)

for i = 1, 9 do
	map("n", "<A-" .. i .. ">", function()
		local buffers = vim.fn.getbufinfo({ buflisted = 1 })
		if buffers[i] then
			vim.cmd("buffer " .. buffers[i].bufnr)
		end
	end)
end

map("n", "<C-q>", function()
	require("snacks").bufdelete()
end, opts)

-- General
map("n", "<leader>d", '"_d', opts)
map("v", "<leader>d", '"_d', opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- LSP
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

-- Splits
map("n", "<leader>sv", "<C-w>v", opts)
map("n", "<leader>sh", "<C-w>s", opts)
map("n", "<leader>se", "<C-w>=", opts)
map("n", "<leader>sx", "<cmd>close<CR>", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Buffers
map("n", "<Tab>", "<cmd>bnext<CR>", opts)
map("n", "<S-Tab>", "<cmd>bprevious<CR>", opts)
map("n", "<leader>bd", "<cmd>bdelete<CR>", opts)

-- Git (via snacks)
map("n", "<leader>gb", function()
	Snacks.git.blame_line()
end, opts)
map("n", "<leader>gd", function()
	Snacks.picker.git_diff()
end, opts)
map("n", "<leader>gh", function()
	Snacks.picker.git_log_file()
end, opts)
map("n", "<leader>gs", function()
	Snacks.picker.git_status()
end, opts)

-- DAP / Debugging
map("n", "<F5>", '<cmd>lua require"dap".continue()<CR>', opts)
map("n", "<F10>", '<cmd>lua require"dap".step_over()<CR>', opts)
map("n", "<F11>", '<cmd>lua require"dap".step_into()<CR>', opts)
map("n", "<F12>", '<cmd>lua require"dap".step_out()<CR>', opts)
map("n", "<leader>db", '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)
map("n", "<leader>dB", '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
map("n", "<leader>du", '<cmd>lua require"dapui".toggle()<CR>', opts)

-- Neotest
map("n", "<leader>tn", '<cmd>lua require("neotest").run.run()<CR>', opts)
map("n", "<leader>ts", '<cmd>lua require("neotest").summary.toggle()<CR>', opts)
map("n", "<leader>td", '<cmd>lua require("neotest").run.run({strategy = "dap"})<CR>', opts)
