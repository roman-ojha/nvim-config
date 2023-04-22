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
}
