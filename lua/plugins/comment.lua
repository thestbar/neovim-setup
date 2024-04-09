return {
  "numToStr/Comment.nvim",
  keys = {
    { "<C-/>", "gcc", mode = "n", remap = true },
    { "<C-/>", "gcgv", mode = "v", remap = true },
  },
  lazy = false,
  config = function()
    require("Comment").setup()
  end,
}
