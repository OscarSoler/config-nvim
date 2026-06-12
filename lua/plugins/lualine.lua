return {
  "nvim-lualine/lualine.nvim",

  config = function()
    -- Badge azul estilo VSCode: texto blanco sobre fondo azul.
    -- Se redefine en cada ColorScheme para sobrevivir cambios de tema.
    local function set_badge_hl()
      -- Badge verde "hacker"/matrix: texto negro sobre verde neón.
      vim.api.nvim_set_hl(0, "StatusGitBadge", { fg = "#0A0A0A", bg = "#00FF41", bold = true })
      -- Ícono de rama en el mismo verde neón (sin fondo).
      vim.api.nvim_set_hl(0, "StatusGitBranch", { fg = "#00FF41", bold = true })
    end
    set_badge_hl()
    vim.api.nvim_create_autocmd("ColorScheme", { callback = set_badge_hl })

    -- Contador de archivos cambiados en el repo (estilo VSCode), cacheado.
    local git_count = 0

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "FocusGained", "DirChanged" }, {
      callback = function()
        local dir = vim.fn.expand("%:p:h")
        vim.system({ "git", "-C", dir == "" and "." or dir, "status", "--porcelain" }, { text = true }, function(obj)
          if obj.code ~= 0 then -- Fuera de un repo git: sin badge
            vim.schedule(function()
              git_count = 0
              require("lualine").refresh()
            end)
            return
          end
          local count = 0
          for _ in (obj.stdout or ""):gmatch("[^\r\n]+") do count = count + 1 end
          vim.schedule(function()
            git_count = count
            require("lualine").refresh()
          end)
        end)
      end,
    })

    require('lualine').setup({
      options = {
        theme = 'dracula',
        section_separators = '',
        component_separators = '',
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          { 'branch', icon = '\u{e0a0}', color = "StatusGitBranch" },
          {
            -- Badge verde con ícono de Source Control (Codicons, el mismo set de VSCode).
            function() return string.format(" \u{ea68} %d ", git_count) end,
            cond = function() return git_count > 0 end,
            color = "StatusGitBadge",
          },
        },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
    })
  end
}
