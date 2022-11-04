local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

-- window navigation
keymap("n", "<leader>e", ":Ex<CR>", opts)
keymap("n", "<leader>h", "<C-W>h", opts)
keymap("n", "<leader>j", "<C-W>j", opts)
keymap("n", "<leader>k", "<C-W>k", opts)
keymap("n", "<leader>l", "<C-W>l", opts)
keymap("n", "<leader>v", "<C-W>v", opts)
keymap("n", "<leader>=", "<C-W>=", opts)
keymap("n", "<leader>s", ":sp<CR>", opts)
keymap("n", "<leader>pv", ":wincmd v <bar> :Ex <bar> vertical resize 20<CR>", opts)

-- colorscheme
keymap("n", "<leader>cc", ":colorscheme tokyonight-day<CR>", opts)
keymap("n", "<leader>co", ":colorscheme tokyonight <bar> :hi Normal guibg=NONE ctermbg=NONE<CR>", opts)

-- file navigation
keymap("n", "<leader>pf", ":Files<CR>", opts)
keymap("n", "<leader>ps", ":Rg<CR>", opts)

-- convenience
keymap("n", "<S-y>", "<S-v>y", opts)

-- parenthesis
keymap("i", '"', '""<ESC>i', opts)
keymap("i", "'", "''<ESC>i", opts)
keymap("i", "`", "``<ESC>i", opts)
keymap("i", "(", "()", opts)
keymap("i", "{", "{}", opts)
keymap("i", "[", "[]", opts)
keymap("i", "{<CR>", "{<CR>}<ESC><S-o>", opts)
keymap("i", "{;<CR>", "{<CR>};<ESC><S-o>", opts)
keymap("i", "(<CR>", "(<CR>)<ESC><S-o>", opts)
keymap("i", "(;<CR>", "(<CR>);<ESC><S-o>", opts)
keymap("i", "[<CR>", "[<CR>]<ESC><S-o>", opts)
keymap("i", "[;<CR>", "[<CR>];<ESC><S-o>", opts)

-- barbar
keymap("n", "<leader>,", "<Cmd>BufferPrevious<CR>", opts)
keymap("n", "<leader>.", "<Cmd>BufferNext<CR>", opts)
keymap("n", "<leader>1", "<Cmd>BufferGoto 1<CR>", opts)
keymap("n", "<leader>2", "<Cmd>BufferGoto 2<CR>", opts)
keymap("n", "<leader>3", "<Cmd>BufferGoto 3<CR>", opts)
keymap("n", "<leader>4", "<Cmd>BufferGoto 4<CR>", opts)
keymap("n", "<leader>5", "<Cmd>BufferGoto 5<CR>", opts)
keymap("n", "<leader>6", "<Cmd>BufferGoto 6<CR>", opts)
keymap("n", "<leader>7", "<Cmd>BufferGoto 7<CR>", opts)
keymap("n", "<leader>8", "<Cmd>BufferGoto 8<CR>", opts)
keymap("n", "<leader>9", "<Cmd>BufferGoto 9<CR>", opts)
keymap("n", "<leader>0", "<Cmd>BufferLast<CR>", opts)
keymap("n", "<leader>b", "<Cmd>BufferCloseAllButCurrent<CR>", opts)
