local status_ok, neo_tree = pcall(require, "neo-tree")
if not status_ok then return end

local opts = {
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
  window = {
    -- position = "float",
    mappings = {
      ["P"] = function()
        local util_ok, utils = pcall(require, "astronvim.utils")
        if not util_ok then return end
        -- Ref: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/sources/filesystem/init.lua
        -- Ref: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/16d1b194376bf1fc2acd89ccb3c29ba8315bfcea/lua/neo-tree/sources/common/commands.lua#L721
        local manager_ok, manager = pcall(require, "neo-tree.sources.manager")
        if not manager_ok then return end
        local state = manager.get_state("filesystem", nil)
        local tree = state.tree
        local success, node = pcall(tree.get_node, tree)
        if success and node then
          local path = node.path
          -- util.notify(path, vim.log.levels.INFO)
          local file_extension = vim.fn.fnamemodify(path, ":e")
          if
            file_extension == "png"
            or file_extension == "jpg"
            or file_extension == "jpeg"
            or file_extension == "pdf"
          then
            -- only open the image and pdf files in the default application
            vim.fn.jobstart("start " .. path)
          else
            local commands_ok, commands = pcall(require, "neo-tree.sources.common.commands")
            if not commands_ok then return end
            --Ref: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/16d1b194376bf1fc2acd89ccb3c29ba8315bfcea/lua/neo-tree/sources/common/commands.lua#L663
            commands.toggle_preview(state)
          end
        end
      end,
    },
  },
}

return opts
