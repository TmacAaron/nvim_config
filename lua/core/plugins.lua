local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git',
        'clone',
        '--depth',
        '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

vim.cmd [[packadd packer.nvim]]
return packer.startup(function()

    use 'wbthomason/packer.nvim'

    -- starup time optimise
    use 'dstein64/vim-startuptime'
    use 'lewis6991/impatient.nvim'
    use 'nathom/filetype.nvim'
    use 'rcarriga/nvim-notify'
    use 'ethanholz/nvim-lastplace'

    -- themes (disabled other themes to optimize startup time)
    use 'sainnhe/sonokai'
    --    use 'morhetz/gruvbox'
    --    use 'joshdick/onedark.vim'
    -- use { 'catppuccin/nvim', as='catppuccin' }
    --    use { 'sonph/onehalf', rtp='vim/' }
    --    use 'liuchengxu/space-vim-dark'
    --    use 'ahmedabdulrahman/aylin.vim'

    -- icons
    use 'kyazdani42/nvim-web-devicons'

    -- show cursor
    use 'edluffy/specs.nvim'

    -- indent line
    use 'lukas-reineke/indent-blankline.nvim'

    -- fold
    use {
        'anuvyklack/pretty-fold.nvim',
        requires = 'anuvyklack/nvim-keymap-amend'
    }

    -- multi cursor
    use {
        'mg979/vim-visual-multi',
        branch = 'master'
    }

    -- smooth movement
    -- use 'declancm/cinnamon.nvim'
    use 'karb94/neoscroll.nvim'

    -- hl same word
    use 'RRethy/vim-illuminate'

    -- hl text
    use 'Pocco81/HighStr.nvim'

    -- startup page
    use 'goolord/alpha-nvim'

    use 'mrjones2014/smart-splits.nvim'

    -- stauts line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- bufferline
    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons' }
    -- use({
    --     'noib3/nvim-cokeline',
    --     requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
    --  })

    -- focus
    use 'Pocco81/TrueZen.nvim'

    -- trouble
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }

    -- todo-comments
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }

    -- lsp server
    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
    }
    use 'rmagatti/goto-preview'
    -- code action
    use 'kosayoda/nvim-lightbulb'
    require('packer').use({
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    })
    -- grammar
    use {
        "brymer-meneses/grammar-guard.nvim",
        requires = {
            "neovim/nvim-lspconfig",
            "williamboman/nvim-lsp-installer"
        }
    }
    -- completion nvim-cmp
    use {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lua',
        'f3fora/cmp-spell',
        'rafamadriz/friendly-snippets', -- snippets
    }
    use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
    use 'stevearc/aerial.nvim'
    use 'ray-x/lsp_signature.nvim'
    use 'j-hui/fidget.nvim' -- lsp progress
    use {
        "iurimateus/luasnip-latex-snippets.nvim",
        requires = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
        ft = "tex",
    }

    -- debug -dap
    use 'mfussenegger/nvim-dap'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'rcarriga/nvim-dap-ui'
    use 'ravenxrz/DAPInstall.nvim'

    -- cmake
    use 'Shatur/neovim-cmake'

    -- git
    use {
        'lewis6991/gitsigns.nvim',
        -- tag = 'release' -- To use the latest release
    }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- file tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- tagbar
    use 'simrat39/symbols-outline.nvim'

    -- float terminal
    use 'akinsho/toggleterm.nvim'

    -- file search -telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'kyazdani42/nvim-web-devicons' }
        }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }
    use 'nvim-telescope/telescope-ui-select.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use "nvim-telescope/telescope-live-grep-raw.nvim"
    use "MattesGroeger/vim-bookmarks"
    use "tom-anders/telescope-vim-bookmarks.nvim"
    use 'nvim-telescope/telescope-project.nvim'
    use "ahmedkhalf/project.nvim"
    use 'nvim-telescope/telescope-dap.nvim'

    -- quickly jump
    use {
        'phaazon/hop.nvim',
        branch = 'v1', -- optional but strongly recommended
    }

    -- color
    use 'norcalli/nvim-colorizer.lua'

    -- comment
    use 'numToStr/Comment.nvim'

    -- autopairs
    use 'windwp/nvim-autopairs'

    -- repeat
    use 'tpope/vim-repeat'
    -- rename
    -- use {
    --     'filipdutescu/renamer.nvim',
    --     branch = 'master',
    --     requires = { {'nvim-lua/plenary.nvim'} }
    -- }

    -- tabout
    -- use {
    --     'abecodes/tabout.nvim',
    --     wants = {'nvim-treesitter'},
    --     -- after = {completion-nvim}
    -- }

    -- expand region
    -- use 'terryma/vim-expand-region'
    use 'gcmt/wildfire.vim'

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'andymass/vim-matchup'
    use 'romgrk/nvim-treesitter-context'
    use 'm-demare/hlargs.nvim'
    -- use 'SmiteshP/nvim-gps'
    use 'ur4ltz/surround.nvim'
    use 'mizlan/iswap.nvim' -- swap
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'haringsrob/nvim_context_vt'

    -- latex
    use 'lervag/vimtex'

    -- which-key
    use 'folke/which-key.nvim'

    -- formatter
    use 'mhartington/formatter.nvim'

    -- auto save/load
    use 'Pocco81/AutoSave.nvim'
    use 'djoshea/vim-autoread'

    if packer_bootstrap then
        require('packer').sync()
    end

end)
