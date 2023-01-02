<div align="center">
<p>
    <a>
      <img alt="Linux" src="https://img.shields.io/badge/Linux-%23.svg?style=flat-square&logo=linux&color=FCC624&logoColor=black" />
    </a>
    <a>
      <img alt="macOS" src="https://img.shields.io/badge/macOS-%23.svg?style=flat-square&logo=apple&color=000000&logoColor=white" />
    </a>
    <a>
      <img alt="Windows" src="https://img.shields.io/badge/Windows-%23.svg?style=flat-square&logo=windows&color=0078D6&logoColor=white" />
    </a>
    <a href="https://github.com/jdhao/nvim-config/releases/latest">
      <img alt="Latest release" src="https://img.shields.io/github/v/release/jdhao/nvim-config" />
    </a>
    <a href="https://github.com/neovim/neovim/releases/tag/stable">
      <img src="https://img.shields.io/badge/Neovim-0.8.1-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=green" alt="Neovim minimum version"/>
    </a>
</p>
</div>

# Introduction

This repo hosts my Nvim configuration for Linux, macOS, and Windows.
`init.vim` is the config entry point for terminal Nvim.

My configurations are heavily documented to make it as clear as possible.
While you can clone the whole repository and use it, it is not recommended though.
Good configurations are personal. Everyone should have his or her unique config file.
You are encouraged to copy from this repo the part you want and add it to your own config.

To reduce the possibility of breakage, **this config is only maintained for [the latest nvim stable release](https://github.com/neovim/neovim/releases/tag/stable).
No effort is spent on maintaining backward compatibility.**

# Install and setup

See [doc here](docs/README.md) on how to install Nvim's dependencies, Nvim itself,
and how to set up on different platforms (Linux, macOS, and Windows).

# Features #

+ Language server protocol (LSP) support via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
+ Faster code commenting via [vim-commentary](https://github.com/tpope/vim-commentary).
+ Faster matching pair insertion and jump via [delimitMate](https://github.com/Raimondi/delimitMate).
+ Powerful snippet insertion via [Ultisnips](https://github.com/SirVer/ultisnips).
+ Command line auto-completion via [wilder.nvim](https://github.com/gelguy/wilder.nvim).
+ Code highlighting via [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
+ Undo management via [vim-mundo](https://github.com/simnalamburt/vim-mundo)
+ ......

## Command-line autocompletion with wilder.nvim

<p align="center">
<img src="https://user-images.githubusercontent.com/16662357/147677787-8e5d229a-a16a-420e-98f5-88f2a1be84a2.gif" width="800">
</p>

# Shortcuts

Some of the shortcuts I use frequently are listed here. In the following shortcuts, `<leader>` represents Space button.

| Shortcut          | Mode          | platform        | Description                                                              |
|-------------------|---------------|-----------------|--------------------------------------------------------------------------|
| `<F9>`            | Normal        | Linux/macOS/Win | Compile&run current source file (Python)            |

# Contributing

If you find anything that needs improving, do not hesitate to point it out or create a PR.

If you come across an issue, you can first use `:checkhealth` command provided by `nvim` to trouble-shoot yourself.
Please read carefully the messages provided by health check.

If you still have an issue, [open a new issue](https://github.com/lusmft/nvim-copilot-config/issues).
