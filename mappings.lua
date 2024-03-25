-- Mapping data with "desc" stored directly by vim.keymap.set().
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local cmp = require "cmp"
local ui = require "astronvim.utils.ui"
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    -- ["<CA-w>"] = { "<CMD>qall<CR>", desc = "Quit Nvim" },
    ["<CA-w>"] = { function() require("astronvim.utils.buffer").close_all() end, desc = "Close all buffers" },
    ["<SA-w>"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" },
    ["<F2>"] = { "<CMD>TransparentToggle<CR>", desc = "Togglling Transparancy" },
    -- markdown-preview
    ["<leader>m"] = { desc = "  MarkDown Preview" },
    ["<leader>mp"] = { ":MarkdownPreview<CR>", desc = "  Markdown Preview" },
    ["<leader>ms"] = { ":MarkdownPreviewStop<CR>", desc = "  Markdown Preview Stop" },
    ["<leader>mt"] = { ":MarkdownPreviewToggle<CR>", desc = "  Markdown Preview Toggle" },
    --plugins <leader>p
    ["<leader>pp"] = { ":LspInfo<CR>", desc = "Currently running lsp" },
    ["<leader>pt"] = { "::TSInstallInfo<CR>", desc = "Treesitter plugins info" },
    ["<leader>pz"] = { "::Lazy<CR>", desc = "Lazy Package manager" },
    -- Buffer
    ["<A-*>"] = { -- move buffer left, shift + [
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["<A-(>"] = { -- move buffer right
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    -- ["<A-*>"] = {
    --   function() require("astronvim.utils.buffer").move(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Move buffer tab left",
    -- },
    -- ["<A-(>"] = {
    --   function() require("astronvim.utils.buffer").move(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Move buffer tab right",
    -- },
    -- Move text up and down
    ["<A-j>"] = { ":m .+1<CR>==", desc = "Move line down" },
    ["<A-k>"] = { ":m .-2<CR>==", desc = "Move line up" },
    ["<A-Down>"] = { ":m .+1<CR>==", desc = "Move line down" },
    ["<A-Up>"] = { ":m .-2<CR>==", desc = "Move line up" },
    ["<BS>"] = { "diw", desc = "Delete word like ctrl + backspace in insert mode in other text editor" },
    -- Terminal
    -- ["<C-k>"] = {
    --   "<CMD>ToggleTerm direction=vertical<CR>",
    --   desc = "Focus Terminal",
    -- },
    ["<SA-t>"] = { "<CMD>terminal pwsh.exe<CR>", desc = "Open new powershell terminal" },
    -- ["<CA-b>"] = { "<CMD>ToggleTerm direction=vertical<CR>", desc = "Toggle terminal" },
    ["<F6>"] = { "<CMD>ToggleTerm direction=float<CR>", desc = "Toggle terminal" },
    ["<SA-b>"] = { "<CMD>Neotree toggle<CR>", desc = "Toggle Explorer" },
    -- open multiple terminal
    ["<CA-1>"] = { "<CMD>1ToggleTerm direction=vertical<CR>", desc = "Toggle 1st terminal" },
    ["<leader>t1"] = { "<CMD>1ToggleTerm direction=vertical<CR>", desc = "Toggle 1st terminal" },
    ["<leader>t2"] = { "<CMD>2ToggleTerm direction=vertical<CR>", desc = "Toggle 2nd terminal" },
    ["<leader>t3"] = { "<CMD>3ToggleTerm direction=vertical<CR>", desc = "Toggle 3nd terminal" },
    ["<leader>t4"] = { "<CMD>4ToggleTerm direction=vertical<CR>", desc = "Toggle 4nd terminal" },
    -- Symbol-outline plugin
    -- Symbol-outline plugin
    ["<leader>s"] = { "<CMD>SymbolsOutline<CR>", desc = "𝓒 Toggle Symbols outline" },
    -- Code Runner Plugin
    ["<leader>r"] = { desc = " Code Runner" },
    ["<leader>rr"] = { ":RunCode<CR>", desc = " Run Code" },
    ["<leader>rf"] = { ":RunFile<CR>", desc = " Run File" },
    -- ["<leader>rft"] = { ":RunFile tab<CR>", desc = " Run File Tab" },
    ["<leader>rp"] = { ":RunProject<CR>", desc = " Run Project" },
    -- ["<leader>rc"] = { ":RunClose<CR>", desc = " Run Close" },
    -- Enable/Disable Complition Engine:
    ["<leader>uc"] = { desc = "Toggle completion engines" },
    ["<leader>ucc"] = { ui.toggle_cmp, desc = "Toggle default completion engine" },
    ["<leader>uce"] = {
      "<CMD>CocEnable<CR>",
      desc = "Enable completion for coc engine",
    },
    ["<leader>ucd"] = {
      "<CMD>CocDisable<CR>",
      desc = "Disable completion for coc engine",
    },

    -- For LSP
    ["<leader>lH"] = {
      "<cmd>lua vim.lsp.buf.hover()<CR>",
      desc = "Hover Defination",
    },
    ["<leader>lg"] = {
      desc = "Goto",
    },
    ["<leader>lgD"] = {
      "<cmd>lua vim.lsp.buf.declaration()<CR>",
      desc = "Goto Declaration",
    },
    ["<leader>lgd"] = {
      "<cmd>lua vim.lsp.buf.definition()<CR>",
      desc = "Goto Declaration",
    },
    ["<leader>lgi"] = {
      "<cmd>lua vim.lsp.buf.implementation()<CR>",
      desc = "Goto Implementation",
    },
    -- ["<leader>by"] = {
    --   function()
    --     local utils = require "astronvim.utils"
    --     utils.notify("File path directory copied to clipboard", vim.log.levels.INFO)
    --     -- vim.fn.setreg("+", vim.fn.expand "%:p")
    --     -- copy file path directory
    --     vim.fn.setreg("*", vim.fn.expand "%:p:h")
    --   end,
    --   desc = "Copy file path directory to clipboard",
    -- },
    -- ["<leader>bf"] = {
    --   function()
    --     local utils = require "astronvim.utils"
    --     utils.notify("File path copied to clipboard", vim.log.levels.INFO)
    --     vim.fn.setreg("+", vim.fn.expand "%:p")
    --   end,
    --   desc = "Copy file path to clipboard",
    -- },
    ["<leader>by"] = {
      function()
        local util_ok, utils = pcall(require, "astronvim.utils")
        if not util_ok then return end
        -- Ref: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/sources/filesystem/init.lua
        -- Ref: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/16d1b194376bf1fc2acd89ccb3c29ba8315bfcea/lua/neo-tree/sources/common/commands.lua#L721
        local manager_ok, manager = pcall(require, "neo-tree.sources.manager")
        if not manager_ok then return end
        local state = manager.get_state("filesystem", nil)
        local tree = state.tree
        if not tree then return end
        local nsuccess, node = pcall(tree.get_node, tree)
        if nsuccess and node then
          local path = node.path
          -- get directory pat from path
          path = vim.fn.fnamemodify(path, ":h")
          vim.fn.setreg("*", path)
          utils.notify("Copied directory path to clipboard", vim.log.levels.INFO)
        end
      end,
      desc = "Copy directory path to clipboard",
    },
    ["<leader>bf"] = {
      function()
        local util_ok, utils = pcall(require, "astronvim.utils")
        if not util_ok then return end
        -- Ref: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/sources/filesystem/init.lua
        -- Ref: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/16d1b194376bf1fc2acd89ccb3c29ba8315bfcea/lua/neo-tree/sources/common/commands.lua#L721
        local manager_ok, manager = pcall(require, "neo-tree.sources.manager")
        if not manager_ok then return end
        local state = manager.get_state("filesystem", nil)
        local tree = state.tree
        if not tree then return end
        local nsuccess, node = pcall(tree.get_node, tree)
        if nsuccess and node then
          local path = node.path
          vim.fn.setreg("*", path)
          utils.notify("Copied file path to clipboard", vim.log.levels.INFO)
        end
      end,
      desc = "Copy file path to clipboard",
    },
    ["<leader>bo"] = {
      function()
        local path = vim.fn.expand "%:f"
        -- print fs in neovim
        -- open file in default os application
        vim.fn.jobstart("start " .. path)
      end,
      desc = "Open file in default os application",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<C-[>"] = { "<C-\\><C-n>", desc = "Exit terminal mode" },
    ["<C-j>"] = { "<C-\\><C-n><C-w>h", desc = "Focus from terminal to normal mode and transfer the cursor to buffers" },
    ["<CA-b>"] = { "<CMD>ToggleTerm direction=vertical<CR>", desc = "Toggle terminal" },
  },
  v = {
    -- Move text up and down
    ["<A-j>"] = { ":m '>+1<cr>==gv", desc = "" },
    ["<A-k>"] = { ":m '<-2<cr>==gv", desc = "" },
    ["<A-Down>"] = { ":m '>+1<cr>==gv", desc = "" },
    ["<A-Up"] = { ":m '<-2<cr>gv==gv", desc = "" },
    -- Stay in indent mode while tabbing lines in visual mod
    ["<"] = { "<gv", desc = "Stay in indent mode while tabbing lines in visual mod" },
    [">"] = { ">gv", desc = "Stay in indent mode while tabbing lines in visual mod" },
    ["p"] = {
      '"_dP',
      desc = "Paste without copying the text",
    },
  },
}
