<div align="center" id="madewithlua">
    <img src="https://raw.githubusercontent.com/github/explore/26674e638508ac4a4e113ee32d6755ebfa000569/topics/neovim/neovim.png" width="110", height="100">
</div>

<h1 align="center">Neovim</h1>

- For Windows

```shell
git clone https://github.com/roman-ojha/nvim-config $HOME\AppData\Local\nvim --depth 1 && nvim
```

## Setup:

### Currenlty I am using [AstroNvim](https://github.com/AstroNvim/AstroNvim) For Initial Configuration

### Just for AstroNvim [Config](https://github.com/AstroNvim/AstroNvim/blob/main/.github/README.md#-requirements):

- [Nerd Fonts](https://www.nerdfonts.com/font-downloads) (_Optional with manual intervention:_ See [Documentation on customizing icons](https://astronvim.com/Recipes/icons))
- [Neovim 0.8+ (_Not_ including nightly)](https://github.com/neovim/neovim/releases/tag/stable)
- [Tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/cli/README.md) (_Note:_ This is only necessary if you want to use `auto_install` feature with Treesitter)

  - Also you have to Install MinGW compiler, you can use [MSYS2](https://www.msys2.org/)

- A clipboard tool is necessary for the integration with the system clipboard (see [`:help clipboard-tool`](https://neovim.io/doc/user/provider.html#clipboard-tool) for supported solutions)
- Terminal with true color support (for the default theme, otherwise it is dependent on the theme you are using)

### My Plugins Setups:

1. For C/C++ ISP [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd)
