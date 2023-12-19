# nvim-config

Neovim config, currently going through transition from Vimscript to Lua.


## Requirements

- Neovim >=0.9.4

## Installation

```sh
# Backup existing config
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.config/nvim ~/.config/nvim.bak

# Clone packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Clone config
git clone https://github.com/ristomatti/neovim-config.git ~/.config/nvim
```

