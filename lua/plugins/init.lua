return {

  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 2000,
        },
        formatters_by_ft = {
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          json = { "prettier" },
          css = { "prettier" },
          markdown = { "prettier" },
        },
      })
    end,
  },
  {
    "azratul/live-share.nvim",
    dependencies = { "jbyuki/instant.nvim" },
    lazy = false, -- Force the plugin to load at startup
    config = function()
      vim.g.instant_username = "JJ" -- Replace with your username
      require("live-share").setup({
        port_internal = 8765,       -- Local port for live share
        max_attempts = 40,          -- Number of retries to get the service URL
        service = "serveo.net",     -- Or "nokey@localhost.run"
      })
    end,
  },
  
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  }, {
  "Exafunction/codeium.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("codeium").setup({
    })
  end
},

  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end
  },
  { "nvzone/volt", lazy = true },

  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
  },
  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  { "nvzone/volt", lazy = true },
  { "nvzone/menu", lazy = true },
  "nvzone/volt", -- optional, needed for theme switcher
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
