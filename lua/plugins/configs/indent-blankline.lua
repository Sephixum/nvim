vim.opt.list = true

require("indent_blankline").setup({
    show_trailing_blankline_indent = false,
    show_current_context = true,
    show_current_context_start = false,
})

require('indent-o-matic').setup {
    max_lines = 2048,
    standard_widths = { 2 },
    skip_multiline = true,
}
