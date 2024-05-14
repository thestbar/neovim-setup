return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("aerial").setup({
      on_attach = function(bufnr)
        vim.keymap.set("n", "<leader>bp", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "<leader>bn", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
    })
    vim.keymap.set("n", "<leader>bt", "<cmd>AerialToggle!<CR>")
  end,
}
