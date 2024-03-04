return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          local default_config = {
            capabilities = capabilities,
          }

          lspconfig[server_name].setup(vim.tbl_extend("force", default_config, {}))
        end,
      })

      local lsp = vim.lsp
      local bind = vim.keymap.set

      bind("n", "<LEADER>ca", lsp.buf.code_action, {})
      bind("n", "<LEADER>rn", lsp.buf.rename, {})
      bind("n", "<LEADER>td", lsp.buf.type_definition, {})
      bind("n", "<LEADER>ds", require("telescope.builtin").lsp_document_symbols, {})
      bind("n", "<LEADER>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, {})

      bind("n", "gd", lsp.buf.definition, {})
      bind("n", "gr", require("telescope.builtin").lsp_references, {})
      bind("n", "gi", require("telescope.builtin").lsp_implementations, {})
      bind("n", "gD", lsp.buf.declaration, {})
      bind("n", "K", lsp.buf.hover, {})
    end,
  },
}
