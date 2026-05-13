return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = false,
  cond = function()
    local obsidian_path = vim.fn.expand("~/Documents/obsidian_vault")
    return vim.loop.fs_stat(obsidian_path) and vim.loop.fs_stat(obsidian_path).type == "directory"
  end,
  event = {
    "BufReadPre ~/Documents/obsidian_vault/**.md",
    "BufNewFile ~/Documents/obsidian_vault/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "<LEADER>ot", "<CMD>Obsidian today<CR>", mode = "n" },
    { "<LEADER>oy", "<CMD>Obsidian yesterday<CR>", mode = "n" },
    { "<LEADER>os", "<CMD>Obsidian search<CR>", mode = "n" },
    { "<LEADER>oq", "<CMD>Obsidian quick_switch<CR>", mode = "n" },
    { "<LEADER>of", "<CMD>Obsidian follow_link<CR>", mode = "n" },
    { "<LEADER>ob", "<CMD>Obsidian backlinks<CR>", mode = "n" },
    { "<LEADER>od", "<CMD>Obsidian dailies<CR>", mode = "n" },
    { "<LEADER>on", "<CMD>Obsidian new<CR>", mode = "n" },
  },
  ft = "markdown",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    picker = {
      name = "telescope.nvim",
    },
    workspaces = {
      {
        name = "notes",
        path = "~/Documents/obsidian_vault",
      },
    },
    daily_notes = {
      folder = "standups",
      date_format = "%Y-%m-%d",
    },
    templates = {
      folder = "~/Documents/obsidian_vault/templates",
      date_format = "%Y-%m-%d",
    },
    ui = { enable = false }, -- rendering handled by render-markdown.nvim
    checkbox = {
      enabled = true,
      create_new = true,
      order = { " ", "x", "!", ">", "~" },
    },

    note_id_func = function(title)
      local slug = ""
      if title ~= nil then
        -- Lowercase, replace spaces/underscores with hyphens, strip non-alphanumeric chars
        slug = title:lower():gsub("[%s_]+", "-"):gsub("[^%a%d%-]", "")
        -- Collapse multiple hyphens and trim leading/trailing hyphens
        slug = slug:gsub("%-+", "-"):gsub("^%-+", ""):gsub("%-+$", "")
      end
      -- Append a short random alphanumeric suffix for uniqueness
      local suffix = ""
      for _ = 1, 6 do
        local n = math.random(0, 35)
        suffix = suffix .. (n < 10 and tostring(n) or string.char(n - 10 + 97))
      end
      if slug ~= "" then
        return slug .. "-" .. suffix
      else
        return suffix
      end
    end,
  },
}
