return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  ft = { "markdown" },
  keys = {
    { "<leader>tm", "<CMD>RenderMarkdown toggle<CR>", ft = "markdown", desc = "Toggle markdown preview" },
  },
}
