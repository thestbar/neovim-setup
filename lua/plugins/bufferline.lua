return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  lazy = false,
  opts = {
    options = {
      custom_filter = function(buf_number, _)
        if vim.fn.bufname(buf_number) ~= "" then
          return true
        end
      end,
    },
  },
  keys = {
    { "<tab>", "<CMD>BufferLineCycleNext<CR>", mode = { "n" } },
    { "<s-tab>", "<CMD>BufferLineCyclePrev<CR>", mode = { "n" } },
  },
}
