local builtin = require("statuscol.builtin")
local M = require("statuscol")
M.setup({
	relculright = true,
	segments = {
		{ text = { builtin.foldfunc },      click = "v:lua.ScFa" },
		{ text = { "%s" },                  click = "v:lua.ScSa" },
		{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
	},
})
return M
