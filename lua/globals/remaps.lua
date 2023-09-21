vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<cr>", { noremap = true })

vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true, desc = "Stay in indent mode" })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true, desc = "Stay in indent mode" })

vim.api.nvim_set_keymap(
  "n",
  "<leader>o",
  "<CMD>SymbolsOutline<CR>",
  { noremap = true, silent = true, desc = "Toggle outline for the code" }
)

vim.api.nvim_set_keymap(
  "n",
  "<C-s>",
  "<CMD>w<CR>",
  { noremap = true, silent = true, desc = "Save current file" }
)

vim.api.nvim_set_keymap("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "]b",
  "<CMD>BufferLineMoveNext<CR>",
  { noremap = true, silent = true, desc = "Move current buffer back" }
)

vim.api.nvim_set_keymap(
  "n",
  "[b",
  "<CMD>BufferLineMovePrev<CR>",
  { noremap = true, silent = true, desc = "Move current buffer next" }
)

vim.api.nvim_set_keymap(
  "n",
  "gs",
  "<CMD>BufferLineSortByDirectory<CR>",
  { noremap = true, silent = true, desc = "Sort buffer by directory" }
)

vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h",
  { noremap = true, silent = true, desc = "Move current window left" })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j",
  { noremap = true, silent = true, desc = "Move current window down" })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k",
  { noremap = true, silent = true, desc = "Move current window up" })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l",
  { noremap = true, silent = true, desc = "Move current window right" })

vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>',
  { noremap = true, silent = true, desc = "Resize current window left" })
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>',
  { noremap = true, silent = true, desc = "Resize current window down" })
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>',
  { noremap = true, silent = true, desc = "Resize current window up" })
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>',
  { noremap = true, silent = true, desc = "Resize current window right" })

vim.api.nvim_set_keymap("i", "<C-k>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
vim.api.nvim_set_keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", {})

local wk = require("which-key")
local dap = require("dap")
local ui = require("dapui")
local cmake = require("cmake-tools")

wk.register({
  ["g"] = {
    d = {
      function()
        vim.lsp.buf.definition()
      end,
      "Go to definition",
    },
  },
  K = {
    function()
      vim.lsp.buf.hover()
    end,
    "Hover definition",
  },
  ["<leader>"] = {
    l = {
      name = "LSP",
      -- a = { "<cmd>CodeActionMenu<cr>", "Code actions" },
      a = {
        function ()
        require("actions-preview").code_actions()
         end, "Code actions" },
      f = {
        function()
          vim.lsp.buf.format();
        end,
        "Format current buffer"
      },
      s = { "<cmd>Telescope lsp_document_symbols", "Documents References" },
      d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" }
    },

    C = {
      name = "CMake",
      r = { "<cmd>CMakeRun<cr>", "Run" },
      g = { "<cmd>CMakeGenerate<cr>", "Generate" },
      d = {
        function()
          ui.toggle()
          vim.cmd("CMakeDebug")
        end,
        "Debug"
      },
      b = { "<cmd>CMakeBuild<cr>", "Build" },
      c = { "<cmd>CMakeClean<cr>", "Clean" },
      s = { "<cmd>CMakeStop<cr>", "Stop" }
    },

    d = {
      name = "DAP",
      s = {
        function()
          dap.continue()
          ui.toggle({})
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<c-w>=", false, true, true), "n", false)
        end,
        "Start session",
      },
      e = {
        function()
          dap.clear_breakpoints()
          ui.toggle({})
          dap.terminate()
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
          require("notify")("Debugger session ended", "warn")
        end,
        "End session",
      },
      c = {
        function()
          dap.continue()
        end,
        "Continue",
      },
      b = {
        function()
          dap.toggle_breakpoint()
        end,
        "Toggle breakpoint",
      },
      C = {
        function()
          dap.clear_breakpoints()
          require("notify")("Breakpoints cleared", "warn")
        end,
        "Clear breakpoints",
      },
      u = {
        function()
          ui.toggle()
          require("notify")("UI Toggled", "warn")
        end,
        "Toggle UI",
      },
    },
    w = { "<cmd>write<cr>", "Write current buffer" },
    q = { "<cmd>quit<cr>", "Exit current buffer" },
    e = { "<cmd>NvimTreeToggle<cr>", "Toggle explorer" },
    s = {
      function()
        require("silicon").visualise_cmdline({ to_clip = false })
      end,
      "Snap to clipboard",
    },
    t = {
      name = "Telescope",
      b = { "<cmd>Telescope buffers<cr>", "Buffers" }
    },
    x = {
      name = "Code troubles",
      x = { "<cmd>TroubleToggle<cr>", "Toggle" },
      w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace diagnostics" },
      d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document diagnostics" },
      l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
      q = { "<cmd>TroubleToggle quickfix<cr>", "Quick fix" },
      L = { "<cmd>Trouble lsp_references<cr>", "Lsp references"}
    },
    c = { function() require("bufdelete").bufdelete(0, false) end, "Close current buffer"
    },
  },
})
