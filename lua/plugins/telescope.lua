return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.oldfiles, {})
      vim.keymap.set("n", "<leader>fp", builtin.pickers, {})

      local default = function(title)
        return {
          prompt_title = title,
          results_title = false,
        }
      end

      local dropdown = function(title, previewer)
        return {
          prompt_title = title,
          previewer = previewer or false,
          theme = "dropdown",
        }
      end

      local actions = require("telescope.actions")
      local lga_actions = require("telescope-live-grep-args.actions")

      require("telescope").setup({
        defaults = {
          prompt_prefix = "",
          selection_caret = "❯ ",
          layout_strategy = "vertical",
          sorting_strategy = "ascending",
          layout_config = {
            preview_cutoff = 25,
            mirror = true,
            prompt_position = "top",
          },
          cache_picker = {
            num_pickers = 10,
          },
        },
        pickers = {
          buffers = dropdown("Buffers"),
          find_files = dropdown("Files"),
          grep_string = default("Search"),
          live_grep = default("Grep"),
          commands = default("Commands"),
          help_tags = default("Help Tags"),
          keymaps = default("Keymaps"),
          pickers = default("Pickers"),
        },
        extensions = {
          live_grep_args = {
            auto_quoting = true,
            mappings = {
              i = {
                ["<C-h>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                ["<C-l>"] = lga_actions.quote_prompt({ postfix = " --iglob '!*spec' " }),
                ["<C-o>"] = actions.to_fuzzy_refine,
              },
            },
          },
          fzf_native = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })

      require("telescope").load_extension("live_grep_args")
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
