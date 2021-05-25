require('nvim_comment').setup()
vim.api.nvim_set_keymap("n", "<leader>k", ":CommentToggle<CR>", {noremap=true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>k", ":CommentToggle<CR>", {noremap=true, silent = true})
