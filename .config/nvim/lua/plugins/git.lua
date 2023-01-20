return {
  -- Git related plugins
  'tpope/vim-fugitive',
  -- 'tpope/vim-rhubarb',
  { 'lewis6991/gitsigns.nvim',
    -- Gitsigns
    -- See `:help gitsigns.txt`
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      }
    end }
}
