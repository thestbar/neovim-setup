return {
  {
    "akinsho/git-conflict.nvim",
    config = function()
      require("git-conflict").setup()
    end,
  },
  {
    "thestbar/vgit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gd", ":VGit buffer_diff_preview<CR>", mode = "n" },
      { "<leader>gh", ":VGit buffer_history_preview<CR>", mode = "n" },
      { "<leader>gn", ":VGit hunk_down<CR>", mode = "n" },
      { "<leader>gp", ":VGit hunk_up<CR>", mode = "n" },
    },
    config = function()
      require("vgit").setup({
        settings = {
          -- Use gitsigns for blame
          live_blame = {
            enabled = false,
          },
          authorship_code_lens = {
            enabled = false,
          },
          scene = {
            diff_preference = "split",
          },
        },
      })
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
}
