local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = true,
  update_in_insert = true,
  always_visible = true,
}

local diff = {
  "diff",
  colored = true,
  symbols = { added = "+", modified = "*", removed = "-" }, -- changes diff symbols
  cond = hide_in_width
}
local mode = {
  "mode",
  fmt = function(str)
    return "-- " .. str .. " --"
  end,
}

local filetype = {
  "filetype",
  icons_enabled = true,
  icon = nil,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local location = {
  "location",
  padding = 1,
}

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "pywal-nvim",
    -- component_separators = { left = "", right = "" },
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "", right = "" },
    -- disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
    disabled_filetypes = { "dashboard", "Outline" },
    always_divide_middle = true,
    globalstatus = true
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch, diagnostics },
    lualine_c = {},
    -- lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_x = { diff, spaces, "fileformat", filetype },
    lualine_y = { location },
    lualine_z = { progress },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})

------------------------------------------------------------------------------------------

-- require('lualine').setup {
--   options = {
--     icons_enabled = true,
--     theme = 'pywal',
--     component_separators = { left = '', right = '' },
--     section_separators = { left = '', right = '' },
--     disabled_filetypes = {
--       statusline = {},
--       winbar = {},
--     },
--     ignore_focus = {},
--     always_divide_middle = true,
--     globalstatus = true,
--     refresh = {
--       statusline = 1000,
--       tabline = 1000, winbar = 1000,
--     }
--   },
--   sections = {
--     lualine_a = { 'mode' },
--     lualine_b = { 'branch', 'diff', 'diagnostics' },
--     lualine_c = { 'filename' },
--     lualine_x = { 'encoding', 'fileformat', 'filetype' },
--     lualine_y = { 'progress' },
--     lualine_z = { 'location' }
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = { 'filename' },
--     lualine_x = { 'location' },
--     lualine_y = {},
--     lualine_z = {}
--   },
--   tabline = {},
--   winbar = {},
--   inactive_winbar = {},
--   extensions = {}
-- }
