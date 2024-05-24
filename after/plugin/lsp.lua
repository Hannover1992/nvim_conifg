local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader><CR>", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
    vim.keymap.set("n", "<leader>cw", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>ls", function() vim.lsp.stop() end, opts) -- stop lsp
    vim.keymap.set("n", "<leader>lb", function() vim.lsp.start() end, opts) -- start lsp

    -- the other guy

    --      opts.desc = "Show LSP definitions"
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',      -- for TypeScript
        'eslint',        -- for JavaScript/TypeScript linting
        'rust_analyzer', -- for Rust
        'texlab',        -- for LaTeX
        'cssls',         -- for CSS
        'html',          -- for HTML
        'pyright',       -- for Python
        'bashls',        -- for Bash
    };
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})

require'lspconfig'.omnisharp.setup{}

require'lspconfig'.csharp_ls.setup{}


local lsp_config= require("lspconfig")

lsp_config.lua_ls.setup(lsp_zero.nvim_lua_ls())

lsp_config['omnisharp'].setup {
    handlers = {
        ["textDocument/definition"] = require('omnisharp_extended').handler,
    },
    cmd = { '/home/uczen/.local/share/nvim/mason/packages/omnisharp/omnisharp', '--languageserver' }
}

lsp_zero.setup()
