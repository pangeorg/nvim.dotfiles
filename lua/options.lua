vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Set highlight on search
vim.o.hlsearch = true
vim.opt.incsearch = true

-- Make line numbers default
vim.wo.number = true
vim.opt.nu = true
vim.opt.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this

vim.o.background = 'dark'
vim.o.termguicolors = true

-- vim.o.shellslash = true

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

function SetCStyleTabstops()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'c' },
    desc = 'Tabstop = 2 for c and rust',
    command = 'lua SetCStyleTabstops()'
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'jinja2' },
    desc = 'Jinja2 templates are html',
    command = 'set ft=html'
})


vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'fsx', 'fs' },
    desc = 'Autohover',
    command = 'CursorHold *.fs,*.fsi,*.fsx call fsharp#showTooltip()'
})

vim.g.terminal_emulator = 'pwsh'
vim.opt.shell = 'pwsh.exe'
vim.o.shellcmdflag =
'-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellquote = ''
vim.o.shellxquote = ''

-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

--
vim.cmd([[ let g:fsharp#lsp_auto_setup = 0 ]])

-- 
