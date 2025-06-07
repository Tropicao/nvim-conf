return {
    'folke/tokyonight.nvim',
    tag = 'stable',
    style = 'moon',
    config = function ()
	    	vim.cmd('colorscheme tokyonight')
		vim.cmd('hi ColorColumn ctermbg=0 guibg=#9070DB')
	end
    }
