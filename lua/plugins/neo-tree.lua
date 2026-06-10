return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "echasnovski/mini.icons", -- iconos por nombre de carpeta/archivo (mockea nvim-web-devicons)
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = true,

      default_component_configs = {
        indent = {
          with_markers = true,
          with_expanders = true, -- los chevrons > v
          expander_collapsed = "",
          expander_expanded = "",
        },
        git_status = {
          symbols = {
            -- letras a la derecha (M, U, etc.)
            added     = "",   -- usa el color, no la letra
            modified  = "",
            deleted   = "✖",
            renamed   = "󰁕",
            untracked = "U",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "",
            conflict  = "",
          },
        },
      },

      window = {
        position = "left",
        width = 30,
      },

      filesystem = {
        filtered_items = {
          visible = true,        -- muestra ocultos en gris
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
    })

    vim.keymap.set("n", "<leader>t", "<Cmd>Neotree toggle<CR>")
    vim.keymap.set("n", "<leader>f", ":Neotree filesystem reveal left<CR>", {})
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})

    -- Colores personalizados de neo-tree.
    -- Se aplican en un autocmd ligado al colorscheme para que no los pise
    -- onedark al recargarse.
    local function neo_tree_highlights()
      -- Nombre de carpetas en blanco/gris claro (antes rosa)
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#abb2bf" })

      -- Archivos con cambios en verde (antes gris)
      vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#98c379" })
      vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = "#98c379" })
      vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#98c379" })
    end

    neo_tree_highlights()
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = neo_tree_highlights,
    })
  end,
}
