return {
	'folke/tokyonight.nvim',
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme tokyonight]])
        require('tokyonight').setup({
            style = 'storm',
            transparent = true,
            terminal_colors = true,
        })
	end,
}
