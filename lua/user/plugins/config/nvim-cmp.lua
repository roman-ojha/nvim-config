-- Kind icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
local cmp = require "cmp"
local ls = require "luasnip"
require("luasnip/loaders/from_vscode").lazy_load()
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
-- custom snippets: https://sbulav.github.io/vim/neovim-setting-up-luasnip/
ls.add_snippets(nil, {
  cs = {
    snip({
      trig = "tut",
      namr = "Snippet",
      dscr = "Boiler plate for c# tutorial",
    }, {
      text {
        "using System;",
        "",
      },
      text {
        "namespace",
      },
      insert(1, "  "),
      text {
        "{",
        "\tclass Prog{",
        "",
        "\t\tstatic public void Run(string[] args){",
        "\t\t}",
        "\t}",
        "}",
      },
    }),
  },
})
return {
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  mapping = {
    ["<C-c>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
  },
}
