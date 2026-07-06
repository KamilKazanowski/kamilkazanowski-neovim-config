return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  version = '^1.0.0',
  map = vim.api.nvim_set_keymap,
  opts = { noremap = true, silent = true },

  -- move to previous/next buffer
  vim.api.nvim_set_keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true }),

  -- Re-order to previous/next
  vim.api.nvim_set_keymap('n', '<A-S-,>', '<Cmd>BufferMovePrevious<CR>', { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('n', '<A-S-.>', '<Cmd>BufferMoveNext<CR>', { noremap = true, silent = true }),

  config = function()
    require("barbar").setup({
      tabpages = false,
      auto_hide = 1,
      icons = {
        separator_at_end = false,
      }
    })
  end
}
