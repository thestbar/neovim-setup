return {
  "Civitasv/cmake-tools.nvim",
  config = function()
    require("cmake-tools").setup({
      cmake_runner = {
        default_opts = {
          terminal = {
            focus = true,
          },
        },
      },
    })
  end,
}
