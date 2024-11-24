local cmp = require('cmp')
-- local luasnip = require('luasnip')
cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
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
		['<CR>'] = cmp.mapping.confirm({select = true}),
		['<Tab>'] = cmp.mapping(function(fallback)
			local luasnip = require('luasnip')
			local col = vim.fn.col('.') - 1

			if cmp.visible() then
				cmp.select_next_item({ behavior = 'select' })
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
				fallback()
			else
				cmp.complete()
			end
		end, { 'i', 's' }),

		-- Super shift tab
		['<S-Tab>'] = cmp.mapping(function(fallback)
			local luasnip = require('luasnip')

			if cmp.visible() then
				cmp.select_prev_item({ behavior = 'select' })
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),

	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end
	},
})

