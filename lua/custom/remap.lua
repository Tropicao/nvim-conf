vim.g.mapleader = " "
vim.keymap.set("n", "<leader>f", vim.cmd.Ex)
vim.keymap.set("n", "<leader>n", vim.cmd.bnext)
vim.keymap.set("n", "<leader>bd", vim.cmd.bdelete)

-- Allow to move whole lines, and auto-indent them
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep yanked word in buffer when pasting it over another one
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Copy into primary buffer
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("x", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- Navigate between buffers
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")
vim.keymap.set("v", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("v", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("v", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("v", "<C-l>", ":wincmd l<CR>")
vim.keymap.set("x", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("x", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("x", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("x", "<C-l>", ":wincmd l<CR>")

-- Search and replace all occurences in file
vim.keymap.set("n", "<leader>h", ":%s/<C-r><C-w>")

-- Make shortcut. Custom make target can be provided with the TARGET env
-- variable
vim.keymap.set("n", "<leader>m", function()
	-- TODO: replace hardcoded jobs count with cpu detection
	local make_target = os.getenv("TARGET")
	local make_cmd="!make -j18"
	if make_target ~= nil then
		make_cmd = make_cmd .. " " .. make_target
	end
	vim.cmd("wa");
	vim.cmd(make_cmd)
end
	)
vim.keymap.set("n", "<leader>b", function()
	vim.fn.system("bear -- make -j18")
end)
