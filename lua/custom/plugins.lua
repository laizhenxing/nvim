local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "gopls",
        "lua-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function ()
      require("rust-tools").setup(opts)
    end
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "Saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function (_, opts)
      local crates = require('crates')
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function ()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, {name = "crates"})
      return M
    end,
    event = "InsertEnter",
    dependencies = "zbirenbaum/copilot-cmp",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function ()
      return require "custom.configs.null-ls"
    end
  },
  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  -- 🔥 Copilot
  {
    "zbirenbaum/copilot.lua",
    lazy = true,
    cmd = "Copilot",
    event = "InsertEnter",
    opts = function()
      return require "custom.configs.copilot"
    end,
    config = function()
      require("copilot").setup()
    end
  },
  {
    "zbirenbaum/copilot-cmp",
    lazy = true,
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
--  {
--    "github/copilot.vim",
--    cmd = "Copilot",
--    config = function()
--      require("copilot.vim").setup()
--    end
--  },
  --🔥 🔥 joshuto: a ranger-like plugin 
--  {
--    "theniceboy/joshuto.nvim",
--    init = function()
--      require("joshuto").joshuto()
--    end
--  },
  -- 🔥file manager
  {
    "is0n/fm-nvim",
    cmd = "Fm",
 --   opts = function()
 --     require("custom.configs.fm")
 --   end,
    init = function()
      require("fm-nvim").setup{
      }
    end },
--  -- 🔥lazygit
--  {
--    "kdheepak/lazygit.nvim",
--    dependencies =  {
--        "nvim-telescope/telescope.nvim",
--        "nvim-lua/plenary.nvim"
--    },
--    config = function()
--        require("telescope").load_extension("lazygit")
--    end,
--  },
  -- Symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    config = function()
      require("symbols-outline").setup()
    end
  },
  -- motions
  -- 🔥leap.nvim
  --{
  --  -- import leap.nvim
  --  "ggandor/leap.nvim",
  --  init = function()
  --    require("leap").add_default_mappings()
  --  end
  --},
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    -- @type Flash.Config
    opts = {},
    keys = function()
      return require("custom.configs.flash")
    end,
    config = function()
      require("flash").setup()
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require("custom.configs.noice")
    end,
   },
}

return plugins
