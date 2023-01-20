--Spectre - Search in Replace
return {
  {
    "windwp/nvim-spectre",
    config = function()
      vim.keymap.set('n', '<leader>S', function() require('spectre').open() end,
        { desc = '[S]earch and replace -spectre' })
    end
  }
}
