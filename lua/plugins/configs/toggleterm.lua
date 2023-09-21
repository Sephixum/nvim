require("toggleterm").setup{
	direction = 'float',
	open_mapping = [[<A-3>]],
	float_opts = {
		border = 'curved',
	},
	winbar = {
		enabled = true,
		name_formatter = function(Terminal)
			return Terminal.name
		end
	},
}
