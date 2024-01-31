
--winget install zig.zig Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

local lazy_default_table = {

    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
         'hrsh7th/cmp-nvim-lsp',
        }
    },

    -- Useful plugin to show you pending keybinds.
    { 'folke/which-key.nvim', opts = {} },
    {
        -- Theme inspired by Atom
        -- 'navarasu/onedark.nvim',
        -- config = function()
        --   vim.cmd.colorscheme 'onedark'
        --   vim.api.nvim_set_hl(0, 'Comment', { italic=false, fg='Grey' })
        -- end,
        -- 'rose-pine/neovim', name = 'rose-pine' 
        --
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd.colorscheme 'tokyonight-night'
        end,
    },

    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                theme = 'tokyonight',
                component_separators = '|',
                section_separators = '',
            },
        },
    },

    --  The configuration is done below. Search for lspconfig to find it below.
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
    },

    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
          'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
      },

    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },

    {
        'nvim-telescope/telescope.nvim', 
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

}

require('lazy').setup(lazy_default_table, {})
