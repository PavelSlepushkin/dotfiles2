return function(use)
  use({
    "folke/which-key.nvim",
      config = function()
        require("which-key").setup({})
      end
  },
  use{'ray-x/go.nvim',
      config = function ()
        require('go').setup()
      end
    },
--  use 'shaunsingh/nord.nvim',
--  use 'arcticicestudio/nord-vim',
--  use 'Roy-Orbison/nord-vim-256',
  use{
   'windwp/nvim-autopairs',
     config =function ()
       require('nvim-autopairs').setup()
     end
    }
  )
end
