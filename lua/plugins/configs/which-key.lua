local M = require('which-key')
M.setup({
	window = {
		border = "single",
		position = "bottom",
		margin = { 1, 0, 1, 0 },
		padding = { 0, 0, 0, 0 },
		winblend = 10,
		zindex = 1000,
	},
	layout = {
		height = { min = 4, max = 10 },
		width = { min = 20, max = 50 },
		spacing = 5,
		align = "center",
	},
})

return M
