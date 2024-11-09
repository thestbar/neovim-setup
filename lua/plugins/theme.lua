return {
  -- "catppuccin/nvim",
  -- name = "catppuccin",
  -- priority = 1000,
  -- lazy = false,
  -- config = function()
  --   require("catppuccin").setup({ flavour = "macchiato" })
  --   vim.cmd([[colorscheme catppuccin]])
  -- end,

  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.g.gruvbox_material_enable_italic = true
    vim.cmd([[let g:gruvbox_material_background = 'medium']])
    vim.cmd([[let g:gruvbox_material_better_performance = 1]])
    vim.cmd.colorscheme("gruvbox-material")
  end,
}
