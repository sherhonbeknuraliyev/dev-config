# Tmux Cheatsheet

Prefix: `Ctrl+a`

## Starting Sessions

```bash
# Start dev layout (vim + claude + terminal)
~/.tmux/dev.sh

# Or from a specific directory
~/.tmux/dev.sh /path/to/project

# Regular session
tmux new -s name
tmux attach -t name
tmux ls
```

## Sessions

| Key | Action |
|-----|--------|
| `prefix + d` | Detach |
| `prefix + $` | Rename session |
| `prefix + s` | List sessions |
| `prefix + (` | Previous session |
| `prefix + )` | Next session |

## Windows

| Key | Action |
|-----|--------|
| `prefix + c` | New window |
| `prefix + ,` | Rename window |
| `prefix + w` | List windows |
| `prefix + n` | Next window |
| `prefix + p` | Previous window |
| `prefix + 1-9` | Go to window # |
| `Shift + Left/Right` | Prev/Next window (no prefix) |
| `prefix + Tab` | Last window |
| `prefix + X` | Kill window |
| `prefix + <` | Move window left |
| `prefix + >` | Move window right |

## Panes

| Key | Action |
|-----|--------|
| `prefix + \|` | Split vertical |
| `prefix + -` | Split horizontal |
| `prefix + v` | Split vertical |
| `prefix + s` | Split horizontal |
| `prefix + h/j/k/l` | Navigate panes (vim) |
| `Alt + Arrow` | Navigate panes (no prefix) |
| `prefix + Ctrl+h/j/k/l` | Resize pane |
| `prefix + Arrow` | Resize pane |
| `prefix + x` | Kill pane |
| `prefix + z` | Toggle zoom |
| `prefix + !` | Pane to window |
| `prefix + q` | Show pane numbers |
| `prefix + o` | Next pane |
| `prefix + Space` | Cycle layouts |

## Copy Mode (Vi style)

| Key | Action |
|-----|--------|
| `prefix + Enter` | Enter copy mode |
| `v` | Start selection |
| `y` | Copy to clipboard |
| `Escape` | Cancel |
| `/` | Search forward |
| `?` | Search backward |
| `n/N` | Next/Prev match |

## Dev Layout

| Key | Action |
|-----|--------|
| `prefix + D` | Apply dev layout |

Layout:
```
+------------------+------------+
|                  |   claude   |
|      nvim        +------------+
|                  |  terminal  |
+------------------+------------+
```

## Other

| Key | Action |
|-----|--------|
| `prefix + r` | Reload config |
| `prefix + ?` | List all bindings |
| `prefix + t` | Show time |
| `prefix + :` | Command prompt |

## Persistence

Sessions are automatically saved every 15 minutes.

| Key | Action |
|-----|--------|
| `prefix + Ctrl+s` | Save session |
| `prefix + Ctrl+r` | Restore session |

## Command Line

```bash
# List sessions
tmux ls

# Kill session
tmux kill-session -t name

# Kill server (all sessions)
tmux kill-server

# Install plugins (first time)
# Press: prefix + I
```

## First Time Setup

```bash
# Install plugins (inside tmux)
# Press: prefix + I

# Or manually
~/.tmux/plugins/tpm/bin/install_plugins
```
