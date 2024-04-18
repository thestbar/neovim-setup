return {
  "numToStr/Comment.nvim",
  keys = {
    { "<C-_>", "gcc", mode = "n", remap = true },
    { "<C-/>", "gcc", mode = "n", remap = true },
    { "<C-_>", "gcgv", mode = "v", remap = true },
    { "<C-/>", "gcgv", mode = "v", remap = true },
  },
  lazy = false,
  config = function()
    require("Comment").setup()
  end,
}
