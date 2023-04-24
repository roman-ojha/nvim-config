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
    event = "BufEnter *.md", -- load only on when we open *.md file
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
    "akinsho/flutter-tools.nvim", -- Contain LSP, Flutter commands
    event = "BufEnter *.dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = require "user.plugins.config.flutter-tools",
  },
  {
    "CRAG666/code_runner.nvim",
    config = function() require "user.plugins.config.code-runner" end,
    -- config = require "user.plugins.config.code-runner",
    event = {
      "BufEnter *.py",
      "BufEnter *.cpp",
      "BufEnter *.cs",
      "BufEnter *.js",
      "BufEnter *.c",
      "BufEnter *.java",
      "BufEnter *.sh",
    },
  },
  -- {
  --   "gbprod/phpactor.nvim",
  --   config = function()
  --     require "phpactor.handler.update"
  --     require("phpactor").setup {
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       -- refer to the configuration section below
  --       install = {
  --         -- path = "C:\\Users\\razzr\\AppData\\Local\\nvim-data\\lazy",
  --         branch = "master",
  --         -- bin = "C:\\Users\\razzr\\AppData\\Local\\nvim-data\mason\packages\phan\vendor\bin\phan",
  --         bin = vim.fn.stdpath "data" .. "/mason/packages/phan/vendor/bin/phan",
  --         php_bin = "php",
  --         composer_bin = "composer",
  --         git_bin = "git",
  --         check_on_startup = "none",
  --       },
  --       lspconfig = {
  --         enabled = true,
  --         options = {},
  --       },
  --     }
  --   end,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim", -- required to update
  --     "neovim/nvim-lspconfig", -- required to automaticly register lsp serveur
  --   },
  --   event = "BufEnter *.php",
  -- },
  {
    "neoclide/coc.nvim", -- I can use this pluing also for complition which provide bunch of extensions, LSP also it provide vsCode extensions features as well
    -- pelase read the documentation for more information
    -- https://youtu.be/OXEVhnY621M
    -- we have to disabe nvim.cmp plugin to use this coc, if we will not do that then bo pluign will give the complition
    lazy = false,
    branch = "release",
    init = function() require "user.plugins.config.coc" end,
  },
}
