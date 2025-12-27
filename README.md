# Dev Config

Modern development environment with Neovim + Tmux.

## Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/sherhonbeknuraliyev/dev-config/main/install.sh | bash
```

## What's Included

### Neovim IDE
- **Languages**: Go, TypeScript, Python, C++, Rust, Lua, HTML/CSS
- **Features**: LSP, autocompletion, formatting, linting, git integration
- **Theme**: Tokyo Night
- **Plugins**: 30+ carefully configured plugins

### Tmux
- **Prefix**: `Ctrl+a`
- **Session persistence**: Auto-saves every 15 minutes
- **Dev layout**: `dev ~/project` - Opens vim + terminal split

### Extras
- JetBrainsMono Nerd Font (for icons)
- Tmux Plugin Manager (TPM)
- Cheatsheets for quick reference

## Usage

### Start Dev Session
```bash
dev ~/your/project
```

Creates a layout:
```
+------------------+------------+
|                  |   claude   |
|      nvim        +------------+
|                  |  terminal  |
+------------------+------------+
```

### Neovim Shortcuts

| Key | Action |
|-----|--------|
| `Space ff` | Find files |
| `Space fs` | Search text |
| `Space ee` | Toggle file tree |
| `gd` | Go to definition |
| `K` | Show documentation |
| `Space ca` | Code actions |

### Tmux Shortcuts

| Key | Action |
|-----|--------|
| `Ctrl+a \|` | Split vertical |
| `Ctrl+a -` | Split horizontal |
| `Ctrl+a h/j/k/l` | Navigate panes |
| `Ctrl+a d` | Detach session |

## Requirements

- Neovim 0.9+
- Tmux 3.0+
- Git
- Node.js (for LSP servers)
- A terminal that supports Nerd Fonts

## Manual Installation

```bash
git clone https://github.com/sherhonbeknuraliyev/dev-config.git
cd dev-config
./install.sh
```

## Cheatsheets

- [Neovim Cheatsheet](nvim/CHEATSHEET.md)
- [Tmux Cheatsheet](tmux/CHEATSHEET.md)
