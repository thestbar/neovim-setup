return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.buttons.val = {
      dashboard.button("e", " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "󰈞 Find file", ":Telescope find_files <CR>"),
      dashboard.button("h", "󰋚 Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("g", " Find text", ":Telescope live_grep_args <CR>"),
      dashboard.button("q", "󰅝 Quit Neovim", ":qa<CR>"),
    }

    dashboard.section.header.val = {
      [[                                                                                ]],
      [[ =================     ===============     ===============   ========  ======== ]],
      [[ \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . // ]],
      [[ ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .|| ]],
      [[ || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . || ]],
      [[ ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .|| ]],
      [[ || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . || ]],
      [[ ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .|| ]],
      [[ || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . || ]],
      [[ ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.|| ]],
      [[ ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `|| ]],
      [[ ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   || ]],
      [[ ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   || ]],
      [[ ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   || ]],
      [[ ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   || ]],
      [[ ||   .=='    _-'          `-__\._-'         `-_./__-'         `' |. /|  |   || ]],
      [[ ||.=='    _-'                                                     `' |  /==.|| ]],
      [[ =='    _-'                                                            \/   `== ]],
      [[ \   _-'                                                                `-_   / ]],
      [[  `''                                                                      ``'  ]],
      [[                                                                                ]],
    }

    alpha.setup(dashboard.opts)
  end,
}
