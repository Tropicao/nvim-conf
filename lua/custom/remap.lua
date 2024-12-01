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
local function build_make_command(...)
	local build_cmd = "make"
	local cores = tonumber(vim.fn.system("nproc"))
	build_cmd="make -j" .. tostring(cores - 1)
	for _,v in ipairs({...}) do
		build_cmd = build_cmd .. v
	end
	return build_cmd
end

vim.keymap.set("n", "<leader>m", function()
	local task_cmd = os.getenv("TASK_CMD")
	if task_cmd == nil then
		task_cmd = build_make_command()
	end
	vim.cmd("wa");
	-- If TASK_CMD is enclosed between quotes, remove those
	task_cmd = string.gsub(task_cmd, '"(.*)"', "!%1")
	vim.cmd(task_cmd)
end
	)
vim.keymap.set("n", "<leader>b", function()
	local cmd = "!bear -- " .. build_make_command()
	cmd = string.gsub(cmd, '"(.*)"', "%1")
	print(cmd)
	vim.cmd(cmd)
end)

-- Map pane resize
vim.keymap.set("n", "<leader>,", ":vertical resize -10<CR>")
vim.keymap.set("n", "<leader>.", ":vertical resize +10<CR>")

-- Quick add missing semicolon
vim.keymap.set("n", "<leader>;", "A;<ESC>")
