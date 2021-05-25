``` 
git clone https://github.com/lucaschreiner/nvim.git ~/.config/nvim
```

After installation run `nvim` and then `:PackerInstall` or `:PackerSync`


## Get the latest version of Neovim

``` bash
#Ubuntu
sudo apt-get install gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip build-essential
```

Download and compile Neovim
``` bash
cd ~
sudo rm -r neovim
git clone https://github.com/neovim/neovim
cd neovim
sudo make CMAKE_BUILD_TYPE=Release install
cd ~
sudo rm -r neovim
```


- Note:
This is a Lua configuration so, if you want to change something in vimscript like the keymapps or settings, make a directory `vimscript`, then put for example: `mappings.vim`, and then source this file in `init.lua` like that: `vim.cmd('source ~/.config/nvim/vimscript/mappings.vim')`

## Packer Commands

``` bash
-- You must run this or `PackerSync` whenever you make changes to your plugin configuration
:PackerCompile
-- Only install missing plugins
:PackerInstall
-- Update and install plugins
:PackerUpdate
-- Remove any disabled or unused plugins
:PackerClean
-- Performs `PackerClean` and then `PackerUpdate`
:PackerSync
-- View the status of your plugins
:PackerStatus
```

# Install dependencies

- Install latest pynvim | Python 3 provider

```
pip3 install pynvim
```

- Install Node.js provider

```
npm install -g neovim
```

- If you want the Ruby provider

```
gem install neovim
```

- Clipboard support on Ubuntu

```
sudo apt install xclip
```

- Ranger file explorer

```
sudo apt install ranger
```
