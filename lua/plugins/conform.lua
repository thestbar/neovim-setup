return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettierd", "prettier" },
      javascriptreact = { "prettierd", "prettier" },
      css = { "prettierd", "prettier" },
      scss = { "prettierd", "prettier" },
    },
    -- Add this option to make it stop after the first formatter succeeds
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 500,
    },
    -- This option tells conform to try formatters in order until one succeeds
    format = {
      stop_after_first = true,
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
