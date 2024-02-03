require'nvim-treesitter.configs'.setup({
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>',
          scope_incremental = '<CR>',
          node_incremental = '<leader>o',
          node_decremental = '<leader>i',
        },
    }
})
