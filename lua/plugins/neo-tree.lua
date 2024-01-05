return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local devicons = require('nvim-web-devicons')
    if devicons then
      devicons.set_icon({
         folder = {
           icon = "",
           color = "#FF0000",
           name = "NeoTreeFolderIcon"
         }
      })
    end

    vim.keymap.set('n', '<leader>t', '<Cmd>Neotree toggle<CR>')
    vim.keymap.set("n", "<leader>f", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
  end
}
