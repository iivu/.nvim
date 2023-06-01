local Plug = vim.fn['plug#']
local keyset = vim.keymap.set

-- Plugin
vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'brooth/far.vim'
Plug 'preservim/tagbar'
Plug 'lfv89/vim-interestingwords'
Plug('neoclide/coc.nvim', {branch = 'release'})
vim.call('plug#end')

vim.cmd('colorscheme gruvbox')

vim.o.number = true
vim.o.termguicolors = true
vim.opt.termguicolors = true

-- Global variables
vim.g['airline_theme'] = 'molokai'
vim['NERDTreeShowHidden'] = 1
vim.g['ctrlp_map'] = '<c-p>'

--Key maps
local function map(mode, combo, mapping, opts) 
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, combo, mapping, options)
end
vim.g.mapleader = ','
map('n', '<leader>g', ':NERDTreeToggle<cr>')
map('n', '<leader>v', ':NERDTreeFind<cr>')
map('n', '<leader>t', ':TagbarToggle<cr>')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-h>', '<c-w>h')
map('n', '<c-l>', '<c-w>l')

-- coc.vim
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
local cocOpts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#confirm() : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', cocOpts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], cocOpts)
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], cocOpts)

