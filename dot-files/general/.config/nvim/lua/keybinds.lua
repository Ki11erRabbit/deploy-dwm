local home = os.getenv('HOME')


local g = vim.g
local o = vim.o
local a = vim.api



--| Number Toggle |--
a.nvim_set_keymap("n", "<space>n", ":setlocal invnumber<cr> :setlocal invrelativenumber<cr>", { noremap = true })
a.nvim_set_keymap("n", "<space>N", ":setlocal invrelativenumber<cr>", { noremap = true })
--| Telescope Options |--
a.nvim_set_keymap("n", "<space>fd", ":Telescope file_browser path=" .. home .. "/.config/nvim<cr>", { noremap = true })
a.nvim_set_keymap("n", "<space>fw", ":Telescope live_grep<cr>", { noremap = true })
a.nvim_set_keymap("n", "<space>ff", ":Telescope find_files find_command=rg,--hidden,--files<cr>", { noremap = true })
a.nvim_set_keymap("n", "<space>fb", ":Telescope file_browser<cr>", { noremap = true })

--| Nvim-gdb controls |--
a.nvim_set_keymap("n","<space>db", ":GdbBreakpointToggle<cr>", {noremap = true })
a.nvim_set_keymap("n","<space>dc", ":GdbContinue<cr>", { noremap = true })
a.nvim_set_keymap("n","<space>dn", ":GdbNext<cr>", { noremap = true })
a.nvim_set_keymap("n","<space>ds", ":GdbStep<cr>", { noremap = true })
a.nvim_set_keymap("n","<space>dl", ":GdbLopenBreakboints<cr>", { noremap = true })

--| Memento Config |--
a.nvim_set_keymap("n","<space>fh", ":lua require('memento').toggle()<cr>", { noremap = true })


a.nvim_set_keymap("n","<space>sl", ":Telescope possession list<cr>", { noremap = true })

--| TagBar |--
a.nvim_set_keymap("n","<space>tb", ":TagbarToggle<cr>", { noremap = true })

--| Markdown Preview |--
a.nvim_set_keymap("n","<space>mp", ":MarkdownPreviewToggle<cr>", { noremap = true })

--| Packer keybinds |--
a.nvim_set_keymap("n","<space>pi", ":PackerInstall<cr>", { noremap = true })
a.nvim_set_keymap("n","<space>pc", ":PackerClean<cr>", { noremap = true })
a.nvim_set_keymap("n","<space>pp", ":PackerCompile<cr>", { noremap = true })

--| Colemak-DH Remaps |--
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

vim.keymap.set('', '<c-w>m', '<c-w>h') -- left
vim.keymap.set('', '<c-w>n', '<c-w>j') -- down
vim.keymap.set('', '<c-w>e', '<c-w>k') -- up
vim.keymap.set('', '<c-w>i', '<c-w>l') -- right



