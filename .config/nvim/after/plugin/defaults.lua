vim.opt.relativenumber = true
--bash-like tabComplete
vim.opt.wildmode = "longest,list,full"
vim.opt.wildmenu = true

vim.opt.scrolloff = 8

-- Ctrl-s for save
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>")
-- leader-s for search and replace current word
--vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- system clipboard
vim.opt.clipboard = "unnamedplus"

-- visial search and replace
vim.keymap.set('x', '<Leader>/', '<Esc>/\\%V', { desc = 'Search in visial block' })
vim.keymap.set('x', '<Leader>r', [[:s/\%V]], { desc = '[R]eplace in visual block' })

--Primagen remaps - move Visual block with JK
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- same but for cursor keys
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv")
-- cursor case up/down - go into Normal mod
vim.keymap.set("i", "<Down>", "<Esc><Down>")
vim.keymap.set("i", "<Up>", "<Esc><Up>")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP")

--[[ open telescope find_files when vim started without paramters
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd('Telescope find_files')
    end
  end,
})
--]]
--autocommand for save on focust lost and BufLeave
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  callback = function()
    if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
      vim.api.nvim_command('silent update')
    end
  end,
})

vim.keymap.set('n', '<leader>t', function() vim.o.rnu = not vim.o.rnu end, { desc = '[T]oggle relative line numbers' })

--
--Setup for Notes, assumes folder ~/notes/ exists
--
local Notes = {}
-- create functions for keymaps
Notes.Path = os.getenv("HOME") .. "/notes/"
Notes.Log = function()
  vim.cmd("e " .. Notes.Path .. "log.txt")
end
Notes.Scratch = function()
  vim.cmd("e " .. Notes.Path .. "scratch.txt")
end
Notes.Daily = function()
  vim.cmd("e " .. Notes.Path .. os.date("%Y-%m-%d") .. ".md")
end
Notes.Find_Files = function()
  require('telescope.builtin').find_files {
    prompt_title = '<notes::files>',
    cwd = Notes.Path
  }
end
Notes.Live_Grep = function()
  require('telescope.builtin').live_grep {
    prompt_title = '<notes::grep>',
    cwd = Notes.Path
  }
end
-- settings keymaps
vim.keymap.set('n', '<leader>nl', Notes.Log, { desc = '[N]otes [L]og' })
vim.keymap.set('n', '<leader>ns', Notes.Scratch, { desc = '[N]otes [S]cratch' })
vim.keymap.set('n', '<leader>nd', Notes.Daily, { desc = '[N]otes [D]aily in markdown' })
vim.keymap.set('n', '<leader>nf', Notes.Find_Files, { desc = '[N]otes [F]iles' })
vim.keymap.set('n', '<leader>ng', Notes.Live_Grep, { desc = '[N]otes [G]rep' })
-- end of notes setup
