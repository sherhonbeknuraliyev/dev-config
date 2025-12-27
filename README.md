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
- **Dev layout**: `dev ~/project` - Opens vim + claude + terminal

### Extras
- JetBrainsMono Nerd Font (for icons)
- Tmux Plugin Manager (TPM)
- Cheatsheets for quick reference

---

## Platform-Specific Setup

### macOS

#### Prerequisites
```bash
# Install Homebrew (if not installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install dependencies
brew install neovim tmux git curl ripgrep fd node python3 go
```

#### Set Terminal Font
**iTerm2:**
1. Preferences → Profiles → Text
2. Font → Select "JetBrainsMono Nerd Font"

**Terminal.app:**
1. Preferences → Profiles → Font
2. Change → Select "JetBrainsMono Nerd Font"

**Alacritty** (`~/.config/alacritty/alacritty.toml`):
```toml
[font.normal]
family = "JetBrainsMono Nerd Font"
size = 14.0
```

**Kitty** (`~/.config/kitty/kitty.conf`):
```
font_family JetBrainsMono Nerd Font
font_size 14.0
```

**Warp:**
1. Settings → Appearance → Terminal font
2. Select "JetBrainsMono Nerd Font"

#### macOS Key Remapping (Optional)
For better tmux experience, remap Caps Lock to Ctrl:
1. System Preferences → Keyboard → Modifier Keys
2. Caps Lock → Control

---

### Linux (Ubuntu/Debian)

#### Prerequisites
```bash
sudo apt update
sudo apt install neovim tmux git curl unzip ripgrep fd-find nodejs npm python3 python3-pip golang-go xclip
```

#### Set Terminal Font
**GNOME Terminal:**
1. Preferences → Profile → Custom font
2. Select "JetBrainsMono Nerd Font"

**Konsole:**
1. Settings → Edit Profile → Appearance → Font
2. Select "JetBrainsMono Nerd Font"

**Alacritty** (`~/.config/alacritty/alacritty.toml`):
```toml
[font.normal]
family = "JetBrainsMono Nerd Font"
size = 12.0
```

**Kitty** (`~/.config/kitty/kitty.conf`):
```
font_family JetBrainsMono Nerd Font
font_size 12.0
```

---

### Linux (Fedora/RHEL)

#### Prerequisites
```bash
sudo dnf install neovim tmux git curl unzip ripgrep fd-find nodejs npm python3 python3-pip golang xclip
```

---

## Usage

### Start Dev Session
```bash
dev ~/your/project
```

Creates this layout:
```
+------------------+------------+
|                  |   claude   |
|      nvim        +------------+
|      (60%)       |  terminal  |
+------------------+------------+
```

### Neovim Shortcuts

#### File Navigation
| Key | Action |
|-----|--------|
| `Space ff` | Find files |
| `Space fs` | Search text in files |
| `Space fr` | Recent files |
| `Space ee` | Toggle file tree |
| `Space ef` | Find current file in tree |

#### Code Navigation (LSP)
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `gi` | Go to implementation |
| `K` | Show documentation |
| `Space ca` | Code actions |
| `Space rn` | Rename symbol |
| `[d` / `]d` | Previous/Next diagnostic |

#### Editing
| Key | Action |
|-----|--------|
| `Space mp` | Format file |
| `gcc` | Toggle line comment |
| `gc` (visual) | Toggle block comment |

#### Git
| Key | Action |
|-----|--------|
| `]c` / `[c` | Next/Previous change |
| `Space hp` | Preview hunk |
| `Space hs` | Stage hunk |
| `Space hr` | Reset hunk |
| `Space tb` | Toggle git blame |

### Tmux Shortcuts

| Key | Action |
|-----|--------|
| `Ctrl+a \|` | Split vertical |
| `Ctrl+a -` | Split horizontal |
| `Ctrl+a h/j/k/l` | Navigate panes |
| `Alt+Arrow` | Navigate panes (no prefix) |
| `Ctrl+a z` | Toggle pane zoom |
| `Ctrl+a d` | Detach session |
| `Ctrl+a x` | Kill pane |
| `Ctrl+a c` | New window |
| `Ctrl+a r` | Reload config |
| `Ctrl+a I` | Install plugins |

---

## Post-Installation

### 1. Reload Shell
```bash
source ~/.bashrc  # or source ~/.zshrc
```

### 2. Open Neovim
```bash
nvim
```
Plugins will auto-install on first launch. Wait for it to complete.

### 3. Install Tmux Plugins
```bash
tmux
# Press: Ctrl+a then I (capital i)
```

### 4. Verify LSP Servers
Open Neovim and run:
```vim
:Mason
```
All language servers should show as installed.

---

## Manual Installation

```bash
git clone https://github.com/sherhonbeknuraliyev/dev-config.git
cd dev-config
./install.sh
```

## Updating

```bash
cd ~/path/to/dev-config
git pull
./install.sh
```

---

## Troubleshooting

### Icons not showing
- Make sure your terminal font is set to "JetBrainsMono Nerd Font"
- Restart your terminal after changing fonts

### LSP not working
```vim
:LspInfo    " Check LSP status
:Mason      " Check/install language servers
```

### Neovim plugins not loading
```vim
:Lazy sync  " Sync plugins
:Lazy       " Open plugin manager
```

### Tmux plugins not working
```bash
# Inside tmux, press:
# Ctrl+a then I (capital i)

# Or manually:
~/.tmux/plugins/tpm/bin/install_plugins
```

### Clipboard not working (Linux)
```bash
# Install xclip
sudo apt install xclip  # Debian/Ubuntu
sudo dnf install xclip  # Fedora
```

### Clipboard not working (macOS SSH)
Make sure you're using iTerm2 with "Applications in terminal may access clipboard" enabled.

---

## Cheatsheets

- [Neovim Cheatsheet](nvim/CHEATSHEET.md)
- [Tmux Cheatsheet](tmux/CHEATSHEET.md)

---

## License

MIT
