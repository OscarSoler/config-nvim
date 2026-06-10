return {
  -- Instala y gestiona LSP servers, linters, formatters
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Puente entre mason y lspconfig (solo para instalación automática)
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",
          "eslint",
          "lua_ls",
          "html",
          "cssls",
          "ruby_lsp",
        },
      })
    end,
  },

  -- Configuración de LSP servers (API Nvim 0.11+)
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      -- Keymaps al conectar un LSP
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          -- gd: salta directo a la definición sin dejar abierta la quickfix.
          -- Si hay una sola, va derecho; si hay varias, abre un selector de
          -- Telescope (que se cierra solo) en vez de la lista quickfix.
          vim.keymap.set("n", "gd", function()
            local ok, builtin = pcall(require, "telescope.builtin")
            if ok then
              builtin.lsp_definitions()
            else
              vim.lsp.buf.definition()
            end
          end, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        end,
      })

      -- Nueva API Nvim 0.11: vim.lsp.config + vim.lsp.enable
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      vim.lsp.config("eslint", {
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })

      -- Ruby: ruby_lsp usa RuboCop como linter y formatter.
      vim.lsp.config("ruby_lsp", {
        init_options = {
          formatter = "rubocop",
          linters = { "rubocop" },
        },
        on_attach = function(client, bufnr)
          -- Formatea al guardar usando RuboCop vía ruby_lsp.
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr, id = client.id })
              end,
            })
          end
        end,
      })

      vim.lsp.enable({ "ts_ls", "eslint", "lua_ls", "html", "cssls", "ruby_lsp" })
    end,
  },
}
