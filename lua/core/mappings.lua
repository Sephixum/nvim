local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- exit normal mode
keymap('i', 'jk', '<ESC>', { noremap = true })

-- Standard Operations
keymap('n', '<C-s>', '<cmd>w<cr>', { noremap = true, silent = false, desc = 'Save' })
keymap('n', '<leader>q', '<cmd>q<cr>', { noremap = true, silent = false, desc = 'Quit' })

-- Buffdelete
vim.keymap.set('n', '<leader>c', function() require("bufdelete").bufdelete(0, false) end)

-- nvim tree
keymap('n', '<leader>e', ':NvimTreeToggle<cr>', { noremap = true })

-- Window navigations
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
keymap('n', '<C-Up>', ':resize -2<CR>', opts)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move text up and down
keymap('n', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
keymap('n', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)

-- bufferline
-- keymap('n', '<leader>ts', '<CMD>BufferLinePickClose<CR>',
-- 	{ noremap = true, silent = true, desc = 'Close the picked buffer' })


-- trouble
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
	{ silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
	{ silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
	{ silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
	{ silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
	{ silent = true, noremap = true }
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)


keymap('n', '<S-l>', '<CMD>BufferLineCycleNext<CR>', { noremap = true, silent = true })
keymap('n', '<S-h>', '<CMD>BufferLineCyclePrev<CR>', { noremap = true, silent = true })
keymap('n', ']b', '<CMD>BufferLineMoveNext<CR>',
	{ noremap = true, silent = true, desc = 'Move current buffer back' })
keymap('n', '[b', '<CMD>BufferLineMovePrev<CR>',
	{ noremap = true, silent = true, desc = 'Move current buffer next' })
keymap('n', 'gs', '<CMD>BufferLineSortByDirectory<CR>',
	{ noremap = true, silent = true, desc = 'Sort buffer by directory' })

-- formating
-- keymap('n', '<leader>f', '<CMD>lua vim.lsp.buf.format()<CR>',
-- 	{ noremap = true, silent = true, desc = 'Format the current buffer' })

local wk = require('which-key')

wk.register({
	['<localleader>'] = {
		l = {
			name = '+Latex'
		}
	},
	['<leader>'] = {
		w = { '<cmd>write<cr>', 'Write current buffer' },
		x = { name = '+Show bugs' },
		q = { '<cmd>quit<cr>', 'Exit current buffer' },
		e = { '<cmd>NvimTreeToggle<cr>', 'Toggle explorer' },
		f = { '<cmd>Format<cr>', 'Format the current buffer' },
		s = { function() require('silicon').visualise_cmdline({ to_clip = true }) end, "Copy code snap to clipboard" },
		c = { 'close buffer' },
	},

})
