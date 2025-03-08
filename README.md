# .dots

My tool configurations for UNIX-like systems.

Note that the installing commands are based on Homebrew, as my main machine is a Mac.

### Getting started

1. Clone this repository into `~/.dots`, and then update the submodules.

   ```sh
   git clone https://github.com/doohochang/.dots.git ~/.dots
   cd ~/.dots
   git submodule update --init
   ```

1. Configure the tools you want.

### Fonts

```sh
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
```

### Alacritty

```sh
brew install alacritty
ln -s ~/.dots/alacritty ~/.config/alacritty
```

### Zsh

```sh
brew install zsh
test -f ~/.zshrc || touch ~/.zshrc
printf "# Configuration from ~/.dots\nsource ~/.dots/zsh/config\n\n%s" "$(cat ~/.zshrc)" > ~/.zshrc
exec zsh
```

<details>
  <summary>Note</summary>
  The script above adds `source ~/.dots/zsh/config` at the beginning of `~/.zshrc`.
  If there are any settings that need to be done earlier than this, just add `source ~/.dots/zsh/config` into `~/.zshrc` manually.
</details>

### Tmux

```sh
brew install tmux
ln -s ~/.dots/tmux/.tmux.conf ~/.tmux.conf
```

### Neovim

```sh
brew install nvim
ln -s ~/.dots/nvim ~/.config/nvim
git config --global core.editor nvim
```

<details>
  <summary>Note</summary>
  The script above sets Neovim as a Git core editor, which is used for commit message editing, interactive rebasing, and more.
  If you do not want this, just skip `git config --global core.editor nvim`.
</details>
