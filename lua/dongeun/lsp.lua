-- diagnostic config
vim.diagnostic.config({
    virtual_text = {
        spacing = 0,
        format = function(diagnostic)
            if diagnostic.severity == vim.diagnostic.severity.ERROR then
                return "ERROR"
            end
            if diagnostic.severity == vim.diagnostic.severity.WARN then
                return "WARN"
            end
            if diagnostic.severity == vim.diagnostic.severity.HINT then
                return "HINT"
            end
            return "INFO"
        end,
    },
})

-- mason
require("mason").setup()
require("mason-lspconfig").setup()

-- null-ls
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.prettierd,
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.formatting.autopep8,
        require("null-ls").builtins.formatting.google_java_format,
        require("null-ls").builtins.formatting.ktlint,
        require("null-ls").builtins.diagnostics.ktlint,
    },
})

vim.api.nvim_create_autocmd("BufWritePre", {
    command = "lua vim.lsp.buf.format()",
})

-- completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local luasnip = require("luasnip")
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
})

-- mappings
local on_attach = function(_, bufnr)
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
end

-- nvim-lspconfig
require("lspconfig").pyright.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").tsserver.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})
