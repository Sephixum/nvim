vim.g.mapleader = " "
vim.wo.number = true
vim.o.relativenumber = true

-- horizontal line
-- vim.api.nvim_set_hl(0, "lualine_c_inactive", { underline = true })

-- Format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

