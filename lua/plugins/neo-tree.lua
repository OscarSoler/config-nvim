return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '<leader>t', '<Cmd>Neotree toggle<CR>')
    vim.keymap.set("n", "<leader>f", ":Neotree filesystem reveal left<CR>", {})
    -- vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
    require('nvim-web-devicons').setup()

    require('neo-tree').setup({
      enable_git_status = true,
      default_component_configs = {
        git_status = {
          symbols = {
            added     = "",  -- Ícono de verificación (representa un archivo agregado)
            deleted   = "",  -- Ícono de cruz (representa un archivo eliminado)
            modified  = "✎",  -- Ícono de lápiz (representa un archivo modificado)
            renamed   = "凜",  -- Ícono de flechas (representa un archivo renombrado)
            untracked = "",  -- Ícono de interrogación (representa un archivo no rastreado)
            ignored   = "",  -- Ícono de ojo cerrado (representa un archivo ignorado)
            unstaged  = "",  -- Ícono de círculo (representa cambios no preparados)
            staged    = "",  -- Ícono de marcador (representa cambios preparados)
            conflict  = "",  -- Ícono de alerta (representa conflictos)
          }
        }
      }
    })
  end
}

