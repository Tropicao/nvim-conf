local cmp = require('cmp')
-- local luasnip = require('luasnip')
cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
	},
	mapping = cmp.mapping.preset.insert({
		-- Navigate between completion items
		['<C-p>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
		['<C-n>'] = cmp.mapping.select_next_item({ behavior = 'select' }),

		-- Ctrl+Space to trigger completion menu
		['<C-Space>'] = cmp.mapping.complete(),

		-- Scroll up and down in the completion documentation
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<CR>'] = cmp.mapping.confirm({select = false}),

	}),
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end
	},
})

