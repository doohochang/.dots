# .dots

Configuration files for UNIX-like systems.

```sh
### Update submodules first

git submodule update --init

### Fonts

# Install on Mac
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font

### Alacritty

# Install on Mac
brew install alacritty

ln -s ~/.dots/.config/alacritty ~/.config/alacritty

### Neovim

# Install on Mac
brew install nvim

ln -s ~/.dots/.config/nvim ~/.config

# Set git editor to nvim
git config --global core.editor nvim
```
