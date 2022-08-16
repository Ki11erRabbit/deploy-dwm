

local g = vim.g
local o = vim.o
local a = vim.api




a.nvim_set_keymap("n", "<leader>n", ":setlocal invnumber<cr> :setlocal invrelativenumber<cr>", { noremap = true })
a.nvim_set_keymap("n", "<leader>N", ":setlocal invrelativenumber<cr>", { noremap = true })

vim.cmd('source ~/.config/nvim/hexokinase-ini.vim')
vim.keymap.set('n', 't', 'i') -- insert
vim.keymap.set('n', 'T', 'I') -- insert at bol

vim.keymap.set('', 'm', 'h') -- left
vim.keymap.set('', 'n', 'j') -- down
vim.keymap.set('', 'e', 'k') -- up
vim.keymap.set('', 'i', 'l') -- right

vim.keymap.set('', 'M', 'H') -- screen top
vim.keymap.set('', 'I', 'L') -- screen bottom
vim.keymap.set('', 'K', 'M') -- screen mid'l


vim.keymap.set('', 'j', 'n') -- Find prev
vim.keymap.set('', 'J', 'N') -- Find next

vim.keymap.set('', 'h', 'e') -- end WORD
vim.keymap.set('', 'H', 'E') -- end word

vim.keymap.set('', 'k', 't') -- back 'till
vim.keymap.set('', 'K', 'T') -- back 'till
