call plug#begin('~/.config/nvim/plugged')

Plug 'christianchiarulli/nvcode-color-schemes.vim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Debugger
Plug 'puremourning/vimspector'

Plug 'kyazdani42/nvim-tree.lua'
Plug 'mbbill/undotree'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-ts-autotag'
Plug 'p00f/nvim-ts-rainbow'

call plug#end()

lua require("lucalol")

if executable('rg')
    let g:rg_derive_root='true'
endif

colorscheme nvcode
set background=dark

nnoremap <silent> <Space> <NOP>
let mapleader = " "

nnoremap <silent> <C-Up> :resize -2<CR>
nnoremap <silent> <C-Down> :resize +2<CR>
nnoremap <silent> <C-Left> :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>
nnoremap <silent> <leader>e :NvimTreeToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>
inoremap jk <ESC>
inoremap kj <ESC>

vnoremap < <gv
vnoremap > >gv

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <C-c> <esc>

" Telescope
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 150})
augroup END

augroup luca_lol
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
