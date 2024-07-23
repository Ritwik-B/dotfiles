require('config.lazy')

local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
    -- lsp_zero.buffer_autoformat()

    local opts = {buffer = bufnr}

    vim.keymap.set({'n', 'x'}, 'gq', function()
        vim.lsp.buf.format({async = false, timeput_ms = 10000})
    end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.opt.scrolloff = 30
vim.opt.relativenumber = true
vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'


require('nvim-treesitter.configs').setup({
	ensure_installed = { "javascript", "typescript", "lua", "graphql", "jsdoc", "bash" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
