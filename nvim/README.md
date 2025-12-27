# Neovim Setup

A modern Neovim configuration with LSP, autocompletion, fuzzy finding, and more.

## Directory Structure

```
nvim-setup/
├── init.lua                 # Main entry point
├── lua/
│   ├── core/
│   │   ├── options.lua     # Neovim options
│   │   └── keymaps.lua     # Key mappings
│   └── plugins/            # Plugin configurations
│       ├── colorscheme.lua
│       ├── treesitter.lua
│       ├── telescope.lua
│       ├── nvim-tree.lua
│       ├── lsp.lua
│       ├── mason.lua
│       ├── nvim-cmp.lua
│       ├── formatting.lua
│       ├── linting.lua
│       ├── gitsigns.lua
│       ├── lualine.lua
│       ├── autopairs.lua
│       ├── comment.lua
│       ├── bufferline.lua
│       ├── indent-blankline.lua
│       └── which-key.lua
```

## Installation

1. **Backup your existing Neovim configuration:**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Copy this configuration:**
   ```bash
   cp -r /home/lion/nvim-setup ~/.config/nvim
   ```

3. **Open Neovim:**
   ```bash
   nvim
   ```
   
   The plugin manager (lazy.nvim) will automatically install all plugins on first launch.

4. **Install Language Servers:**
   - Open Neovim
   - Type `:Mason` to open the Mason installer
   - Language servers will be automatically installed based on the configuration

## Features

### Core Features
- **Leader key:** Space
- **Plugin Manager:** lazy.nvim
- **Colorscheme:** Tokyo Night
- **Line numbers:** Relative line numbers enabled
- **Auto-save:** Undo history preserved
- **AI Assistant:** GitHub Copilot integration with chat

### Plugins Included

1. **Treesitter** - Better syntax highlighting
2. **Telescope** - Fuzzy finder for files, grep, and more
3. **Nvim-tree** - File explorer
4. **LSP Support** - Language Server Protocol integration
5. **Mason** - LSP/formatter/linter installer
6. **Nvim-cmp** - Autocompletion
7. **Conform** - Code formatting
8. **Nvim-lint** - Linting
9. **Gitsigns** - Git integration
10. **Lualine** - Status line
11. **Bufferline** - Buffer tabs
12. **Autopairs** - Auto close brackets
13. **Comment** - Easy commenting
13. **Indent-blankline** - Indentation guides
14. **Which-key** - Keybinding hints

## Key Mappings

> See [CHEATSHEET.md](CHEATSHEET.md) for a complete reference

### General
- `jk` - Exit insert mode
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>nh` - Clear search highlights

### File Explorer (Nvim-tree)
- `<leader>ee` - Toggle file explorer
- `<leader>ef` - Find file in explorer
- `<leader>ec` - Collapse file explorer
- `<leader>er` - Refresh file explorer

### Telescope (Fuzzy Finder)
- `<leader>ff` - Find files
- `<leader>fr` - Recent files
- `<leader>fs` - Live grep
- `<leader>fc` - Find word under cursor
- `<leader>fb` - Find buffers
- `<leader>fh` - Help tags

### Window Management
- `<leader>sv` - Split vertically
- `<leader>sh` - Split horizontally
- `<leader>se` - Make splits equal
- `<leader>sx` - Close split

### Tab Management
- `<leader>to` - New tab
- `<leader>tx` - Close tab
- `<leader>tn` - Next tab
- `<leader>tp` - Previous tab

### Buffer Navigation
- `Shift+L` - Next buffer
- `Shift+H` - Previous buffer

### LSP
- `gR` - Show references
- `gD` - Go to declaration
- `gd` - Go to definition
- `gi` - Go to implementation
- `gt` - Go to type definition
- `<leader>ca` - Code actions
- `<leader>rn` - Rename
- `<leader>d` - Show line diagnostics
- `[d` - Previous diagnostic
- `]d` - Next diagnostic
- `K` - Show documentation

### Git (Gitsigns)
- `]c` - Next hunk
- `[c` - Previous hunk
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hp` - Preview hunk
- `<leader>hb` - Blame line
- `<leader>tb` - Toggle blame line

### Formatting & Linting
- `<leader>mp` - Format file
- `<leader>l` - Trigger linting

### Comment
- `gcc` - Toggle line comment
- `gc` (visual mode) - Toggle block comment

## Language Support

Pre-configured language servers (auto-installed via Mason):
- **C/C++** (clangd) - Full IntelliSense, formatting with clang-format
- **Go** (gopls) - Full support with gofumpt, goimports, golangci-lint
- **Rust** (rust_analyzer) - Full support with rustfmt and clippy
- **Lua** (lua_ls) - Neovim-aware configuration
- **TypeScript/JavaScript** (tsserver) - Full support with prettier, eslint
- **HTML/CSS** (html, cssls)
- **Tailwind CSS** (tailwindcss)
- **Python** (pyright) - With black, isort, pylint

## Customization

- Edit `lua/core/options.lua` for Neovim options
- Edit `lua/core/keymaps.lua` for key mappings
- Add/remove plugins in `lua/plugins/`
- Modify `lua/plugins/mason.lua` to install additional language servers

## Requirements

### Essential
- **Neovim >= 0.9.0** (tested with 0.9.5)
- **Git** (required for plugin manager)
- **Node.js** (required for GitHub Copilot and many LSP servers)

### Recommended
- **A Nerd Font** (for icons) - [Download here](https://www.nerdfonts.com/)
- **ripgrep** (for Telescope live grep) - `sudo apt install ripgrep`
- **Python 3** (for some LSP servers and formatters)

### Language-Specific Tools
- **C/C++**: clang, clang-format
- **Go**: go toolchain
- **Rust**: rust toolchain (rustup)
- **Python**: pip (for installing black, isort, pylint)

## Troubleshooting

If you encounter issues:
1. Run `:checkhealth` in Neovim
2. Run `:Lazy sync` to update plugins
3. Run `:Mason` to check language server installations
4. For Copilot issues, run `:Copilot status` and `:Copilot auth`
5. Check logs at `~/.local/state/nvim/`

### Common Issues

**Copilot not working:**
```vim
:Copilot auth
:Copilot status
```

**Language servers not starting:**
```vim
:Mason
:LspInfo
```

**C++ includes not found:**
- Make sure your project has a `compile_commands.json` or `.clangd` config
- Run: `cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1`

Enjoy your Neovim setup! 🚀
