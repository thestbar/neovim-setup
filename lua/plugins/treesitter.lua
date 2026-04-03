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

    -- Auto-install or update the parser for the current filetype, skipping
    -- languages whose parsers are already managed by Neovim itself.
    local available = ts.get_available()
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(ev)
        local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
        if lang and vim.tbl_contains(available, lang) and not is_nvim_bundled(lang) then
          pcall(vim.cmd, "TSUpdate " .. lang)
        end
      end,
    })
  end,
}
