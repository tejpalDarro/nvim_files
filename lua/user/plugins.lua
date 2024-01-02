local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    -- snapshot = "july-24",
    snapshot_path = fn.stdpath "config" .. "/snapshots",
    max_jobs = 50,
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
        prompt_border = "rounded", -- Border style of prompt popups.
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- Plugin Mangager
    use "wbthomason/packer.nvim" -- Have packer manage itself

    -- -- Lua Development
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

    -- vim be good game
    use "ThePrimeagen/vim-be-good"

    -- -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    -- -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use({
        "glepnir/lspsaga.nvim",
        opt = true,
        branch = "main",
        event = "LspAttach",
        requires = {
            { "nvim-tree/nvim-web-devicons" },
            --Please make sure you install markdown and markdown_inline parser
            { "nvim-treesitter/nvim-treesitter" }
        }
    })

    -- Tabs
    -- use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}

    -- Completion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip" -- snippet completions

    -- Snippet
    use "L3MON4D3/LuaSnip"           --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- Syntax/Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use "windwp/nvim-ts-autotag"
    use "kylechui/nvim-surround"

    -- Marks
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    -- Fuzzy Finder/Telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    }

    -- Color scheme
    use 'rose-pine/neovim'
    use 'fenetikm/falcon'
    use "savq/melange-nvim"
    use 'rockerBOO/boo-colorscheme-nvim'
    use({ 'projekt0n/github-nvim-theme' })
    use({ "miikanissi/modus-themes.nvim" })
    use { 'nyoom-engineering/oxocarbon.nvim' }
    use "xiyaowong/transparent.nvim"
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    })
    use {
        'Verf/deepwhite.nvim'
    }
    use 'arzg/vim-colors-xcode'

    -- Utility
    -- use "rcarriga/nvim-notify"

    -- Icon
    use "kyazdani42/nvim-web-devicons"

    -- Debugging
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use "theHamsta/nvim-dap-virtual-text"
    use 'leoluz/nvim-dap-go'

    -- rust debug

    use {
        "simrat39/rust-tools.nvim",
        config = function()
            require("user/configs/rust-tools").setup()
        end,
    }


    -- Statusline
    use "christianchiarulli/lualine.nvim"

    -- File Explorer
    use "kyazdani42/nvim-tree.lua"

    -- Comment
    use "numToStr/Comment.nvim"

    -- Terminal
    use "akinsho/toggleterm.nvim"


    -- Editing Support
    use "windwp/nvim-autopairs"

    -- Java
    use "mfussenegger/nvim-jdtls"

    -- Graveyard
    use "rcarriga/cmp-dap"
    use "folke/trouble.nvim"

    use 'cvigilv/esqueleto.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
