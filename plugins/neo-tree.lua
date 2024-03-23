return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    default_component_configs = {
      indent = {
        padding = 1,
      },
    },
    source_selector = {
      winbar = false,
      statusline = false,
    },
    filesystem = {
      -- list of directories to hide in the tree
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          -- ".DS_Store",
          -- "thumbs.db",
          -- "node_modules",
          -- "__pycache__",
        },
      },
    },
  },
}
