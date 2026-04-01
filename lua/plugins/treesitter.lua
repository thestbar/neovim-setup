return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup()

    -- Auto-install the parser for the current filetype
    local available = require("nvim-treesitter").get_available()
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(ev)
        local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
        if lang and vim.tbl_contains(available, lang) then
          pcall(vim.cmd, "TSInstall " .. lang)
        end
      end,
    })
  end,
}
