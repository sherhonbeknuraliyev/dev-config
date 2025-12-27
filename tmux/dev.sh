#!/bin/bash
# Dev Session Launcher
# Creates a tmux session with: vim (left), claude (top-right), terminal (bottom-right)

SESSION="dev"
WORK_DIR="${1:-$(pwd)}"

# Resolve to absolute path
WORK_DIR="$(cd "$WORK_DIR" 2>/dev/null && pwd)"

if [ -z "$WORK_DIR" ]; then
    echo "Error: Directory does not exist"
    exit 1
fi

# Kill existing dev session if exists
tmux kill-session -t $SESSION 2>/dev/null

# Create new session (window 1, pane 1 - left side for nvim)
tmux new-session -d -s $SESSION -c "$WORK_DIR"

# Split horizontally: creates pane 2 (right side for claude)
tmux split-window -h -t $SESSION -c "$WORK_DIR" -l 40%

# Split pane 2 vertically: creates pane 3 (bottom-right for terminal)
tmux split-window -v -t $SESSION -c "$WORK_DIR" -l 40%

# Send commands to panes (1-based indexing)
# Pane 1 (left): nvim
tmux send-keys -t $SESSION:1.1 "nvim ." Enter

# Pane 2 (top-right): claude
tmux send-keys -t $SESSION:1.2 "claude" Enter

# Pane 3 (bottom-right): terminal stays as shell

# Focus on nvim pane
tmux select-pane -t $SESSION:1.1

# Attach to session
tmux attach-session -t $SESSION
