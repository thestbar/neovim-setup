return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup()

    -- Never override parsers that Neovim bundles in its own runtime. Those are
    -- guaranteed to be compatible with Neovim's built-in queries. Installing an
    -- nvim-treesitter copy may pin an older grammar revision that breaks them
    -- (e.g. nvim-treesitter main pins tree-sitter-lua without the `operator`
    -- field while Neovim 0.12 ships v0.5.0 which adds it).
    local nvim_parser_dir = vim.env.VIMRUNTIME .. "/parser/"
    local function is_nvim_bundled(lang)
      return vim.fn.filereadable(nvim_parser_dir .. lang .. ".so") == 1
    end

    local available = ts.get_available()
    local function is_installed(lang)
      return vim.tbl_contains(ts.get_installed(), lang)
    end

    -- Parsers needed by snacks.image for rendering images in docs.
    local ensure_installed = { "tsx", "vue", "svelte", "typst", "latex" }

    -- Update all currently installed parsers and ensure the above are installed.
    vim.api.nvim_create_autocmd("VimEnter", {
      once = true,
      callback = function()
        for _, lang in ipairs(ensure_installed) do
          if vim.tbl_contains(available, lang) and not is_nvim_bundled(lang) and not is_installed(lang) then
            pcall(vim.cmd, "TSInstall " .. lang)
          end
        end
        pcall(vim.cmd, "TSUpdate")
      end,
    })

    -- On FileType, only install the parser if it is not installed yet.
    -- No updates at runtime — those are handled exclusively at startup above.
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(ev)
        local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
        if lang and vim.tbl_contains(available, lang) and not is_nvim_bundled(lang) and not is_installed(lang) then
          pcall(vim.cmd, "TSInstall " .. lang)
        end
      end,
    })
  end,
}
