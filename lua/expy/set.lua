-- vim.opt.guicursor = ""

vim.opt.list = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("$HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- enabling clipboard for wsl UPD: currently not neeeded, fixed?
-- https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
if vim.fn.has("wsl") or vim.fn.has("win32") then
  vim.opt.clipboard = "unnamedplus"
end

vim.api.nvim_set_keymap("n", "<leader>t2", ":set tabstop=2<CR>:set shiftwidth=2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>t4", ":set tabstop=4<CR>:set shiftwidth=4<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>tt", ":set expandtab!<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>td", ":set ff=dos<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>tu", ":set ff=unix<CR>", {noremap = true, silent = true})



