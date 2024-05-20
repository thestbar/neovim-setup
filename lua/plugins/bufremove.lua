return {
  "echasnovski/mini.bufremove",
  keys = {
    {
      "<C-w>",
      function()
        local bd = require("mini.bufremove").delete

        if vim.bo.modified then
          local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")

          -- Yes
          if choice == 1 then
            vim.cmd.write()
            bd(0)
            -- No
          elseif choice == 2 then
            bd(0, true)
          end
        else
          bd(0)
        end
      end,
    },
    {
      "<C-a>",
      function()
        require("mini.bufremove").delete(0, true)
      end,
    },
  },
  config = function()
    vim.keymap.del("n", "<C-w>d")
    vim.keymap.del("n", "<C-w><C-d>")
  end,
}
