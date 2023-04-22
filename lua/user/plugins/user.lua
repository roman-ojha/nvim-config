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
    config = function()
      local wilder = require "wilder"
      wilder.setup { modes = { ":", "/", "?" } }
      wilder.set_option("pipeline", {
        wilder.branch(
          wilder.cmdline_pipeline {
            -- sets the language to use, 'vim' and 'python' are supported
            language = "python",
            -- 0 turns off fuzzy matching
            -- 1 turns on fuzzy matching
            -- 2 partial fuzzy matching (match does not have to begin with the same first letter)
            fuzzy = 1,
          },
          wilder.python_search_pipeline {
            -- can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
            pattern = wilder.python_fuzzy_pattern(),
            -- omit to get results in the order they appear in the buffer
            sorter = wilder.python_difflib_sorter(),
            -- can be set to 're2' for performance, requires pyre2 to be installed
            -- see :h wilder#python_search() for more details
            engine = "re",
          }
        ),
      })
    end,
    lazy = false,
  },
}
