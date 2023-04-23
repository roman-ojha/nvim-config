return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "OmniSharp/omnisharp-vim", -- for C#/.NET LSP
    opts = {},
  },
  {
    "xiyaowong/transparent.nvim", -- Transparency
    opts = require "user.plugins.config.transparent",
    lazy = false,
  },
  {
    "iamcco/markdown-preview.nvim", -- preview markdown,
    config = function() vim.fn["mkdp#util#install"]() end,
    event = "BufEnter *.md",        -- load only on when we open *.md file
    cmd = "MarkdownPreview",
  },
  {
    "gelguy/wilder.nvim",
    config = function() require "user.plugins.config.wilder" end,
    lazy = false,
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function() require "user.plugins.config.symbols-outline" end,
    lazy = false,
  },
  -- {
  --   "thosakwe/vim-flutter",
  --   -- commands: https://github.com/thosakwe/vim-flutter#provided-commands
  --   config = function() end,
  --   event = "BufEnter *.dart",
  -- },
  {
    "akinsho/flutter-tools.nvim",
    event = "BufEnter *.dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = require "user.plugins.config.flutter-tools",
  },
  {
    "CRAG666/code_runner.nvim",
    -- config = function() require("code_runner").setup {} end,
    config = function() require("code_runner").setup {} end,
    event = { "BufEnter *.py", "BufEnter *.cpp", "BufEnter *.cs" },
  },
}
