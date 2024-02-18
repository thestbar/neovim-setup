return { 
  "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "c", "lua", "query", "vim", "vimdoc", "javascript", "html", "css", "ruby" },
      highlight = { enable = true },
      indent = { enable = true },  
    })
  end
}
