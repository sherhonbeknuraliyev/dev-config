# Neovim IDE Cheatsheet

Leader key: `Space`

## Navigation

| Key | Action |
|-----|--------|
| `h/j/k/l` | Left/Down/Up/Right |
| `w/b` | Next/Previous word |
| `0/$` | Start/End of line |
| `gg/G` | Start/End of file |
| `Ctrl+d/u` | Page down/up (centered) |
| `{/}` | Previous/Next paragraph |
| `%` | Jump to matching bracket |

## Editing

| Key | Action |
|-----|--------|
| `i/a` | Insert before/after cursor |
| `I/A` | Insert at start/end of line |
| `o/O` | New line below/above |
| `x` | Delete character |
| `dd` | Delete line |
| `yy` | Yank (copy) line |
| `p/P` | Paste after/before |
| `u` | Undo |
| `Ctrl+r` | Redo |
| `.` | Repeat last command |
| `ciw` | Change inner word |
| `di"` | Delete inside quotes |
| `va{` | Select around braces |

## Visual Mode

| Key | Action |
|-----|--------|
| `v` | Visual mode (char) |
| `V` | Visual mode (line) |
| `Ctrl+v` | Visual block mode |
| `J/K` | Move selection down/up |
| `</>`| Indent left/right (stays in visual) |
| `p` | Paste (without yanking replaced text) |

## Search

| Key | Action |
|-----|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n/N` | Next/Previous match (centered) |
| `*/#` | Search word under cursor |
| `<leader>nh` | Clear search highlight |

## Windows

| Key | Action |
|-----|--------|
| `<leader>sv` | Split vertical |
| `<leader>sh` | Split horizontal |
| `<leader>se` | Equal size splits |
| `<leader>sx` | Close split |
| `Ctrl+h/j/k/l` | Navigate windows |
| `Ctrl+Up/Down` | Resize height |
| `Ctrl+Left/Right` | Resize width |

## Buffers & Tabs

| Key | Action |
|-----|--------|
| `Shift+L` | Next buffer |
| `Shift+H` | Previous buffer |
| `<leader>to` | New tab |
| `<leader>tx` | Close tab |
| `<leader>tn` | Next tab |
| `<leader>tp` | Previous tab |

## File Explorer (NvimTree)

| Key | Action |
|-----|--------|
| `<leader>ee` | Toggle explorer |
| `<leader>ef` | Find current file |
| `<leader>ec` | Collapse all |
| `<leader>er` | Refresh |

**Inside NvimTree:**
| Key | Action |
|-----|--------|
| `Enter` | Open file |
| `o` | Open file |
| `v` | Open in vsplit |
| `s` | Open in split |
| `a` | Create file/folder |
| `d` | Delete |
| `r` | Rename |
| `x` | Cut |
| `c` | Copy |
| `p` | Paste |
| `H` | Toggle hidden files |

## Telescope (Fuzzy Finder)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fr` | Recent files |
| `<leader>fs` | Live grep (search text) |
| `<leader>fc` | Find word under cursor |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Help tags |

**Inside Telescope:**
| Key | Action |
|-----|--------|
| `Ctrl+j/k` | Move down/up |
| `Ctrl+c` or `Esc` | Close |
| `Enter` | Select |
| `Ctrl+x` | Open in split |
| `Ctrl+v` | Open in vsplit |

## LSP (Code Intelligence)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Show references |
| `gi` | Go to implementation |
| `gt` | Go to type definition |
| `K` | Hover documentation |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>d` | Line diagnostics |
| `<leader>D` | Buffer diagnostics |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>rs` | Restart LSP |

## Completion (nvim-cmp)

| Key | Action |
|-----|--------|
| `Ctrl+Space` | Trigger completion |
| `Ctrl+j/k` | Next/Previous item |
| `Enter` | Confirm selection |
| `Ctrl+e` | Close menu |
| `Tab` | Next item / expand snippet |
| `Shift+Tab` | Previous item |

## Formatting & Linting

| Key | Action |
|-----|--------|
| `<leader>mp` | Format file/selection |
| `<leader>l` | Trigger linting |

*Format on save is enabled by default*

## Git (Gitsigns)

| Key | Action |
|-----|--------|
| `]c` | Next hunk |
| `[c` | Previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>tb` | Toggle blame |

## Comments

| Key | Action |
|-----|--------|
| `gcc` | Toggle line comment |
| `gc` (visual) | Toggle block comment |
| `gbc` | Toggle block comment |

## General

| Key | Action |
|-----|--------|
| `jk` | Exit insert mode |
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `:Mason` | Open Mason (LSP installer) |
| `:Lazy` | Open plugin manager |
| `:checkhealth` | Check Neovim health |

---

## Language Support

| Language | LSP | Formatter | Linter |
|----------|-----|-----------|--------|
| Go | gopls | gofumpt, goimports | golangci-lint |
| TypeScript | tsserver | prettier | eslint_d |
| Python | pyright | black, isort | pylint |
| C/C++ | clangd | clang-format | clang-tidy |
| Lua | lua_ls | stylua | - |
| Rust | rust_analyzer | rustfmt | clippy |

---

## Quick Reference

```
Files:      <leader>ff (find) | <leader>fs (grep) | <leader>ee (tree)
Code:       gd (definition) | K (hover) | <leader>ca (actions)
Git:        ]c [c (hunks) | <leader>hs (stage) | <leader>hb (blame)
Format:     <leader>mp (format) | auto on save
Windows:    <leader>sv/sh (split) | Ctrl+hjkl (navigate)
```
