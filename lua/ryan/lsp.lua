local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })
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
        ['tsserver'] = { 'javascript', 'typescript' },
        ['rust_analyzer'] = { 'rust' },
        ['gopls'] = { 'go' },
        ['templ'] = { 'templ' },
        ['lua_ls'] = { 'lua' },
        ['marksman'] = { 'markdown' },
        ['taplo'] = { 'toml' },
    }
})

-- lsp.set_preferences({
--     sign_icons = {}
-- })

-- setup mason & mason-lsp
require("mason").setup()
require("mason-lspconfig").setup()

local util = require "lspconfig/util"

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
require('lspconfig').templ.setup({})
require('lspconfig').gopls.setup({
    cmd = { "gopls", "serve" },
    filetypes = { "go", "gomod" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,

        },
    },
})
require('lspconfig').html.setup({})
require('lspconfig').pyright.setup({})
require('lspconfig').terraform_lsp.setup({})
require('lspconfig').tsserver.setup({})
require('lspconfig').marksman.setup({})
require('lspconfig').taplo.setup({})
require('lspconfig').tailwindcss.setup({
    settings = {
        tailwindCSS = {
            experimental = {
                classRegex = {
                    "tailwind\\('([^)]*)\\')", "'([^']*)'",
                    "([a-zA-Z0-9\\-:]+)",
                },
            },
        },
    },
    --        settings = {
    --        filetypes = { "html", "templ", "svelte", "typescriptreact", "react" },
    --        root_dir = util.root_pattern("tailwind.config.js", "package.json", "go.work", "go.mod", ".git"),
    --        tailwindCSS = {
    --            experimental = {
    --                classRegex = {
    --                    "classList.(?:add|remove)\\(([^)]*)\\)", "(?:'|\"|`)([^\"'`]*)(?:'|\"|`)", -- DOM
    --                    "(?:add|remove)Class\\(([^)]*)\\)", "(?:'|\"|`)([^\"'`]*)(?:'|\"|`)",      -- JQuery
    --                    "class=\"([^\"]*)\"", "([a-zA-Z0-9\\-:]+)",                                -- HAML
    --                },
    --            },
    --        },
    --    },
})

-- create keybindings
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_action),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_action),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    })
})

-- local cmp_action = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
-- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_action),
-- ['<C-n>'] = cmp.mapping.select_next_item(cmp_action),
-- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
-- ['<C-Space>'] = cmp.mapping.complete(),
-- })
