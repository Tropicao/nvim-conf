local opt = vim.opt

opt.nu = true
opt.tw=75
opt.hlsearch=true
opt.tabstop=8
opt.softtabstop=8
opt.shiftwidth=8
opt.expandtab=false
opt.incsearch=true
opt.scrolloff=999
opt.mouse="c"
opt.autoread=true
opt.colorcolumn="80"
local statusline = {
	"%#String#",	-- highlight
	"%f",		-- filename
	"%#MoreMsg#",	-- highlight
	"%M",		-- modified ?
	"%r",		-- read-only ?
	"%{%v:lua.require('nvim-treesitter').statusline()%}", -- current func
	"%#CursorLineNr#",	-- highlight
	"%=%l,%v",
	"%#MoreMsg#",	-- highlight
	"%p%%"		-- file percentage
}
opt.statusline = table.concat(statusline, ' ')
