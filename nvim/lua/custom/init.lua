require("custom.remap")
require("custom.set")

-- Automatically change vim working dir to targeted directory
vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = function() vim.fn.chdir(vim.fn.expand("%:p:h")) end
})


-- Load env file in current directory
vim.api.nvim_create_autocmd({"DirChanged", "VimEnter"}, {
	pattern = "*",
	callback = function()
		local f = io.open(".env", "r")
		if f==nil then return end
		io.close(f)
		for l in io.lines(".env") do
			if string.find(l, "^[%w%p]+=[%w%p]+") then
				local i = string.find(l, "=")
				vim.fn.setenv(string.sub(l, 0, i-1), string.sub(l, i+1, string.len(l)))
			end
		end
	end
})

-- Change C comment style
vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function()
		vim.opt.commentstring="// %s"
	end
})
