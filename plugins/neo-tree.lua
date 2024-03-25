return {
  "nvim-neo-tree/neo-tree.nvim",
  -- dependencies = { "MunifTanjim/nui.nvim", "3rd/image.nvim" },
  opts = function(_, config) return require "user.plugins.config.neo-tree" end,
}
