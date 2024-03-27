local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

local packer = require 'packer'
packer.init {
    compile_path = 'lua/compiled/packer_compiled.lua',
}

return packer.startup {
    function(use)
        use 'wbthomason/packer.nvim'
        -- My plugins here
        ---- Libs
        use 'nvim-lua/plenary.nvim'
        -- Cosmetics
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        }
        use { 'akinsho/bufferline.nvim', tag = 'v3.*', requires = 'nvim-tree/nvim-web-devicons' }
        -- Navigations
        use 'ThePrimeagen/harpoon'
        -- use 'direnv/direnv.vim'
        ---- LSP
        use 'williamboman/mason.nvim'
        use 'williamboman/mason-lspconfig.nvim'
        use 'neovim/nvim-lspconfig'
        use 'jose-elias-alvarez/null-ls.nvim'
        use 'simrat39/inlay-hints.nvim'
        ---- Completion
        use 'rafamadriz/friendly-snippets'
        use 'L3MON4D3/LuaSnip'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'
        use 'saadparwaiz1/cmp_luasnip'
        ---- DAP
        use 'mfussenegger/nvim-dap'
        ---- Comments
        use 'terrortylor/nvim-comment'
        ---- Tools
        use 'nvim-telescope/telescope.nvim'
        use {
            'nvim-telescope/telescope-file-browser.nvim',
            requires = {
                'nvim-telescope/telescope.nvim',
                'nvim-lua/plenary.nvim',
                'nvim-tree/nvim-web-devicons',
            },
        }
        ---- Tree Sitter
        use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                local ts_update = require('nvim-treesitter.install').update { with_sync = true }
                ts_update()
            end,
        }
        use 'nvim-treesitter/playground'
        ---- Css
        use 'NvChad/nvim-colorizer.lua'
        ---- Rust
        use 'simrat39/rust-tools.nvim'
        ---- Org-Mode
        use {
            'nvim-orgmode/orgmode',
            config = function() require('orgmode').setup {} end,
        }
        ---- Markdown
        use {
            'iamcco/markdown-preview.nvim',
            run = function() vim.fn['mkdp#util#install']() end,
        }
        ---- LaTeX
        use 'lervag/vimtex'
        ---- Git
        use {
            'lewis6991/gitsigns.nvim',
            tag = 'release',
        }
        ---- Themes
        use 'folke/tokyonight.nvim'
        use { 'catppuccin/nvim', as = 'catppuccin' }
        use 'projekt0n/github-nvim-theme'
        use 'Mofiqul/vscode.nvim'
        ---- Nicer folds
        use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require('packer').sync()
        end
    end,

    config = {
        display = {
            open_fn = function() return require('packer.util').float { border = 'single' } end,
        },
    },
}
