vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- default
    use("wbthomason/packer.nvim")
    use("folke/tokyonight.nvim")
    use({
        "nvim-treesitter/nvim-treesitter",
    })
    use("romgrk/barbar.nvim")
    use("nvim-lualine/lualine.nvim")
    use("kyazdani42/nvim-web-devicons")
    use({ "junegunn/fzf", run = ":call fzf#install()" })
    use({ "junegunn/fzf.vim" })

    -- lsp
    use("neovim/nvim-lspconfig")
    use({ "williamboman/mason.nvim" })
    use("williamboman/mason-lspconfig.nvim")
    use({ "L3MON4D3/LuaSnip" })
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
    use({ "saadparwaiz1/cmp_luasnip" })
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("null-ls").setup()
        end,
        requires = { "nvim-lua/plenary.nvim" },
    })

    -- java
    use("mfussenegger/nvim-jdtls")
    use("mfussenegger/nvim-dap")
end)
