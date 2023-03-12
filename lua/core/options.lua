vim.g.mapleader = " "

vim.wo.number = true

vim.o.relativenumber = true

vim.opt.confirm = true

vim.opt.cursorline = true

vim.g.neovide_padding_top=35
vim.g.neovide_padding_left=28
vim.g.neovide_padding_right=28
vim.g.neovide_padding_bottom=10

-- horizontal line
-- vim.api.nvim_set_hl(0, "lualine_c_inactive", { underline = true })

-- Format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

vim.cmd [[autocmd BufWritePre <buffer> GuessIndent]]

-- vim.cmd [[autocmd InsertLeave <buffer> lua vim.lsp.codelens.refresh()]]
-- vim.cmd [[autocmd InsertLeave <buffer> lua vim.lsp.code_lens_refresh()]]
-- vim.cmd [[autocmd  InsertLeave <buffer> lua vim.lsp.codelens.refresh() FileType=cs]]
-- vim.cmd([[
--   autocmd InsertLeave *.cs lua vim.lsp.codelens.refresh()
-- ]])
