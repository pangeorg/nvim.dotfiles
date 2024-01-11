
-- Install package manager
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
            vim.cmd.colorscheme 'tokyonight'
        end,
    },

    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                theme = 'tokyonight-night',
                component_separators = '|',
                section_separators = '',
            },
        },
    },

    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },

    {'neoclide/coc.nvim'},

    {
        'nvim-telescope/telescope.nvim', 
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

}

require('lazy').setup(lazy_default_table, {})
