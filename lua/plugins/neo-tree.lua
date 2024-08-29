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
    require('nvim-web-devicons').setup()

    require('neo-tree').setup({
      enable_git_status = true,
    })
  end
}

