return {
  "echasnovski/mini.splitjoin",
  version = "*",
  config = function()
    local miniSplitJoin = require("mini.splitjoin")
    miniSplitJoin.setup({ mappings = { split = "", join = "" } })

    vim.keymap.set("n", "sj", function()
      miniSplitJoin.toggle()
    end, { desc = "Toggle split/join" })
  end,
}
