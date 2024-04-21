return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { { "prettierd", "prettier" } },
      javascriptreact = { { "prettierd", "prettier" } },
      css = { { "prettierd", "prettier" } },
      scss = { { "prettierd", "prettier" } },
      cpp = { "clang-format" },
      c = { "clang-format" },
      h = { "clang-format" },
      hpp = { "clang-format" },
      glsl = { "glsl_analyzer" },
    },
  },
  keys = {
    {
      "<leader>ft",
      function()
        require("conform").format({ lsp_fallback = true })
      end,
      mode = "n",
    },
  },
}
