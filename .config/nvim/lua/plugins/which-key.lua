return {
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
      -- Register keys for LSP
      require("which-key").register({
        mode = { "n", "v" },
        ["<leader>f"] = { name = "+[F]ind via telescope" },
        ["<leader>d"] = { name = "+LSP [D]ocument" },
        ["<leader>c"] = { name = "+LSP [C]ode Action" },
        ["<leader>r"] = { name = "+LSP [R]ename" },
        ["<leader>w"] = { name = "+LSP [W]orkspace" }
      })

    end
  }
}
