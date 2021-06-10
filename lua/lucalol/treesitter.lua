require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    ignore_install = {"haskell"},
    highlight = {
        enable = true -- false will disable the whole extension
    },
    -- indent = {enable = true, disable = {"python", "html", "javascript"}},
    indent = {enable = {"javascriptreact"}},
    autotag = {enable = true},
    rainbow = {enabled = true}
}
