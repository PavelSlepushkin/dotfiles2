 vim.opt.relativenumber = true
--bash-like tabComplete
vim.opt.wildmode = "longest,list,full"
vim.opt.wildmenu = true

vim.opt.scrolloff = 8

--Lua: colorscheme
--vim.cmd[[colorscheme habamax]]

--ray-x.go plugin format
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})
--[[
--terraform format on save
require'lspconfig'.terraformls.setup{}
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*.tf", "*.tfvars"},
  callback = function()
    vim.lsp.buf.format()
  end,
})
--]]
-- Ctrl-s for save
require('lualine').setup {
 sections = {
  lualine_c = {
    {
      'filename',
      file_status = true,      -- Displays file status (readonly status, modified status)
      path = 1,                -- 0: Just the filename
    }
  }
 }
 }
vim.keymap.set("n", "<C-s>", ":w<CR>")
-- leader-s for search and replace current word
--vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- system clipboard
vim.opt.clipboard = "unnamedplus"
-- terminal horizontal
-- comment out with lcd to current directory
--vim.keymap.set("n", '<leader>th', ":lcd %:p:h<CR>:55sp<CR><C-w><C-w>:te<CR>i")
--vim.keymap.set("n", '<leader>th', ":55sp<CR><C-w><C-w>:te<CR>i", { desc = '[T]erminal [H]orizontal'})
--Telescope default bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles'})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind with live [G]rep'})
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers'} )
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp'})

-- visial search and replace
vim.keymap.set('x', '<Leader>/', '<Esc>/\\%V', { desc = 'Search in visial block'})
vim.keymap.set('x', '<Leader>r', [[:s/\%V]], { desc = '[R]eplace in visual block'})

