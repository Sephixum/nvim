local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local opts = {
  ui = {
    size = { width = 0.8, height = 0.8 },
    wrap = true,
    border = "single"
  }
}

local plugins = {
  { "nvim-tree/nvim-web-devicons" },

  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("plugins.configs.nvim-tree")
    end,
    cmd = "NvimTreeToggle",
  },

  { "lewis6991/impatient.nvim" },

  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("plugins.configs.colorizer")
    end,
  },

  { "neovim/nvim-lspconfig" },

  {
    "nimaaskarian/pywal16.nvim",
    name = "pywal",
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    event = "BufRead",
    config = function()
      require("plugins.configs.indent-blankline")
    end,
  },

  {
    "Darazaki/indent-o-matic",
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.configs.lualine")
    end,
    event = "VimEnter"
  },

  {
    "akinsho/toggleterm.nvim",
    version = "v2.*",
    config = function()
      require("plugins.configs.toggleterm")
    end,
  },

  { "andweeb/presence.nvim", config = 'require("plugins.configs.presence")' },

  { "nvim-lua/plenary.nvim" },

  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.0",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("plugins.configs.telescope")
    end,
    cmd = "Telescope",
    dependencies = {
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "nvim-telescope/telescope-media-files.nvim" },
    }
  },

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins.configs.treesitter")
    end,
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
    event = "BufReadPre",
  },

  {
    "akinsho/bufferline.nvim",
    config = function()
      require("plugins.configs.bufferline")
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("plugins.configs.cmp")
    end,
    dependencies = {
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-buffer" },
      { "saadparwaiz1/cmp_luasnip" },
      { "octaltree/cmp-look" },
      { "hrsh7th/cmp-calc" },
      { "f3fora/cmp-spell" },
      { "hrsh7th/cmp-emoji" },
      { "onsails/lspkind.nvim" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-nvim-lsp" },
      {
        "windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup({})
        end,
      },
      {
        "L3MON4D3/LuaSnip",
      },
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
    }
  },

  { "folke/lsp-colors.nvim" },

  {
    'goolord/alpha-nvim',
    event = "VimEnter",
    config = function()
      require("plugins.configs.alpha")
    end
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("plugins.configs.mason")
    end,
  },

  { "navarasu/onedark.nvim", lazy = true },

  { "matze/vim-move" },

  {
    "folke/which-key.nvim",
    config = function()
      require("plugins.configs.which-key")
    end,
    keys = { "<leader>", "\\" }
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})
    end,
  },

  {
    "lervag/vimtex",
    config = function()
      require("plugins.configs.vimtex")
    end,
    ft = { "tex" }
  },

  { "rcarriga/nvim-notify" },

  {
    "0oAstro/silicon.lua",
    config = function()
      require("plugins.configs.silicon")
    end,
    keys = { "<leader>", "s" }
  },

  {
    "iamcco/markdown-preview.nvim",
    config = function() vim.fn["mkdp#util#install"]() end,
    ft = "markdown"
  },

  { "dstein64/vim-startuptime" },

  {
    "lambdalisue/suda.vim",
    cmd = { "SudaWrite", "SudaRead" }
  },

  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require("plugins.configs.dap")
    end,
    lazy = true,
    dependencies = {
      "rcarriga/nvim-dap-ui",
    }
  },

  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "RRethy/vim-illuminate",
    event = "BufReadPre",
    config = function()
      require("plugins.configs.illuminate")
    end,
  },

  {
    "phaazon/hop.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.configs.hop")
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
    end
  },

  {
    'kevinhwang91/nvim-ufo',
    config = function()
      require("plugins.configs.ufo")
    end,
    dependencies = {
      { 'kevinhwang91/promise-async' },
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          require("plugins.configs.statuscol")
        end,
      }
    },
  },

  {
    'Civitasv/cmake-tools.nvim',
    config = function()
      require("plugins.configs.cmake-tools")
    end,
    event = "BufReadPost"
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("plugins.configs.lsp_signature")
    end
  },

  {
    'famiu/bufdelete.nvim'
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.configs.trouble")
    end
  },

  {
    "aznhe21/actions-preview.nvim",
    config = function()
      require("plugins.configs.actions-preview")
    end,
  },
}

require("lazy").setup(plugins, opts)
