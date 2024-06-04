return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        section_separators = "",
        component_separators = "",
      },
      winbar = {
        lualine_c = { "aerial" },
      },
    })
  end,
}
