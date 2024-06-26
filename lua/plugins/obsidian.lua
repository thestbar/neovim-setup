return {
  "epwalsh/obsidian.nvim",
  lazy = false,
  cond = function()
    local obsidian_path = vim.fn.expand("~/Documents/obsidian_vault")
    return vim.loop.fs_stat(obsidian_path) and vim.loop.fs_stat(obsidian_path).type == "directory"
  end,
  version = "*",
  event = {
    "BufReadPre ~/Documents/obsidian_vault/**.md",
    "BufNewFile ~/Documents/obsidian_vault/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<LEADER>ot", "<CMD>ObsidianToday<CR>", mode = "n" },
    { "<LEADER>oy", "<CMD>ObsidianYesterday<CR>", mode = "n" },
    { "<LEADER>os", "<CMD>ObsidianSearch<CR>", mode = "n" },
    { "<LEADER>oq", "<CMD>ObsidianQuickSwitch<CR>", mode = "n" },
    { "<LEADER>of", "<CMD>ObsidianFollowLink<CR>", mode = "n" },
    { "<LEADER>ob", "<CMD>ObsidianBacklinks<CR>", mode = "n" },
    { "<LEADER>od", "<CMD>ObsidianDailies<CR>", mode = "n" },
    { "<LEADER>on", "<CMD>ObsidianNew<CR>", mode = "n" },
  },
  opts = {
    workspaces = {
      {
        name = "notes",
        path = "~/Documents/obsidian_vault",
      },
    },
    daily_notes = {
      folder = "standups",
      date_format = "%d-%m-%Y",
      template = nil,
    },
    templates = {
      folder = "~/Documents/obsidian_vault/templates",
      date_format = "%d-%m-%Y",
    },
    ui = {
      checkboxes = {
        [" "] = { char = "󰄰", hl_group = "ObsidianTodo" },
        ["x"] = { char = "󰄴", hl_group = "ObsidianDone" },
      },
    },
    note_id_func = function(title)
      local filename = ""

      if title ~= nil then
        filename = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          filename = filename .. string.char(math.random(65, 90))
        end

        filename = tostring(os.time()) .. "-" .. filename
      end

      return filename
    end,
    follow_url_func = function(url)
      vim.fn.jobstart({ "open", url })
    end,
  },
}
