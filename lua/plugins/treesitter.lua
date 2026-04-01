return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup()

    -- Auto-install the parser for the current filetype only if not already installed
    local available = ts.get_available()
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(ev)
        local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
        if lang and vim.tbl_contains(available, lang) and not vim.tbl_contains(ts.get_installed(), lang) then
          pcall(vim.cmd, "TSInstall " .. lang)
        end
      end,
    })
  end,
}
