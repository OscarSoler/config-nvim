return {
  "echasnovski/mini.icons",
  opts = {
    -- Iconos para carpetas de un proyecto Rails.
    -- Solo se reutilizan glifos que mini.icons ya trae por defecto.
    -- Coincidencia exacta y sensible a mayúsculas por nombre de carpeta.
    directory = {
      app          = { glyph = "󰴉", hl = "MiniIconsRed" },    -- glifo de "src"
      controllers  = { glyph = "󱁽", hl = "MiniIconsBlue" },
      models       = { glyph = "󱁽", hl = "MiniIconsOrange" },
      views        = { glyph = "󱁽", hl = "MiniIconsPurple" },
      helpers      = { glyph = "󱁽", hl = "MiniIconsCyan" },
      mailers      = { glyph = "󱁽", hl = "MiniIconsYellow" },
      jobs         = { glyph = "󱁽", hl = "MiniIconsGreen" },
      channels     = { glyph = "󱁽", hl = "MiniIconsCyan" },
      services     = { glyph = "󱁽", hl = "MiniIconsAzure" },
      serializers  = { glyph = "󱁽", hl = "MiniIconsGrey" },
      policies     = { glyph = "󱁽", hl = "MiniIconsRed" },
      decorators   = { glyph = "󱁽", hl = "MiniIconsPurple" },
      validators   = { glyph = "󱁽", hl = "MiniIconsGreen" },
      concerns     = { glyph = "󱁽", hl = "MiniIconsYellow" },
      components    = { glyph = "󱁽", hl = "MiniIconsCyan" },
      assets       = { glyph = "󰉏", hl = "MiniIconsOrange" }, -- glifo de "Pictures"
      images       = { glyph = "󰉏", hl = "MiniIconsPurple" },
      stylesheets  = { glyph = "󱁽", hl = "MiniIconsBlue" },
      javascript   = { glyph = "󱁽", hl = "MiniIconsYellow" },
      javascripts  = { glyph = "󱁽", hl = "MiniIconsYellow" },
      packs        = { glyph = "󱁽", hl = "MiniIconsOrange" },
      config       = { glyph = "󱁿", hl = "MiniIconsGrey" },   -- glifo de "etc"
      initializers = { glyph = "󱁽", hl = "MiniIconsYellow" },
      environments = { glyph = "󱁽", hl = "MiniIconsGreen" },
      locales      = { glyph = "󱁽", hl = "MiniIconsAzure" },
      db           = { glyph = "󱋣", hl = "MiniIconsBlue" },   -- glifo de "var"
      migrate      = { glyph = "󱁽", hl = "MiniIconsOrange" },
      migrations   = { glyph = "󱁽", hl = "MiniIconsOrange" },
      seeds        = { glyph = "󱁽", hl = "MiniIconsGreen" },
      lib          = { glyph = "󰲂", hl = "MiniIconsYellow" }, -- igual que el default
      tasks        = { glyph = "󱁽", hl = "MiniIconsGreen" },
      spec         = { glyph = "󱞊", hl = "MiniIconsGreen" },  -- glifo de "test"
      specs        = { glyph = "󱞊", hl = "MiniIconsGreen" },
      factories    = { glyph = "󱁽", hl = "MiniIconsCyan" },
      fixtures     = { glyph = "󱁽", hl = "MiniIconsCyan" },
      support      = { glyph = "󱁽", hl = "MiniIconsGrey" },
      features     = { glyph = "󱁽", hl = "MiniIconsGreen" },
      vendor       = { glyph = "󰉗", hl = "MiniIconsGrey" },   -- glifo de "opt"
      public       = { glyph = "󱧰", hl = "MiniIconsAzure" },  -- glifo de "Public"
      storage      = { glyph = "󱋣", hl = "MiniIconsGrey" },   -- glifo de "var/srv"
      uploads      = { glyph = "󱁽", hl = "MiniIconsCyan" },
      layouts      = { glyph = "󱁽", hl = "MiniIconsPurple" },
      partials     = { glyph = "󱁽", hl = "MiniIconsPurple" },
    },
  },
  init = function()
    package.preload["nvim-web-devicons"] = function()
      require("mini.icons").mock_nvim_web_devicons()
      return package.loaded["nvim-web-devicons"]
    end
  end,
}
