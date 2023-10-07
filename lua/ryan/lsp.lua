local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['tsserver'] = {'javascript', 'typescript'},
        ['rust_analyzer'] = {'rust'},
        ['gopls'] = {'go'},
    }
})

-- lsp.set_preferences({
--     sign_icons = {}
-- })

-- setup mason & mason-lsp
require("mason").setup()
require("mason-lspconfig").setup()

-- setup language servers
require('lspconfig').rust_analyzer.setup({})
require('lspconfig').lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})
require('lspconfig').gopls.setup({})
require('lspconfig').html.setup({})
require('lspconfig').pyright.setup({})
require('lspconfig').templ.setup({})
require('lspconfig').terraform_lsp.setup({})
require('lspconfig').tsserver.setup({})

-- create keybindings
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    })
})

-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
    -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    -- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    -- ['<C-Space>'] = cmp.mapping.complete(),
-- })


