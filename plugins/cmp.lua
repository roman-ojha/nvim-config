vim.g.copilot_autostart = 1
vim.g.copilot_enabled = 1
return {
  "hrsh7th/nvim-cmp",
  opts = require "user.plugins.config.nvim-cmp",
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "github/copilot.vim",
  },
}
