-- install new LSP 
require("nvim-lsp-installer").setup({
    -- List of servers to automatically install
    ensure_installed = { 'pyright', 'tsserver', 'eslint', 'jdtls', 'sumneko_lua', 'clangd' },
    -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    automatic_installation = true,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- from: https://github.com/williamboman/nvim-lsp-installer/discussions/636
local lspconfig = require("lspconfig")
lspconfig.pyright.setup {}
lspconfig.tsserver.setup{}
lspconfig.eslint.setup {}
lspconfig.jdtls.setup {}
lspconfig.sumneko_lua.setup {}
lspconfig.clangd.setup {}
