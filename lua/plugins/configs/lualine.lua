local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local status_ok, cmake = pcall(require, 'cmake-tools')
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

local navic = require('nvim-navic')
navic.setup({
  icons = {
    File          = "󰈙 ",
    Module        = " ",
    Namespace     = "󰌗 ",
    Package       = " ",
    Class         = " ",
    Method        = "󰆧 ",
    Property      = " ",
    Field         = " ",
    Constructor   = " ",
    Enum          = "󰕘 ",
    Interface     = "󰕘 ",
    Function      = "󰊕 ",
    Variable      = "󰆧 ",
    Constant      = "󰏿 ",
    String        = "󰀬 ",
    Number        = "󰎠 ",
    Boolean       = "◩ ",
    Array         = "󰅪 ",
    Object        = "󰅩 ",
    Key           = "󰌋 ",
    Null          = "󰟢 ",
    EnumMember    = " ",
    Struct        = "󰌗 ",
    Event         = " ",
    Operator      = "󰆕 ",
    TypeParameter = "󰊄 ",
  },
  lsp = {
    auto_attach = false,
    preference = nil,
  },
  highlight = true,
  separator = " -> ",
  depth_limit = 0,
  depth_limit_indicator = "..",
  safe_output = true,
  click = false
})

local my_filename = require('lualine.components.filename'):extend()
my_filename.apply_icon = require('lualine.components.filetype').apply_icon
my_filename.icon_hl_cache = {}

local config = {
  options = {
    icons_enabled = true,
    theme = "pywal16-nvim",
    -- component_separators = { left = "", right = "" },
    component_separators = { left = " | ", right = " | " },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = { 'alpha' },
      winbar = { 'NvimTree', 'alpha', 'dap-repl' },
    },
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
  winbar = {
    lualine_c = { {
      my_filename, colored = true
    },
      {
        'navic',
        color_correction = nil,
        navic_opts = nil
      }
    }
  },
  inactive_winbar = { lualine_a = { 'filename' } },
  extensions = {},
}

-- local function ins_left(component)
--   table.insert(config.sections.lualine_c, component)
-- end

-- ins_left {
--   function()
--     local type = cmake.get_build_type()
--     return " CMake: [" .. (type and type or "") .. "] "
--   end,
--   icon = "",
--   cond = function()
--     return cmake.is_cmake_project() and not cmake.has_cmake_preset()
--   end,
--   on_click = function(n, mouse)
--     if (n == 1) then
--       if (mouse == "l") then
--         vim.cmd("CMakeSelectBuildType")
--       end
--     end
--   end
-- }

-- ins_left {
--   function()
--     return " Build "
--   end,
--   icon = '',
--   cond = cmake.is_cmake_project,
--   on_click = function(n, mouse)
--     if (n == 1) then
--       if (mouse == "l") then
--         vim.cmd("CMakeBuild")
--       end
--     end
--   end
-- }


lualine.setup(config)
