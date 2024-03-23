local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then return end

local opts = {
  sources = {
    -- null_ls.builtins.diagnostics.mypy, -- python type checker & static analyzer
    -- null_ls.builtins.diagnostics.ruff, -- python linter
  },
}

return opts
