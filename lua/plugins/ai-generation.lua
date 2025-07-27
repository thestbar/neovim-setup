return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
      mappings = {
        complete = {
          insert = "<C-f>",
        },
      },
    },
    keys = {
      { "<leader>cpc", "<cmd>CopilotChat<cr>", desc = "Copilot Chat" },
      { "<leader>cpm", "<cmd>CopilotChatModels<cr>", desc = "Select Copilot Chat Model" },
    },
  },
}
