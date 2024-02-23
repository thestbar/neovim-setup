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
      { "<LEADER>gd", "<CMD>VGit buffer_diff_preview<CR>", mode = "n" },
      { "<LEADER>gh", "<CMD>VGit buffer_history_preview<CR>", mode = "n" },
      { "<LEADER>gn", "<CMD>VGit hunk_down<CR>", mode = "n" },
      { "<LEADER>gp", "<CMD>VGit hunk_up<CR>", mode = "n" },
      { "<LEADER>gl", "<CMD>VGit toggle_live_blame<CR>", mode = "n" },
    },
    config = function()
      require("vgit").setup({
        settings = {
          live_blame = {
            enabled = true,
          },
          authorship_code_lens = {
            enabled = false,
          },
          scene = {
            diff_preference = 'split',
          }
        },
      })
    end,
  },
}

