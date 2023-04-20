vim.g.terminal_emulator = "pwsh" -- default terminal
--Some User Configuration examples:
-- https://github.com/AstroNvim/AstroNvim/issues/1189
-- https://github.com/datamonsterr/astronvim_config
-- https://github.com/AstroNvim/AstroNvim/issues/8
return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "astrodark",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    skip_setup = { -- you can use this to skip setup for some LSP
      -- "tsserver"
    },
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true,     -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    config = {
      clangd = function() -- modify & add LSP server configuration
        return {
          single_file_support = true,
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        }
      end,
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  default_theme = {
    highlights = function(hi)
      local C = require "default_theme.colors"
      hi.Normal = { bg = C.none, ctermbg = C.none }
      hi.CursorColumn = { cterm = {}, ctermbg = C.none, ctermfg = C.none }
      hi.CursorLine = { cterm = {}, ctermbg = C.none, ctermfg = C.none }
      hi.CursorLineNr = { cterm = {}, ctermbg = C.none, ctermfg = C.none }
      hi.LineNr = {}
      hi.SignColumn = {}
      hi.StatusLine = {}
      hi.NeoTreeNormal = { bg = C.none, ctermbg = C.none }
      hi.NeoTreeNormalNC = { bg = C.none, ctermbg = C.none }
      return hi
    end,
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
