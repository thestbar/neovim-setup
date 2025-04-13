return {
  {
    "akinsho/git-conflict.nvim",
    config = function()
      require("git-conflict").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 0,
          virt_text_priority = 1000,
        },
      })

      vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", {})
    end,
  },
  {
    "f-person/git-blame.nvim",
    dependencies = { "nvim-lualine/lualine.nvim" },
    keys = {
      { "<LEADER>gu", "<CMD>GitBlameOpenCommitURL<CR>", mode = "n" },
    },
    config = function()
      vim.g.gitblame_display_virtual_text = 0
      vim.g.gitblame_date_format = "%r"
    end,
  },
}
