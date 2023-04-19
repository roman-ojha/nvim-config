-- only for python file type
-- local opts = { noremap = true, silent = true }

 -- local term_opts = { silent = true }

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, options)
end

local global = vim.g
global.mapleader = " "
global.maplocalleader = " "

map("n", "<leader>gd","<CMD>!cs :OmniSharpGotoDefination<CR>", { silent = true })  -- for OmniSharp
map("n", "<leader>fi","<CMD>!cs :OmniSharpFindImplementations<CR>", { silent = true })
map("n", "<leader>fi","<CMD>!cs :OmniSharpFindImplementations<CR>",{ silent = true })

-- run project
map("n", "<CF7>", ":!dotnet run<CR>",{ silent = true})
