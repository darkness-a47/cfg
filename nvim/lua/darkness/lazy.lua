local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
    "folke/neodev.nvim",
    "nvim-treesitter/nvim-treesitter",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    { "rose-pine/neovim" },
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    {'ThePrimeagen/harpoon'},
    {'nvim-telescope/telescope.nvim'},
    {'natecraddock/telescope-zf-native.nvim'},
    {'windwp/nvim-autopairs'},
    { "catppuccin/nvim", name = "catppuccin" },
    { "folke/tokyonight.nvim" }
})
