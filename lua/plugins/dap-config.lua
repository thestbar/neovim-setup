return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "folke/neodev.nvim",
    },
    keys = {
      { "<leader>db", "<CMD>DapToggleBreakpoint<CR>", mode = "n", remap = true },
      { "<leader>dc", "<CMD>DapContinue<CR>", mode = "n", remap = true },
      { "<leader>do", "<CMD>DapStepOver<CR>", mode = "n", remap = true },
      { "<leader>di", "<CMD>DapStepInto<CR>", mode = "n", remap = true },
      { "<leader>dr", "<CMD>DapToggleRepl<CR>", mode = "n", remap = true },
    },
    config = function()
      require("dapui").setup()
      require("neodev").setup({
        library = { plugins = { "nvim-dap-ui" }, types = true },
      })

      local dap = require("dap")
      local mason_registry = require("mason-registry")
      local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
      local codelldb_path = codelldb_root .. "adapter/codelldb"

      dap.adapters.codelldb = function(on_adapter)
        -- This asks the system for a free port
        local tcp = vim.loop.new_tcp()
        tcp:bind("127.0.0.1", 0)
        local port = tcp:getsockname().port
        tcp:shutdown()
        tcp:close()

        -- Start codelldb with the port
        local stdout = vim.loop.new_pipe(false)
        local stderr = vim.loop.new_pipe(false)
        local opts = {
          stdio = { nil, stdout, stderr },
          args = { "--port", tostring(port) },
        }
        local handle
        local pid_or_err
        handle, pid_or_err = vim.loop.spawn(codelldb_path, opts, function(code)
          stdout:close()
          stderr:close()
          handle:close()
          if code ~= 0 then
            print("codelldb exited with code", code)
          end
        end)
        if not handle then
          vim.notify("Error running codelldb: " .. tostring(pid_or_err), vim.log.levels.ERROR)
          stdout:close()
          stderr:close()
          return
        end
        vim.notify("codelldb started. pid=" .. pid_or_err)
        stderr:read_start(function(err, chunk)
          assert(not err, err)
          if chunk then
            vim.schedule(function()
              require("dap.repl").append(chunk)
            end)
          end
        end)
        local adapter = {
          type = "server",
          host = "127.0.0.1",
          port = port,
        }
        -- Wait for codelldb to get ready and start listening before telling nvim-dap to connect
        -- If you get connect errors, try to increase 500 to a higher value, or check the stderr (Open the REPL)
        vim.defer_fn(function()
          on_adapter(adapter)
        end, 1000)
      end

      dap.configurations.cpp = {
        {
          name = "runit",
          type = "codelldb",
          request = "launch",

          program = function()
            return vim.fn.input("", vim.fn.getcwd() .. "/bin/testdir/", "file")
          end,

          args = { "--log_level=all" },
          cwd = "${workspaceFolder}/bin/testdir",
          stopOnEntry = false,
          terminal = "integrated",

          pid = function()
            local handle = io.popen("pgrep hw$")
            if handle == nil then
              print("Failed to run pgrep")
              return nil
            end
            local result = handle:read()
            handle:close()
            return result
          end,
        },
      }

      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp

      local dapui = require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
}
