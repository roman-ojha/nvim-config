-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
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
    ["<CA-w>"] = { "<CMD>qall<CR>", desc = "Quit all tabs" },
    ["F2"] = { "<CMD>TransparentToggle<CR>", desc = "Togglling Transparancy" },
    ["<leader>r"] = { "<CMD>set wrap<CR>", desc = "Wrap word" },
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
    ["<CA-b>"] = { "<CMD>ToggleTerm direction=vertical<CR>", desc = "Toggle terminal" },
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
  },
}
