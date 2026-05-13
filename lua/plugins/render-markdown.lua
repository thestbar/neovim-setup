return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  ft = { "markdown", "obsidian" },
  keys = {
    { "<leader>tm", "<CMD>RenderMarkdown toggle<CR>", ft = "markdown", desc = "Toggle markdown preview" },
  },
  opts = {
    bullet = {
      icons = { "•", "◦", "·", "‣" },
    },
    checkbox = {
      unchecked = { icon = "󰄱" },
      checked = { icon = "󰄲", scope_highlight = "@markup.strikethrough" },
      custom = {
        important = { raw = "[!]", rendered = "󰀦", highlight = "DiagnosticError" },
        forwarded = { raw = "[>]", rendered = "󰒊", highlight = "DiagnosticInfo" },
        in_progress = { raw = "[~]", rendered = "󰔟", highlight = "DiagnosticWarn" },
      },
    },
  },
}
