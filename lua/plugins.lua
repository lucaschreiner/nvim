local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then
        vim.cmd("packadd " .. plugin)
    end
    return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(
    function(use)
        -- Packer can manage itself as an optional plugin
        use "wbthomason/packer.nvim"

        -- Explorer
        use "kyazdani42/nvim-tree.lua"

        -- LSP 
        use "neovim/nvim-lspconfig"
        use "glepnir/lspsaga.nvim"
        use "onsails/lspkind-nvim"
        use "kosayoda/nvim-lightbulb"
        use "mfussenegger/nvim-jdtls"
        use "kabouzeid/nvim-lspinstall"

        -- Debugging
        use "mfussenegger/nvim-dap"

        -- Autocompletion
        use "hrsh7th/nvim-compe"
        use "hrsh7th/vim-vsnip"
        use "rafamadriz/friendly-snippets"

        -- Telescope
        use "nvim-lua/popup.nvim"
        use "nvim-lua/plenary.nvim"
        use "nvim-telescope/telescope.nvim"
        use "nvim-telescope/telescope-fzy-native.nvim"

        -- Treesitter
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use "windwp/nvim-ts-autotag"
        use "p00f/nvim-ts-rainbow"

        -- Colorscheme
        use "christianchiarulli/nvcode-color-schemes.vim"

        -- Icons
        use "kyazdani42/nvim-web-devicons"

        -- Status Line and Bufferline
        use "glepnir/galaxyline.nvim"
        use "romgrk/barbar.nvim"

        -- Git
        use { "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" }
        use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

        -- Other Plugins
        use "norcalli/nvim-colorizer.lua"
        use "kevinhwang91/nvim-bqf"
        use "windwp/nvim-autopairs"
        use "kevinhwang91/rnvimr"
        use "unblevable/quick-scope"
        use "mbbill/undotree"
        use {"terrortylor/nvim-comment"}
        use "ahmedkhalf/lsp-rooter.nvim"
        use "nacro90/numb.nvim"
        use "numToStr/FTerm.nvim"

    end
)
