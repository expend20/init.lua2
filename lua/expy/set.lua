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
local function execute_command(command)
    local file = io.popen(command)
    local output = file:read('*all')
    file:close()
    return output
end
-- Function to check if the Ubuntu version is 20.04
local function is_ubuntu_2004()
    local lsb_output = execute_command('lsb_release -r') -- Execute lsb_release -r command
    local version_number = lsb_output:match('Release:%s+(%d+%.%d+)') -- Extract version number
    if version_number == '20.04' then
        return true
    else
        return false
    end
end
if vim.fn.has("wsl") or vim.fn.has("win32") then
  vim.opt.clipboard = "unnamedplus"
  if is_ubuntu_2004() then
    vim.g.clipboard = {
      name = 'WslClipboard',
      copy = {
          ['+'] = 'clip.exe',
          ['*'] = 'clip.exe',
      },
      paste = {
          ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
          ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      },
      cache_enabled = 0,
    }
  end
end

vim.api.nvim_set_keymap("n", "<leader>t2", ":set tabstop=2<CR>:set shiftwidth=2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>t4", ":set tabstop=4<CR>:set shiftwidth=4<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>tt", ":set expandtab!<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>td", ":set ff=dos<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>tu", ":set ff=unix<CR>", {noremap = true, silent = true})


-- Remove trailing whitespace on save
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local expyGroup = augroup('expy', {})
autocmd({"BufWritePre"}, {
    group = expyGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})


