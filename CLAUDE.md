# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository for UNIX-like systems (primarily macOS) containing configurations for:
- **Alacritty** - Terminal emulator
- **Neovim** - Text editor 
- **Tmux** - Terminal multiplexer
- **Zsh** - Shell

## Common Commands

### Installation
```sh
# Clone and setup repository
git clone https://github.com/doohochang/.dots.git ~/.dots
cd ~/.dots
git submodule update --init

# Install each tool (requires Homebrew)
brew install alacritty nvim tmux zsh
brew install font-hack-nerd-font font-jetbrains-mono

# Create symlinks
ln -s ~/.dots/alacritty ~/.config/alacritty
ln -s ~/.dots/nvim ~/.config/nvim  
ln -s ~/.dots/tmux/.tmux.conf ~/.tmux.conf

# For Zsh, add to beginning of ~/.zshrc:
source ~/.dots/zsh/config
```

### Neovim Plugin Management
```sh
# Plugin management is automatic via lazy.nvim
# To update plugins: Open nvim and run :Lazy update
# Lock file: nvim/lazy-lock.json
```

## Architecture

### Directory Structure
```
~/.dots/
├── alacritty/         # Terminal configuration
│   ├── alacritty.toml # Main config (uses afterglow theme)
│   └── alacritty-theme/ # Git submodule with themes
├── nvim/              # Neovim configuration (Lua-based)
│   ├── init.lua       # Entry point with core settings
│   ├── lua/
│   │   ├── plugins.lua    # Plugin definitions (lazy.nvim)
│   │   ├── keys.lua       # Key mappings (leader: ,)
│   │   ├── commands.lua   # Custom commands
│   │   └── setting/       # Individual plugin configs
│   └── lazy-lock.json     # Plugin version lock
├── tmux/              # Tmux configuration
│   └── .tmux.conf     # Config (prefix: Ctrl-a)
└── zsh/               # Zsh configuration  
    └── config         # Sourced from ~/.zshrc (uses Zinit)
```

### Key Neovim Architecture Points

- **Plugin Manager**: lazy.nvim with 30+ plugins
- **Color Scheme**: Sonokai
- **LSP Support**: Configured for multiple languages including TypeScript, Python, Go, Rust, Scala
- **File Navigation**: nvim-tree (toggle: `<leader>n`) and telescope
- **Leader Key**: `,` (LocalLeader: `\`)

### Important Patterns

1. **Symlink Installation**: All tools use symlinks from `~/.config/` to `~/.dots/`
2. **Git Submodules**: Alacritty theme is a submodule - remember to init/update
3. **Neovim Structure**: Modular Lua configuration with separate files for different concerns
4. **Font Dependencies**: Requires Hack Nerd Font and JetBrains Mono installed via Homebrew