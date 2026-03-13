#!/bin/bash
# Check if we're in a terminal already
if [ -t 0 ]; then
    # We're in a terminal, check if tmux is running
    if tmux has-session -t neovim 2>/dev/null; then
        # Use existing tmux session
        if [ $# -gt 0 ]; then
            for file in "$@"; do
                tmux new-window -t neovim "nvim \"$file\""
            done
        else
            tmux new-window -t neovim "nvim"
        fi
        tmux attach -t neovim
    else
        # Start new tmux session
        if [ $# -gt 0 ]; then
            tmux new-session -s neovim "nvim \"$1\""
        else
            tmux new-session -s neovim "nvim"
        fi
    fi
else
    # We're not in a terminal (GUI launch), use Kitty
    # Check for existing Kitty instance
    KITTY_PID=$(pidof kitty | head -n1)
    
    if [ -n "$KITTY_PID" ]; then
        # Use existing Kitty
        if [ $# -gt 0 ]; then
            for file in "$@"; do
                kitty @ --to "unix:/tmp/kitty-$KITTY_PID" \
                    send-text "tmux new-window 'nvim \"$file\"'\x0d"
            done
        else
            kitty @ --to "unix:/tmp/kitty-$KITTY_PID" \
                send-text "tmux new-window 'nvim'\x0d"
        fi
        kitty @ --to "unix:/tmp/kitty-$KITTY_PID" focus-window
    else
        # Start new Kitty with tmux
        if [ $# -gt 0 ]; then
            kitty -e tmux new-session -s neovim "nvim \"$1\""
        else
            kitty -e tmux new-session -s neovim "nvim"
        fi
    fi
fi
