return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- Configura Mocha como el tema oscuro más intenso
        transparent_background = true, -- Habilita el fondo transparente
        term_colors = true, -- Aplica los colores también en la terminal integrada
        integrations = {
          treesitter = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
          cmp = true,
          gitsigns = true,
          telescope = true,
          nvimtree = true,
          which_key = true,
          indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
          },
          dashboard = true,
          neotree = true,
        },
      })
      -- Aplicar el tema de Catppuccin Mocha
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
}

