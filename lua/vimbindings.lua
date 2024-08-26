vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

-- Add numbers indentation
vim.cmd("set number")
vim.cmd("autocmd InsertEnter * :set norelativenumber")
vim.cmd("autocmd InsertLeave * :set relativenumber")

-- Neovim general configurations
local options = {                  -- :help options
  backup = false,                  -- Don't create a backup file
  clipboard = 'unnamedplus',       -- Allow NeoVim to access system clipboard
  conceallevel = 0,                -- Make `` visible in Markdown files
  fileencoding = 'utf-8',          -- Use `utf-8` as encoding
  hlsearch = true,                 -- Highlight all matches on previous search pattern
  ignorecase = true,               -- Ignore case in search patterns
  mouse = 'a',                     -- Allow the mouse to be used in NeoVim
  showmode = false,                -- Hide NeoVim modes in the status bar
  showtabline = 2,                 -- Always show tabs
  smartcase = true,                -- Ignore `ignorecase` if search pattern contains upper case characters
  smartindent = true,              -- Make indenting smarter on newline
  splitbelow = true,               -- Force all horizontal splits to go below current window
  splitright = true,               -- Force all vertical splits to go to the right of current window
  swapfile = false,                -- Don't create a swapfile
  termguicolors = true,            -- Set term gui colors
  timeoutlen = 1000,               -- Time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 300,                -- Faster completion (4000ms default)
  writebackup = false,             -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                -- Convert tabs to spaces
  shiftwidth = 2,                  -- The number of spaces inserted for each indentation
  tabstop = 2,                     -- Insert 2 spaces for a tab
  cursorline = true,               -- Highlight the current line
  cursorlineopt = 'number',        -- Hightlight the current line number
  number = true,                   -- Set numbered lines
  relativenumber = true,           -- Don't set relative numbered lines
  signcolumn = 'yes',              -- Always show the sign column, otherwise it would shift the text each time
  wrap = false,                    -- Display long lines as one
  scrolloff = 8,                   -- Minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 8,               -- Minimal number of screen columns to keep left and right the cursor
  cmdheight = 1,                   -- More space in the neovim command line for displaying messages
  pumheight = 10,                  -- Make popup menu smaller
  background = 'dark',             -- Tell NeoVim what the background color is
  laststatus = 3,                  -- Use global statusline
  completeopt = 'menuone,noselect' -- When to display the auto complete popup menu
}

for option, setting in pairs(options) do
  vim.opt[option] = setting
end

-- Basic bindings
local bind = vim.keymap.set

vim.g.mapleader = " "

vim.opt.langmap = "ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,"
  .. "ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,"
  .. "σs,τt,θu,ωv,ςw,χx,υy,ζz"

-- Unbind 'K'
bind("n", "K", "<NOP>")

-- Exit insert mode
bind("i", "jk", "<ESC>")
bind("i", "ξκ", "<ESC>")

-- Stay in indent mode after indenting text
bind("v", "<", "<gv")
bind("v", ">", ">gv")

-- Move text up and down
bind("x", "J", ":move '>+1<CR>gv")
bind("x", "K", ":move '<-2<CR>gv")

-- Clear highlights and prints
bind("n", "<LEADER>n", '<CMD>noh<CR><cmd>echo ""<CR>')

-- Copy path to clipboard
bind("n", "<LEADER>yf", '<CMD>lua vim.fn.setreg("+", vim.fn.expand("%:."))<CR>')
bind("n", "<LEADER>yl", '<CMD>lua vim.fn.setreg("+", vim.fn.expand("%:.") .. ":" .. vim.fn.line("."))<CR>')

-- Resize with arrows
bind("n", "<C-Up>", "<CMD>resize +2<CR>")
bind("n", "<C-Down>", "<CMD>resize -2<CR>")
bind("n", "<C-Left>", "<CMD>vertical resize -2<CR>")
bind("n", "<C-Right>", "<CMD>vertical resize +2<CR>")

-- Improve window navigation
bind("n", "<C-h>", "<C-w>h")
bind("n", "<C-j>", "<C-w>j")
bind("n", "<C-k>", "<C-w>k")
bind("n", "<C-l>", "<C-w>l")
bind("t", "<ESC><ESC>", "<C-\\><C-n>")
bind("t", "<C-h>", "<CMD>wincmd h<CR>")
bind("t", "<C-j>", "<CMD>wincmd j<CR>")
bind("t", "<C-k>", "<CMD>wincmd k<CR>")
bind("t", "<C-l>", "<CMD>wincmd l<CR>")

-- Tab navigation
bind("n", "<LEADER>tt", "<CMD>tabnew | Alpha<CR>")
bind("n", "<LEADER>tq", "<CMD>tabclose<CR>")
bind("n", "<LEADER>tn", "<CMD>tabnext<CR>")
bind("n", "<LEADER>tp", "<CMD>tabprev<CR>")

-- Delete selection into void register before pasting
bind("x", "<LEADER>p", '"_dP')

-- LSP
bind("n", "<LEADER>k", vim.diagnostic.open_float)
bind("n", "[d", vim.diagnostic.goto_prev)
bind("n", "]d", vim.diagnostic.goto_next)
