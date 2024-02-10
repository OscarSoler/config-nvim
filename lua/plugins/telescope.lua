return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require("telescope.builtin")

    vim.keymap.set('n', '<leader>p', builtin.find_files, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {noremap=true})
    vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
  end
}
