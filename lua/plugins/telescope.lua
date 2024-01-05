return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  defaults = {
    file_ignore_patterns = { "node_modules", "build", "dist", "yarn.lock", "vendor"}
  },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>p', builtin.find_files, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})
    vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
  end
}
