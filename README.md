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

### Zsh

# Install on Mac
brew install zsh

# Create ~/.zshrc if it does not exists.
test -f ~/.zshrc || touch ~/.zshrc

# Source config file at the first line in ~/.zshrc.
# If there are any settings that need to be done earlier than this, just add 'source ~/.dots/zsh/config' into ~/.zshrc manually.
printf "# Configuration from ~/.dots\nsource ~/.dots/zsh/config\n\n%s" "$(cat ~/.zshrc)" > ~/.zshrc

exec zsh

# Install fzf (optional)
brew install fzf

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
