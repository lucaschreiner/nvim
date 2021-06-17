call plug#begin('~/.config/nvim/plugged')

Plug 'joshdick/onedark.vim'

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
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'romgrk/barbar.nvim'
Plug 'tpope/vim-fugitive'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'mhinz/vim-startify'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-ts-autotag'
Plug 'p00f/nvim-ts-rainbow'

call plug#end()

lua require("lucalol")

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:rnvimr_ex_enable = 1
let g:rnvimr_draw_border = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_bw_enable = 1
nnoremap <silent>- :RnvimrToggle<CR>

syntax on
colorscheme onedark

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif


nnoremap <silent> <Space> <NOP>
let mapleader = " "

nnoremap <silent> <C-Up> :resize -2<CR>
nnoremap <silent> <C-Down> :resize +2<CR>
nnoremap <silent> <C-Left> :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>
nnoremap <silent> <leader>e :NvimTreeToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <silent> <TAB> :BufferNext<CR>
nnoremap <silent> <S-TAB> :BufferPrevious<CR>
nnoremap <silent> <S-x> :BufferClose<CR>

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

lua << EOF
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
EOF

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

