return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = function()
    require("tiny-inline-diagnostic").setup({
      signs = {
        left = "",
        right = "",
        diag = "●",
        arrow = "    ",
        up_arrow = "    ",
        vertical = " │",
        vertical_end = " └",
      },
      hi = {
        error = "DiagnosticError",
        warn = "DiagnosticWarn",
        info = "DiagnosticInfo",
        hint = "DiagnosticHint",
        arrow = "NonText",
        background = "CursorLine",
        mixing_color = "None",
      },
      blend = {
        factor = 0.27,
      },
      options = {
        -- Mostrar el mensaje en la línea donde está el error (como Error Lens)
        show_source = true,
        -- Mostrar todos los diagnósticos, no solo el del cursor
        multiple_diag_under_cursor = true,
        -- Mostrar diagnósticos de todas las líneas visibles
        multilines = {
          enabled = true,
          always_show = true,
        },
        -- Ancho máximo del mensaje
        softwrap = 30,
        overflow = {
          mode = "wrap",
        },
        format = nil,
      },
    })

    -- Desactivar el virtual text nativo de neovim para evitar duplicados
    vim.diagnostic.config({
      virtual_text = false,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
  end,
}
