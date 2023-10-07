# Adding an LSP
Follow the direction [here](https://github.com/VonHeikemen/lsp-zero.nvim) to
setup and configure the LSP.

Configure available LSPs in `/lua/ryan/lsp.lua` by adding a line
```
require('lspconfig').XX.setup({})
```




where `XX` is an available LSP provided on this [list](https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers)

To allow formatting on save specify the file types to allow formatting in the
`lsp.format_on_save` block. For example:

```
lsp.format_on_save({
    ...
    servers = {
        ...
        ['tsserver'] = { 'javascript', 'typescript' },
        ['lua_ls'] = { 'lua' },
    }
})
```
