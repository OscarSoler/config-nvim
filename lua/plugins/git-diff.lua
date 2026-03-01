return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- Set up key mappings for Diffview
    vim.keymap.set('n', '<leader>dv', '<Cmd>DiffviewOpen<CR>', {})
    vim.keymap.set('n', '<leader>dc', '<Cmd>DiffviewClose<CR>', {})
    vim.keymap.set('n', '<leader>dh', '<Cmd>DiffviewFileHistory<CR>', {})
    vim.keymap.set('n', '<leader>dt', '<Cmd>DiffviewToggleFiles<CR>', {})  -- Added keybinding for toggling the file panel
    -- Optionally configure Diffview here
    config = function()
      require('diffview').setup({
      keymaps = {
        file_panel = {
          {
            "n", "cc",
            "<Cmd>Git commit <bar> wincmd J<CR>",
            { desc = "Commit staged changes" },
          },
          {
            "n", "ca",
            "<Cmd>Git commit --amend <bar> wincmd J<CR>",
            { desc = "Amend the last commit" },
          },
          {
            "n", "c<space>",
            ":Git commit ",
            { desc = "Populate command line with \":Git commit \"" },
          },
        },
        }
      })
    end
  end
}

