local opts = { noremap = true, silent = true }
local function map(mode, lhs, rhs, options) vim.keymap.set(mode, lhs, rhs, options) end
-- hold on to the copied value and paste it
map("v", "p", '"_dP', opts)

-- copy to clipboard
map("v", "y", '"+y', opts)
map("n", "y", '"+y', opts)
