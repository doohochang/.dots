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

ln -s ~/.dots/alacritty ~/.config/alacritty

### Tmux

# Install on Mac
brew install tmux

ln -s ~/.dots/tmux/.tmux.conf ~/.tmux.conf

### Neovim

# Install on Mac
brew install nvim

ln -s ~/.dots/nvim ~/.config/nvim

# Set git editor to nvim
git config --global core.editor nvim
```
