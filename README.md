# neovim-setup

This is my personal neovim setup. I try to keep it clean and simple.

The plugin manager that is used is [lazy.nvim](https://github.com/folke/lazy.nvim.git).

The structure of the repository is as follows:
- `init.vim` is the main configuration file. It is used to load lazy.nvim and
  then requires the plugins folder, which loads all the plugins.
- `lua/` contains all the lua files that are used in the configuration.
  - `plugins/` contains all the plugins that are used in the configuration.
    Everything is build to exist in this folder.
  - `plugins.lua` is the file that is used to load all the plugins.
  - `vimbinding.lua` is the file that is used to set up all the basic vim keybindings.
- `after/` contains all the files that are loaded after the plugins are loaded.
  - `ftplugin/` contains all the filetype plugins. On this folder you can create a file
  for each filetype that you want to configure. See already existing examples.

The hierarchy of the configuration is build to try to have a separate lua file for each
unique neovim plugin. This way it is easier to maintain and understand the configuration.
At least this applies to myself, feel free to experiment with everything!

The most notable plugins that are used:
- `goolord/alpha-nvim` for the startup screen.
- `stevearc/aerial.nvim` for the breadcrumb navigation.
- `akinsho/bufferline.nvim` for better buffer navigation using custom shortcuts and virtual tabs.
- `echasnovski/mini.bufremove` makes my life easier when closing buffers.
- `numToStr/Comment.nvim` for commenting code.
- `hrsh7th/cmp-nvim-lsp` for autocompletion.
- `github/copilot.vim` for copilot integration.
- `stevearc/conform.nvim` for formatting code.
- `williamboman/mason.nvim`, `williamboman/mason-lspconfig.nvim` and `neovim/nvim-lspconfig`
  for LSP configuration.
- `nvim-lualine/lualine.nvim` for the statusline.
- `nvim-neo-tree/neo-tree.nvim` for the file explorer.
- `kevinhwang91/nvim-ufo` for better code folding.
- `epwalsh/obsidian.nvim` for integration with Obsidian.
- `nvim-telescope/telescope.nvim` for fuzzy finding.
- `nvim-treesitter/nvim-treesitter` for syntax highlighting.
- `lukas-reineke/virt-column.nvim` for virtual column support.

The 2 themes I like most are:
- `catppuccin/nvim` 
- `sainnhe/gruvbox-material`
