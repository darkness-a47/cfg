require("mason").setup()
require("mason-lspconfig").setup()
local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  lsp_zero.default_keymaps({buffer = bufnr})
end)
local cmp = require('cmp')
cmp.setup({
  sources = {
    {name = 'nvim_lsp'}
  },
  mapping = cmp.mapping.preset.insert({
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
      ["<C-Space>"] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

lsp.lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      }
    }
  }
})

require'lspconfig'.rust_analyzer.setup{}

capabilities.textDocument.completion.completionItem.snippetSupport = true;
require'lspconfig'.html.setup{
    capabilities = capabilities,
    opts = {
      settings = {
        html = {
          format = {
            templating = true,
            wrapLineLength = 120,
            wrapAttributes = 'auto',
          },
          hover = {
            documentation = true,
            references = true,
          },
        },
      },
    }
}

require'lspconfig'.bashls.setup{}
require'lspconfig'.astro.setup{}
require'lspconfig'.tailwindcss.setup{
    filetypes = { "html", "astro", "vue", "typescriptreact" }
}
require'lspconfig'.volar.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.eslint.setup{}
require'lspconfig'.gopls.setup{}
