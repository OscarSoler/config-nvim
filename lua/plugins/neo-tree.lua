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
        icon = {
          -- Renderiza iconos con mini.icons tanto para archivos como carpetas.
          provider = function(icon, node)
            local ok, MiniIcons = pcall(require, "mini.icons")
            if not ok then
              return
            end
            if node.type == "directory" then
              local glyph, hl = MiniIcons.get("directory", node.name)
              icon.text = glyph
              icon.highlight = hl
            elseif node.type == "file" then
              local glyph, hl = MiniIcons.get("file", node.name)
              icon.text = glyph
              icon.highlight = hl
            end
          end,
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

    -- Toggle de foco: si estás en el árbol, salta al archivo; si estás en
    -- el archivo, salta al árbol (abriéndolo si está cerrado).
    vim.keymap.set("n", "<leader>e", function()
      if vim.bo.filetype == "neo-tree" then
        vim.cmd.wincmd("p")
      else
        vim.cmd("Neotree focus")
      end
    end, { desc = "Toggle focus Neo-tree / archivo" })

    -- Colores personalizados de neo-tree.
    -- Se aplican en un autocmd ligado al colorscheme para que no los pise
    -- onedark al recargarse.
    local function neo_tree_highlights()
      -- Paleta Catppuccin Mocha
      local green = "#a6e3a1" -- verde de catppuccin

      -- El icono de carpeta lo pinta mini.icons vía el provider (azul Azure).
      -- Solo dejamos el nombre neutro (gris claro) en vez del rosa de onedark.
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#abb2bf" })

      -- Archivos con cambios en verde de catppuccin
      vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = green })
      vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = green })
      vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = green })
    end

    neo_tree_highlights()
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = neo_tree_highlights,
    })
  end,
}
