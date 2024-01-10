return {
  "olimorris/onedarkpro.nvim",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "onedark_dark"
    vim.g.onedark_terminal_italics = 1
  end
}
